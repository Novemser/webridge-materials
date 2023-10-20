package webridge.hack.classes;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class EntityHierarchyManager {
  private static final Map<String, EntityNode> hierarchyInfo = new HashMap<>();

  public static void registerHierarchyInfo(Map<String, EntityNode> hierarchyInfo) {
    assert hierarchyInfo != null;
    EntityHierarchyManager.hierarchyInfo.putAll(hierarchyInfo);
  }

  public static Map<String, EntityNode> getHierarchyInfo() {
    return hierarchyInfo;
  }

  public static EntityNode getHierarchyInfo(String tableName) {
    return hierarchyInfo.get(tableName);
  }

  public static Set<EntityNode> getAllParentNodes(EntityNode entityNode) {
    final Set<EntityNode> res = new HashSet<>();
    entityNode
        .getParents()
        .forEach(
            e -> {
              res.add(e);
              res.addAll(getAllParentNodes(e));
            });
    return res;
  }
}
