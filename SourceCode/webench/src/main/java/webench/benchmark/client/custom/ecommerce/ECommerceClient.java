package webench.benchmark.client.custom.ecommerce;

import webench.benchmark.client.Client;
import webench.benchmark.client.StatefulClientContext;
import webench.data.IdGenerator;
import webench.meta.APIEndpoint;
import webench.meta.APIType;
import com.google.common.base.Joiner;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public abstract class ECommerceClient implements Client {
  private static final Logger logger = LogManager.getLogger();
  // each user should have a login state
  // if the user does not have a login state, create one and perform login, then store the
  // credential in memory
  private static final Map<Integer, StatefulClientContext> userContext = new ConcurrentHashMap<>();

  static {
    //    Configurator.setLevel(logger.getName(), Level.DEBUG);
  }

  @Override
  public void invokeBlocking(
          APIEndpoint endpoint, Consumer<Callable<APIType>> apiInvokeHandler, Object... args) {
    logger.debug(
        "Invoking "
            + endpoint.getApiType().name()
            + " with parameters "
            + Joiner.on(",").join(args));
    assert args.length == 2;
    final int productId = (int) args[0];
    final int userId = (int) args[1];
    final StatefulClientContext clientContext = getRequestContext(userId);
    switch (endpoint.getApiType()) {
      case VIEW:
        apiInvokeHandler.accept(
            () -> {
              getItemDetails("product", String.valueOf(productId), false, clientContext);
              return APIType.VIEW;
            });
        break;
      case ADD:
        synchronized (userContext.get(userId)) {
          apiInvokeHandler.accept(
              () -> {
                invokeAddCartWithItemPopulation(productId, clientContext);
                return APIType.ADD;
              });
        }
        break;
      case PURCHASE:
        // if the cart is empty, add one product first
        synchronized (userContext.get(userId)) {
          if (clientContext.getAddedItemIds().isEmpty()) {
            apiInvokeHandler.accept(
                () -> {
                  invokeAddCartWithItemPopulation(productId, clientContext);
                  return APIType.ADD;
                });
          }
          final Set<Integer> addedItemIds = clientContext.getAddedItemIds();
          if (addedItemIds.isEmpty())
            throw new RuntimeException(
                "Unexpected empty cart "
                    + clientContext.getCartId()
                    + " for user "
                    + clientContext.getUserName());
          apiInvokeHandler.accept(
              () -> {
                checkout(clientContext.getCartId(), clientContext);
                return APIType.PURCHASE;
              });
          addedItemIds.clear();
          apiInvokeHandler.accept(
              () -> {
                createCartIfNotExist(clientContext);
                return APIType.GETCART;
              });
          break;
        }
      case REMOVE:
        if (clientContext.getAddedItemIds().isEmpty()) return;
        synchronized (userContext.get(userId)) {
          final Set<Integer> addedItemIds = clientContext.getAddedItemIds();
          final Optional<Integer> first = addedItemIds.stream().findFirst();
          if (!first.isPresent()) {
            logger.debug("Cart empty for user " + userId + ", skipping the request");
          }
          final Integer itemId = first.get();
          apiInvokeHandler.accept(
              () -> {
                removeItemFromCart(itemId, clientContext);
                return APIType.REMOVE;
              });
          addedItemIds.remove(itemId);
          break;
        }
    }
  }

  private void invokeAddCartWithItemPopulation(
      long productId, StatefulClientContext clientContext) {
    final List<Integer> items = addItemToCart(productId, clientContext);
    if (items.isEmpty())
      throw new RuntimeException(
          "Invalid empty cart after adding product " + productId + " to cart");
    clientContext.getAddedItemIds().addAll(items);
  }

  private StatefulClientContext getRequestContext(int userId) {
    userContext.computeIfAbsent(
        userId,
        id ->
            new StatefulClientContext(
                IdGenerator.userNameFromId(id), IdGenerator.userPasswordFromId(id)));
    final StatefulClientContext clientContext = Objects.requireNonNull(userContext.get(userId));
    if (!clientContext.isInitialized()) {
      logger.warn("Initializing client with user info " + clientContext.getUserName());
      synchronized (clientContext) {
        if (clientContext.isInitialized()) return Objects.requireNonNull(clientContext);
        initializeUserContext(clientContext);
        clientContext.setInitialized(true);
      }
    }
    return Objects.requireNonNull(clientContext);
  }

  protected final CloseableHttpClient httpClient;

  public ECommerceClient() {
    this.httpClient = HttpClients.createDefault();
  }

  public abstract void initializeUserContext(StatefulClientContext context);

  public abstract void createCartIfNotExist(StatefulClientContext context);

  public abstract List<Integer> addItemToCart(long productId, StatefulClientContext context);

  public abstract List<Integer> addItemToCart(
      long productId,
      String colorAttr,
      String sizeAttr,
      String nameAttr,
      StatefulClientContext context);

  public abstract boolean removeItemFromCart(long itemId, StatefulClientContext context);

  public abstract boolean getItemDetails(
      String category,
      String item,
      Boolean includePromotionMessages,
      StatefulClientContext context);

  // checkout a shopping cart and returns the order id
  public abstract String checkout(long cartId, StatefulClientContext context);
}
