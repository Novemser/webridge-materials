
# Config
# ------------------------------------------------------------
INSERT INTO `ServerConfig` (`Key`, `Cluster`, `Value`, `Comment`)
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔'),
    ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关'),
    ('item.key.length.limit', 'default', '128', 'item key 最大长度限制'),
    ('item.value.length.limit', 'default', '20000', 'item value最大长度限制'),
    ('config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！');

# Sample Data
# ------------------------------------------------------------
INSERT INTO `App` (`AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`)
VALUES
  ('SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com');

INSERT INTO `AppNamespace` (`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    ('application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO `Cluster` (`Name`, `AppId`)
VALUES
    ('default', 'SampleApp');

INSERT INTO `Namespace` (`Id`, `AppId`, `ClusterName`, `NamespaceName`)
VALUES
    (1, 'SampleApp', 'default', 'application');


INSERT INTO `Item` (`NamespaceId`, `Key`, `Value`, `Comment`, `LineNum`)
VALUES
    (1, 'timeout', '100', 'sample timeout配置', 1);

INSERT INTO `Release` (`ReleaseKey`, `Name`, `Comment`, `AppId`, `ClusterName`, `NamespaceName`, `Configurations`)
VALUES
    ('20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}');

INSERT INTO `ReleaseHistory` (`AppId`, `ClusterName`, `NamespaceName`, `BranchName`, `ReleaseId`, `PreviousReleaseId`, `Operation`, `OperationContext`, `DataChange_CreatedBy`, `DataChange_LastModifiedBy`)
VALUES
    ('SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', 'apollo', 'apollo');

INSERT INTO `ReleaseMessage` (`Message`)
VALUES
    ('SampleApp+default+application');
