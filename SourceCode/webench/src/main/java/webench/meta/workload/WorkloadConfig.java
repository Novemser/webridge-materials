package webench.meta.workload;

import webench.meta.APIEndpoint;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class WorkloadConfig {
  private String appName;
  private String webHost;
  private WorkloadType workloadType;
  private List<APIEndpoint> endpoints;
  // (key: table name value: number of records)
  private Map<String, Integer> totalNumRecords;
  private Map<String, String> underlingTableNameMapping;
  private String schemaDefinitionFileLocation;
  // controls the number of records in each table
  private double scale;
  // whether to stop the benchmark runner immediately when an error occurs
  private boolean failFast = false;
  // XPercentilePerY Indicates the X distribution(in %) for Y.
  // Each element is a double percent value, like 6.2, which means that 1/lst.size() of all users
  // contributes to 6.2% of all the X.
  private List<Double> productPercentilePerCategory;
  private List<Double> viewsPercentilePerUser;
  private List<Double> viewsPercentilePerProduct;
  private List<Double> productsPercentilePerBrand;
  private List<Double> addsPercentilePerUser;
  private List<Double> addsPercentilePerProduct;
  private List<Double> purchasesPercentilePerUser;
  private List<Double> purchasesPercentilePerProduct;
}
