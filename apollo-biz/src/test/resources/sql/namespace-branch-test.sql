INSERT INTO app (app_id, name, org_id, org_name, owner_name, owner_email, deleted, created_by, last_modified_by)VALUES('test', 'test0620-06', 'default', 'default', 'default', 'default', false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (1, 'default', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES('child-cluster', 'test', 1, false, 'default', 'default');

INSERT INTO namespace (app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES('test', 'default', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES('test', 'child-cluster', 'application', false, 'apollo', 'apollo');


