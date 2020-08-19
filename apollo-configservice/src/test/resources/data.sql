INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('100003171','apollo-config-service','刘一鸣','liuym@ctrip.com');
INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('100003172','apollo-admin-service','宋顺','song_s@ctrip.com');
INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('100003173','apollo-portal','张乐','zhanglea@ctrip.com');
INSERT INTO app (app_id, name, owner_name, owner_email) VALUES ('fxhermesproducer','fx-hermes-producer','梁锦华','jhliang@ctrip.com');

INSERT INTO cluster (app_id, name) VALUES ('100003171', 'default');
INSERT INTO cluster (app_id, name) VALUES ('100003171', 'cluster1');
INSERT INTO cluster (app_id, name) VALUES ('100003172', 'default');
INSERT INTO cluster (app_id, name) VALUES ('100003172', 'cluster2');
INSERT INTO cluster (app_id, name) VALUES ('100003173', 'default');
INSERT INTO cluster (app_id, name) VALUES ('100003173', 'cluster3');
INSERT INTO cluster (app_id, name) VALUES ('fxhermesproducer', 'default');

INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003171', 'application');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003171', 'fx.apollo.config');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003172', 'application');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003172', 'fx.apollo.admin');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003173', 'application');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('100003173', 'fx.apollo.portal');
INSERT INTO app_namespace (app_id, namespace_name) VALUES ('fxhermesproducer', 'fx.hermes.producer');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name) VALUES (1, '100003171', 'default', 'application');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name) VALUES (2, 'fxhermesproducer', 'default', 'fx.hermes.producer');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name) VALUES (3, '100003172', 'default', 'application');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name) VALUES (4, '100003173', 'default', 'application');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name) VALUES (5, '100003171', 'default', 'application');

INSERT INTO item (namespace_id, key, value, comment) VALUES (1, 'k1', 'v1', 'comment1');
INSERT INTO item (namespace_id, key, value, comment) VALUES (1, 'k2', 'v2', 'comment2');
INSERT INTO item (namespace_id, key, value, comment) VALUES (2, 'k3', 'v3', 'comment3');
INSERT INTO item (namespace_id, key, value, comment) VALUES (5, 'k3', 'v4', 'comment4');

INSERT INTO release (release_key, name, comment, app_id, cluster_name, namespace_name, configurations) VALUES ('TEST-RELEASE-KEY', 'REV1','First Release','100003171', 'default', 'application', '{"k1":"v1"}');

