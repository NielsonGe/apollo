INSERT INTO app ( app_id, name, org_id, org_name, owner_name, owner_email, deleted, created_by, last_modified_by)VALUES('testApp', 'test', 'default', 'default', 'default', 'default', false, 'default', 'default');

INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (1, 'default', 'testApp', 0, false, 'default', 'default');
INSERT INTO cluster (name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES('child-cluster', 'testApp', 1, false, 'default', 'default');

INSERT INTO app_namespace (name, app_id, format, shared) VALUES ( 'application', 'testApp', 'properties', false);

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(1,'testApp', 'default', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES('testApp', 'child-cluster', 'application', false, 'apollo', 'apollo');

INSERT INTO commit (change_sets, app_id, cluster_name, namespace_name)VALUES('{}', 'testApp', 'default', 'application');

INSERT INTO item (namespace_id, key, value, comment, line_num)VALUES(1, 'k1', 'v1', '', 1);

INSERT INTO namespace_lock (namespace_id)VALUES(1);

INSERT INTO release (app_id, cluster_name, namespace_name, configurations, abandoned)VALUES('branch-test', 'default', 'application', '{}', false);
INSERT INTO release (app_id, cluster_name, namespace_name, configurations, abandoned)VALUES('branch-test', 'child-cluster', 'application', '{}', false);

INSERT INTO release_history (app_id, cluster_name, namespace_name, branch_name, release_id, previous_release_id, operation, operation_context)VALUES('branch-test', 'default', 'application', 'default', 0, 0, 7, '{}');

INSERT INTO instance_config (id, instance_id, config_app_id, config_cluster_name, config_namespace_name, release_key, release_delivery_time, created_time, last_modified_time)
VALUES
	(1, 90, 'testApp', 'default', 'application', '20160829134524-dee271ddf9fced58', '2016-08-29 13:45:24', '2016-08-30 17:03:32', '2016-10-19 11:13:47');








