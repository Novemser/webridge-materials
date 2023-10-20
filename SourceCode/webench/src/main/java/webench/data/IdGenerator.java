package webench.data;

import java.util.*;

public class IdGenerator {
  public static String productUrlFromId(Number id) {
    return "/product/" + id;
  }

  public static String userNameFromId(Number id) {
    return id + ".user";
  }

  public static String userPasswordFromId(Number id) {
    return "123";
  }

  public static List<Double> getAccumulatedPercents(List<Double> productsPerCategory) {
    final List<Double> res = new ArrayList<>();
    double accumulate = 0d;
    for (Double val : productsPerCategory) {
      accumulate += val;
      res.add(accumulate);
    }
    return res;
  }

  public static int nextIntByDistribution(
      Integer totalNumberOfIntegers, List<Double> distributions, Random random) {
    // TODO opt
    final List<Double> accumulatedPercents =
        getAccumulatedPercents(Objects.requireNonNull(distributions, "Invalid null distribution"));
    final double next =
        random.nextDouble() * accumulatedPercents.get(accumulatedPercents.size() - 1);
    // TODO binary search
    for (int curIdx = 0, prevIdx = -1; curIdx < accumulatedPercents.size(); curIdx++, prevIdx++) {
      final double prevVal = prevIdx == -1 ? 0 : accumulatedPercents.get(prevIdx);
      final double curVal = accumulatedPercents.get(curIdx);
      // TODO double comparison
      if (next >= prevVal && next < curVal) {
        final double percentFrom = (curIdx * 1.0d) / accumulatedPercents.size();
        final int numOfDataInSegment =
            (int) (totalNumberOfIntegers * (1.0d / accumulatedPercents.size()));
        // randomly choose a value from the segment
        final int id =
            (int)
                (percentFrom * totalNumberOfIntegers
                    + random.nextInt(numOfDataInSegment == 0 ? 1 : numOfDataInSegment));
        assert id <= totalNumberOfIntegers;
        return id;
      }
    }
    throw new RuntimeException();
  }
}
