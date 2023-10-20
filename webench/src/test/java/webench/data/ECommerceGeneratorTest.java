package webench.data;

import static webench.meta.workload.WorkloadHelper.extractDistribution;
import static webench.meta.workload.WorkloadHelper.getLinesFromResource;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import webench.data.IdGenerator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ECommerceGeneratorTest {
  private Connection connection;

  @BeforeEach
  public void prepare() throws SQLException {
    connection = mock(Connection.class);
    final PreparedStatement ps = mock(PreparedStatement.class);
    when(connection.prepareStatement(anyString())).thenReturn(ps);
  }

  @Test
  public void testGenerateIdDistribution() {
    int loopNum = 100000;
    final Random random = new Random(42);
    long cnt1, cnt2, cnt3, cnt4;
    cnt1 = cnt2 = cnt3 = cnt4 = 0;
    for (int i = 0; i < loopNum; i++) {
      final int nextId =
          IdGenerator.nextIntByDistribution(10, Arrays.asList(20d, 20d, 30d, 30d), random);
      if (nextId < 2) {
        cnt1++;
      } else if (nextId < 4) {
        cnt2++;
      } else if (nextId < 7) {
        cnt3++;
      } else {
        cnt4++;
      }
    }
    int maxDelta = (int) (loopNum * 0.01);
    Assertions.assertTrue(cnt1 < (loopNum * 0.2) + maxDelta && cnt1 > (loopNum * 0.2) - maxDelta);
    Assertions.assertTrue(cnt2 < (loopNum * 0.2) + maxDelta && cnt2 > (loopNum * 0.2) - maxDelta);
    Assertions.assertTrue(cnt3 < (loopNum * 0.3) + maxDelta && cnt3 > (loopNum * 0.3) - maxDelta);
    Assertions.assertTrue(cnt4 < (loopNum * 0.3) + maxDelta && cnt4 > (loopNum * 0.3) - maxDelta);
  }

  @Test
  public void testGenerateIdDisFromFile() {
    final List<String> productsPerBrand =
        getLinesFromResource("data/eCommerce/products_per_brand.data");
    final List<Double> productsPercentilePerBrand = extractDistribution(productsPerBrand);
    final String line1 = productsPerBrand.get(0);
    final double percentileNotHaveBrand = Double.parseDouble(line1.split("\t")[1]) / 100;
    final double percentileHaveBrand = 1 - percentileNotHaveBrand;
    final Random random = new Random(42);

    final int numBrands = 500;
    final int numProduct = 1000000;
    int cnt1 = 0, cnt2 = 0;

    for (int i = 0; i < numProduct; i++) {
      final int brandId =
          IdGenerator.nextIntByDistribution(numBrands, productsPercentilePerBrand, random);
      if (brandId <= numBrands / productsPercentilePerBrand.size()) {
        cnt1++;
      } else {
        cnt2++;
      }
      random.nextInt();
    }
    int maxDelta = (int) (numProduct * 0.01);
    Assertions.assertTrue(
        cnt1 < (numProduct * percentileNotHaveBrand) + maxDelta
            && cnt1 > (numProduct * percentileNotHaveBrand) - maxDelta);
    Assertions.assertTrue(
        cnt2 < (numProduct * percentileHaveBrand) + maxDelta
            && cnt2 > (numProduct * percentileHaveBrand) - maxDelta);
  }

  @Test
  public void testGenerateIdPerformance() {
    final Random random = new Random(42);
    int loopNum = 1_000_000;
    Assertions.assertTimeout(
        Duration.ofSeconds(1),
        () -> {
          final List<Double> distributions = Arrays.asList(20d, 20d, 30d, 30d);
          for (int i = 0; i < loopNum; i++) {
            IdGenerator.nextIntByDistribution(10, distributions, random);
          }
        });
  }
}
