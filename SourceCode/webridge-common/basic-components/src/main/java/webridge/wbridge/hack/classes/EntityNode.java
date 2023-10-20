package webridge.wbridge.hack.classes;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class EntityNode implements Serializable {
  private final String name;
  private final Set<EntityNode> parents = new HashSet<>();
  private final Set<EntityNode> children = new HashSet<>();

  public EntityNode(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public boolean isRoot() {
    return parents.isEmpty();
  }

  public void addParent(EntityNode node) {
    parents.add(node);
  }

  public void addChild(EntityNode node) {
    children.add(node);
  }

  public Set<EntityNode> getChildren() {
    return children;
  }

  public Set<EntityNode> getParents() {
    return parents;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null) return false;
    if (!(obj instanceof EntityNode)) return false;
    if (((EntityNode) obj).name == null && this.name == null) return true;
    if (((EntityNode) obj).name == null || this.name == null) return false;
    return ((EntityNode) obj).name.equals(this.name);
  }

  @Override
  public int hashCode() {
    return name != null ? name.hashCode() : 0;
  }
}
