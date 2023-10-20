package webench.meta.workload;

import webench.meta.APIEndpoint;
import webench.meta.APIType;
import webench.meta.Schema;
import webench.meta.argument.Args;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.NotImplementedException;

public class WorkloadHelper {

  public static List<String> getLinesFromResource(final String resourceName) {
    final InputStream stream =
        WorkloadHelper.class.getClassLoader().getResourceAsStream(resourceName);
    assert stream != null;
    try {
      return IOUtils.readLines(stream, StandardCharsets.UTF_8);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  private static Map<String, String> getTableNameMapping(String appName) {
    final Map<String, String> mapping = new HashMap<>();
    switch (appName) {
      case "broadleaf":
        mapping.put(Schema.TABLE_USER, "BLC_CUSTOMER");
        mapping.put(Schema.TABLE_CATEGORY, "BLC_CATEGORY");
        mapping.put(Schema.TABLE_PRODUCT, "BLC_PRODUCT");
        mapping.put(Schema.TABLE_BRAND, "BLC_PRODUCT_ATTRIBUTE");
        break;
      case "shopizer":
        mapping.put(Schema.TABLE_USER, "CUSTOMER");
        mapping.put(Schema.TABLE_CATEGORY, "CATEGORY");
        mapping.put(Schema.TABLE_PRODUCT, "PRODUCT");
        mapping.put(Schema.TABLE_BRAND, "PRODUCT_TYPE");
        break;
      case "sagan":
        // TODO optional mapping table from the table name defined in `schema.data` to actual
        // application's table name
        break;
      case "pybbs":
        break;
      case "apollo":
        break;
      case "myblog":
        break;
      default:
        throw new NotImplementedException(appName);
    }
    return mapping;
  }

  public static WorkloadConfig getWorkloadConfig(Args args) {
    final WorkloadConfig config = new WorkloadConfig();
    config.setAppName(args.getAppName());
    config.setUnderlingTableNameMapping(getTableNameMapping(args.getAppName()));
    config.setWebHost(args.getWebHost());
    String distBaseDir = args.getDistBaseDir();
    final List<String> schemaData = getLinesFromResource(distBaseDir + "/schema.data");
    final List<String> requestsData = getLinesFromResource(distBaseDir + "/requests.data");
    final List<String> productsPerCategory =
        getLinesFromResource(distBaseDir + "/products_per_category.data");
    final List<String> viewsPerProduct =
        getLinesFromResource(distBaseDir + "/views_per_product.data");
    final List<String> viewsPerUser = getLinesFromResource(distBaseDir + "/views_per_user.data");
    final List<String> productsPerBrand =
        getLinesFromResource(distBaseDir + "/products_per_brand.data");
    final List<String> addsPerProduct =
        getLinesFromResource(distBaseDir + "/adds_per_product.data");
    final List<String> addsPerUser = getLinesFromResource(distBaseDir + "/adds_per_user.data");
    final List<String> purchasesPerProduct =
        getLinesFromResource(distBaseDir + "/purchases_per_product.data");
    final List<String> purchasesPerUser =
        getLinesFromResource(distBaseDir + "/purchases_per_user.data");

    final Map<String, Integer> totNumRecords = new HashMap<>();
    for (String line : schemaData) {
      final String[] pair = line.split("\t");
      assert pair.length == 2;
      final int numRecords = Integer.parseInt(pair[0]);
      final String tableName = pair[1];
      final Integer prev = totNumRecords.put(tableName, numRecords);
      assert prev == null;
    }
    config.setTotalNumRecords(totNumRecords);

    final List<APIEndpoint> endpoints = new ArrayList<>();
    for (String line : requestsData) {
      final String[] pair = line.split("\t");
      assert pair.length == 2;
      final String endpointName = pair[0];
      final double percentile = Double.parseDouble(pair[1]);
      final APIEndpoint apiEndpoint = new APIEndpoint();
      switch (APIType.valueOf(endpointName.toUpperCase())) {
        case ADD:
          apiEndpoint.setApiType(APIType.ADD);
          break;
        case REMOVE:
          apiEndpoint.setApiType(APIType.REMOVE);
          break;
        case VIEW:
          apiEndpoint.setApiType(APIType.VIEW);
          break;
        case PURCHASE:
          apiEndpoint.setApiType(APIType.PURCHASE);
          break;
        case EDITPOST:
          apiEndpoint.setApiType(APIType.EDITPOST);
          break;
        case CREATEPROJECT:
          apiEndpoint.setApiType(APIType.CREATEPROJECT);
          break;
        case EDITPROJECT:
          apiEndpoint.setApiType(APIType.EDITPROJECT);
          break;
        case GETAPIINDEX:
          apiEndpoint.setApiType(APIType.GETAPIINDEX);
          break;
        case GETUSER:
          apiEndpoint.setApiType(APIType.GETUSER);
          break;
        case GETTOP100:
          apiEndpoint.setApiType(APIType.GETTOP100);
          break;
        case GETINDEX:
          apiEndpoint.setApiType(APIType.GETINDEX);
          break;
        case GETAPPS:
          apiEndpoint.setApiType(APIType.GETAPPS);
          break;
        case GETBLOG:
          apiEndpoint.setApiType(APIType.GETBLOG);
          break;
        case EDITBLOG:
          apiEndpoint.setApiType(APIType.EDITBLOG);
          break;
        case SHOWBLOGS:
          apiEndpoint.setApiType(APIType.SHOWBLOGS);
          break;
        default:
          throw new RuntimeException("Illegal endpoint name:" + endpointName);
      }
      apiEndpoint.setRatio(percentile);
      apiEndpoint.setParameters(new ArrayList<>());
      endpoints.add(apiEndpoint);
    }
    config.setEndpoints(endpoints);
    //
    config.setScale(args.getScale());
    config.setWorkloadType(WorkloadType.valueOf(args.getWorkloadType().toUpperCase()));
    config.setSchemaDefinitionFileLocation(args.getApplicationSpecificSchemaDefinition());
    //
    config.setViewsPercentilePerProduct(extractDistribution(viewsPerProduct));
    config.setViewsPercentilePerUser(extractDistribution(viewsPerUser));
    config.setProductPercentilePerCategory(extractDistribution(productsPerCategory));
    config.setProductsPercentilePerBrand(extractDistribution(productsPerBrand));
    config.setAddsPercentilePerProduct(extractDistribution(addsPerProduct));
    config.setAddsPercentilePerUser(extractDistribution(addsPerUser));
    config.setPurchasesPercentilePerProduct(extractDistribution(purchasesPerProduct));
    config.setPurchasesPercentilePerUser(extractDistribution(purchasesPerUser));
    return config;
  }

  public static List<Double> extractDistribution(List<String> productsPerCategory) {
    final List<Double> productsPerCategoryPercents = new ArrayList<>();
    for (String line : productsPerCategory) {
      final String[] pair = line.split("\t");
      assert pair.length == 2;
      final double percent = Double.parseDouble(pair[1]);
      productsPerCategoryPercents.add(percent);
    }
    return productsPerCategoryPercents;
  }
}
