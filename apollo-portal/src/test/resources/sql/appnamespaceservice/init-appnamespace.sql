INSERT INTO app_namespace (id, namespace_name, app_id, format, shared, comment, deleted, created_by, created_time, last_modified_by, last_modified_time)
VALUES
	(139, 'FX.old', '100003173', 'properties', true, '', false, 'zhanglea', '2016-07-11 10:00:58', 'zhanglea', '2016-07-11 10:00:58'),
	(140, 'SCC.song0711-03', 'song0711-01', 'properties', true, '', false, 'song_s', '2016-07-11 10:04:09', 'song_s', '2016-07-11 10:04:09'),
	(141, 'SCC.song0711-04', 'song0711-01', 'properties', true, '', false, 'song_s', '2016-07-11 10:06:29', 'song_s', '2016-07-11 10:06:29'),
	(142, 'application', 'song0711-02', 'properties', true, 'default app namespace', false, 'song_s', '2016-07-11 11:18:24', 'song_s', '2016-07-11 11:18:24'),
	(143, 'TFF.song0711-02', 'song0711-02', 'properties', false, '', false, 'song_s', '2016-07-11 11:15:11', 'song_s', '2016-07-11 11:15:11'),
	(144, 'datasourcexml', '100003173', 'properties', true, '', false, 'apollo', '2016-07-11 12:08:29', 'apollo', '2016-07-11 12:08:29'),
	(145, 'datasource.xml', '100003173', 'xml', false, '', 0, 'apollo', '2016-07-11 12:09:30', 'apollo', '2016-07-11 12:09:30'),
	(146, 'FX.private-01', '100003173', 'properties', false, '', false, 'apollo', '2016-07-11 12:09:30', 'apollo', '2016-07-11 12:09:30'),
	(147, 'datasource', '100003173', 'properties', false, '', false, 'apollo', '2016-07-11 12:09:30', 'apollo', '2016-07-11 12:09:30');

INSERT INTO app (app_id, name, org_id, org_name, owner_name, owner_email, deleted, created_by, last_modified_by)
VALUES
	('1000', 'apollo-test', 'FX', '框架', 'song_s', 'song_s@ctrip.com', false, 'song_s', 'song_s'),
	('song0711-01', 'song0711-01', 'SCC', '框架', 'song_s', 'song_s@ctrip.com', false, 'song_s', 'song_s'),
	('song0711-02', 'song0711-02', 'SCC', '框架', 'song_s', 'song_s@ctrip.com', false, 'song_s', 'song_s'),
	('100003173', 'apollo-portal', 'FX', '框架', 'song_s', 'song_s@ctrip.com', false, 'song_s', 'song_s');
