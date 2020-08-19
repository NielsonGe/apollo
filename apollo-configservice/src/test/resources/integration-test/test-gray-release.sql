INSERT INTO gray_release_rule (id, app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)
VALUES
	(1, 'someAppId', 'default', 'application', 'gray-branch-1', '[{"clientAppId":"someAppId","clientIpList":["1.1.1.1"]}]', 986, 1);
INSERT INTO gray_release_rule (id, app_id, cluster_name, namespace_name, branch_name, rules, release_id, branch_status)
VALUES
	(2, 'somePublicAppId', 'default', 'somePublicNamespace', 'gray-branch-2', '[{"clientAppId":"someAppId","clientIpList":["1.1.1.1"]}]', 985, 1);
