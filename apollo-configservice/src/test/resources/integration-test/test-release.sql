INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('someAppId','someAppName','someOwnerName','someOwnerName@ctrip.com');
INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('somePublicAppId','somePublicAppName','someOwnerName','someOwnerName@ctrip.com');

INSERT INTO cluster (app_id, name) VALUES ('someAppId', 'default');
INSERT INTO cluster (app_id, name) VALUES ('someAppId', 'someCluster');
INSERT INTO cluster (app_id, name) VALUES ('somePublicAppId', 'default');
INSERT INTO cluster (app_id, name) VALUES ('somePublicAppId', 'someDC');

INSERT INTO app_namespace (app_id, name, shared) VALUES ('someAppId', 'application', false);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('someAppId', 'someNamespace', true);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('someAppId', 'someNamespace.xml', false);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('someAppId', 'anotherNamespace', false);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('somePublicAppId', 'application', false);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('somePublicAppId', 'somePublicNamespace', true);
INSERT INTO app_namespace (app_id, name, shared) VALUES ('somePublicAppId', 'anotherNamespace', true);

INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('someAppId', 'default', 'application');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('someAppId', 'default', 'someNamespace.xml');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('someAppId', 'default', 'anotherNamespace');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('someAppId', 'someCluster', 'someNamespace');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('somePublicAppId', 'default', 'application');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('somePublicAppId', 'someDC', 'somePublicNamespace');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('someAppId', 'default', 'somePublicNamespace');
INSERT INTO namespace (app_id, cluster_name, namespace_name) VALUES ('somePublicAppId', 'default', 'anotherNamespace');

INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
  VALUES (990, 'TEST-RELEASE-KEY1', 'INTEGRATION-TEST-DEFAULT','First Release','someAppId', 'default', 'application', '{"k1":"v1"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
  VALUES (991, 'TEST-RELEASE-KEY2', 'INTEGRATION-TEST-NAMESPACE','First Release','someAppId', 'someCluster', 'someNamespace', '{"k2":"v2"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
  VALUES (992, 'TEST-RELEASE-KEY3', 'INTEGRATION-TEST-PUBLIC-DEFAULT','First Release','somePublicAppId', 'default', 'somePublicNamespace', '{"k1":"default-v1", "k2":"default-v2"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
 VALUES (993, 'TEST-RELEASE-KEY4', 'INTEGRATION-TEST-PUBLIC-NAMESPACE','First Release','somePublicAppId', 'someDC', 'somePublicNamespace', '{"k1":"someDC-v1", "k2":"someDC-v2"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
 VALUES (989, 'TEST-RELEASE-KEY5', 'INTEGRATION-TEST-PRIVATE-CONFIG-FILE','First Release','someAppId', 'default', 'someNamespace.xml', '{"k1":"v1-file", "k2":"v2-file"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
 VALUES (988, 'TEST-RELEASE-KEY6', 'INTEGRATION-TEST-PRIVATE-CONFIG-FILE','First Release','someAppId', 'default', 'anotherNamespace', '{"k1":"v1-file"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
 VALUES (987, 'TEST-RELEASE-KEY7', 'INTEGRATION-TEST-PUBLIC-CONFIG-FILE','First Release','somePublicAppId', 'default', 'anotherNamespace', '{"k2":"v2-file"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
  VALUES (986, 'TEST-GRAY-RELEASE-KEY1', 'INTEGRATION-TEST-DEFAULT','Gray Release','someAppId', 'gray-branch-1', 'application', '{"k1":"v1-gray"}');
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations)
  VALUES (985, 'TEST-GRAY-RELEASE-KEY2', 'INTEGRATION-TEST-NAMESPACE','Gray Release','somePublicAppId', 'gray-branch-2', 'somePublicNamespace', '{"k1":"gray-v1", "k2":"gray-v2"}');