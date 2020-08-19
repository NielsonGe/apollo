INSERT INTO app ( app_id, name, org_id, org_name, owner_name, owner_email, deleted, created_by, last_modified_by)VALUES('test', 'test0620-06', 'default', 'default', 'default', 'default', false, 'default', 'default');

/* normal namespace*/
INSERT INTO cluster (name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES ( 'only-master', 'test', 0, false, 'default', 'default');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(100, 'test', 'only-master', 'application', false, 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(100, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(100, 'k2', 'v2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(100, 'k3', 'v3', '', 'apollo', 'apollo');


/* namespace has branch. master has items but branch has not item*/
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (101, 'default1', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(102, 'child-cluster1', 'test', 101, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(101, 'test', 'default1', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(102, 'test', 'child-cluster1', 'application', false, 'apollo', 'apollo');

INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(101, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(101, 'k2', 'v2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(101, 'k3', 'v3', '', 'apollo', 'apollo');

INSERT INTO gray_release_rule (app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)VALUES ('test', 'default1', 'application', 'child-cluster1', '[]', 1155, 1);



/* namespace has branch. master has items and branch has item*/
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES (103, 'default2', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(104, 'child-cluster2', 'test', 103, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(103, 'test', 'default2', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(104, 'test', 'child-cluster2', 'application', false, 'apollo', 'apollo');

INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(103, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(103, 'k2', 'v2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(103, 'k3', 'v3', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(104, 'k1', 'v1-1', '', 'apollo', 'apollo');

INSERT INTO gray_release_rule (app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)VALUES ('test', 'default2', 'application', 'child-cluster2', '[]', 1155, 1);

/* namespace has branch. master has items and branch has cover item */
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (105, 'default3', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(106, 'child-cluster3', 'test', 105, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(105, 'test', 'default3', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(106, 'test', 'child-cluster3', 'application', false, 'apollo', 'apollo');

INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(105, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(105, 'k2', 'v2-2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(106, 'k1', 'v1-2', '', 'apollo', 'apollo');

INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(1, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'default3', 'application', '{"k1":"v1","k2":"v2","k3":"v3"}', false);
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(2, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'child-cluster3', 'application', '{"k1":"v1-1","k2":"v2","k3":"v3"}', false);

INSERT INTO gray_release_rule (app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)VALUES ('test', 'default3', 'application', 'child-cluster3', '[]', 1155, 1);

/*publish branch at first time */
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (107, 'default4', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(108, 'child-cluster4', 'test', 107, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(107, 'test', 'default4', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(108, 'test', 'child-cluster4', 'application', false, 'apollo', 'apollo');

INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(107, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(107, 'k2', 'v2-2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(108, 'k1', 'v1-2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(108, 'k4', 'v4', '', 'apollo', 'apollo');

INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(3, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'default4', 'application', '{"k1":"v1","k2":"v2","k3":"v3"}', false);

INSERT INTO gray_release_rule (app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)VALUES ('test', 'default4', 'application', 'child-cluster4', '[]', 1155, 1);

/*publish branch*/
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (109, 'default5', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(1010, 'child-cluster5', 'test', 109, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(109, 'test', 'default5', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(1010, 'test', 'child-cluster5', 'application', false, 'apollo', 'apollo');

INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(109, 'k1', 'v1', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(109, 'k2', 'v2-2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(1010, 'k1', 'v1-2', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(1010, 'k4', 'v4', '', 'apollo', 'apollo');
INSERT INTO item (namespace_id, key, value, comment, created_by, last_modified_by)VALUES(1010, 'k6', 'v6', '', 'apollo', 'apollo');

INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(4, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'default5', 'application', '{"k1":"v1","k2":"v2","k3":"v3"}', false);
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(5, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'child-cluster5', 'application', '{"k1":"v1-1","k2":"v2","k3":"v3","k4":"v4","k5":"v5"}', false);

INSERT INTO gray_release_rule (app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)VALUES ('test', 'default5', 'application', 'child-cluster5', '[]', 1155, 1);

/* rollback */
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by) VALUES (1011, 'default6', 'test', 0, false, 'default', 'default');
INSERT INTO cluster (id, name, app_id, parent_cluster_id, deleted, created_by, last_modified_by)VALUES(1012, 'child-cluster6', 'test', 1011, false, 'default', 'default');

INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(1011, 'test', 'default6', 'application', false, 'apollo', 'apollo');
INSERT INTO namespace (id, app_id, cluster_name, namespace_name, deleted, created_by, last_modified_by)VALUES(1012, 'test', 'child-cluster6', 'application', false, 'apollo', 'apollo');

INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(6, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'default6', 'application', '{"k1":"v1-1","k2":"v2-1","k3":"v3"}', false);
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(7, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'default6', 'application', '{"k1":"v1","k2":"v2"}', false);
INSERT INTO release (id, release_key, name, comment, app_id, cluster_name, namespace_name, configurations, abandoned)VALUES(8, '20160823102253-fc0071ddf9fd3260', '20160823101703-release', '', 'test', 'child-cluster6', 'application', '{"k1":"v1-2","k2":"v2","k3":"v3"}', false);
