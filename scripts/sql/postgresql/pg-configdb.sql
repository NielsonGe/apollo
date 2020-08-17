CREATE SEQUENCE app_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE app (
  id                 INT    NOT NULL DEFAULT nextval('app_id_seq'),
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  app_name           VARCHAR      NOT NULL DEFAULT 'default',
  org_id             VARCHAR      NOT NULL DEFAULT 'default',
  org_name           VARCHAR      NOT NULL DEFAULT 'default',
  owner_name         VARCHAR      NOT NULL DEFAULT 'default',
  owner_email        VARCHAR      NOT NULL DEFAULT 'default',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX app_app_id_index
  ON app (app_id);
CREATE INDEX app_app_name_index
  ON app (app_name);
CREATE INDEX app_last_modified_time_index
  ON app (last_modified_time);

CREATE SEQUENCE app_namespace_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE app_namespace (
  id                 INT    NOT NULL DEFAULT nextval('app_namespace_id_seq') PRIMARY KEY,
  namespace_name     VARCHAR      NOT NULL DEFAULT '',
  app_id             VARCHAR      NOT NULL DEFAULT '',
  format             VARCHAR      NOT NULL DEFAULT 'properties',
  shared             BOOLEAN   NOT NULL DEFAULT FALSE,
  comment            VARCHAR      NOT NULL DEFAULT '',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX app_namespace_app_id_index
  ON app_namespace (app_id);
CREATE INDEX app_namespace_namespace_name_app_id_index
  ON app_namespace (namespace_name, app_id);
CREATE INDEX app_namespace_last_modified_time_index
  ON app_namespace (last_modified_time);

CREATE SEQUENCE audit_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE audit (
  id                 INT    NOT NULL DEFAULT nextval('audit_id_seq') PRIMARY KEY,
  entity_name        VARCHAR      NOT NULL DEFAULT 'default',
  entity_id          INT,
  op_name            VARCHAR      NOT NULL DEFAULT 'default',
  comment            VARCHAR,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX audit_last_modified_time_index
  ON audit (last_modified_time);

CREATE SEQUENCE cluster_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE cluster (
  id                 INT    NOT NULL DEFAULT nextval('cluster_id_seq') PRIMARY KEY,
  cluster_name       VARCHAR      NOT NULL DEFAULT '',
  app_id             VARCHAR      NOT NULL DEFAULT '',
  parent_cluster_id  INT    NOT NULL DEFAULT 0,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX cluster_app_id_cluster_name_index
  ON cluster (app_id, cluster_name);
CREATE INDEX cluster_parent_cluster_id_index
  ON cluster (parent_cluster_id);
CREATE INDEX cluster_last_modified_time_index
  ON cluster (last_modified_time);

CREATE SEQUENCE commit_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE commit (
  id                 INT    NOT NULL DEFAULT nextval('commit_id_seq') PRIMARY KEY,
  change_sets        VARCHAR      NOT NULL,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name       VARCHAR      NOT NULL DEFAULT 'default',
  namespace_name     VARCHAR      NOT NULL DEFAULT 'default',
  comment            VARCHAR,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX commit_app_id_index
  ON commit (app_id);
CREATE INDEX commit_cluster_name_index
  ON commit (cluster_name);
CREATE INDEX commit_namespace_name_index
  ON commit (namespace_name);
CREATE INDEX commit_last_modified_time_index
  ON commit (last_modified_time);

CREATE SEQUENCE gray_release_rule_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE gray_release_rule (
  id                 INT    NOT NULL DEFAULT nextval('gray_release_rule_id_seq') PRIMARY KEY,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name       VARCHAR      NOT NULL DEFAULT 'default',
  namespace_name     VARCHAR      NOT NULL DEFAULT 'default',
  branch_name        VARCHAR      NOT NULL DEFAULT 'default',
  rules              VARCHAR      NOT NULL DEFAULT '[]',
  release_id         INT    NOT NULL DEFAULT 0,
  branch_status      SMALLINT           DEFAULT 1,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX gray_release_rule_app_id_cluster_name_namespace_name_index
  ON gray_release_rule (app_id, cluster_name, namespace_name);
CREATE INDEX gray_release_rule_last_modified_time_index
  ON gray_release_rule (last_modified_time);

CREATE SEQUENCE instance_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE instance (
  id                 INT    NOT NULL DEFAULT nextval('instance_id_seq') PRIMARY KEY,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name       VARCHAR      NOT NULL DEFAULT 'default',
  data_center        VARCHAR      NOT NULL DEFAULT 'default',
  ip                 VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_time TIMESTAMP          DEFAULT now(),
  UNIQUE (app_id, cluster_name, ip, data_center)
);
CREATE INDEX instance_ip_index
  ON instance (ip);
CREATE INDEX instance_last_modified_time_index
  ON instance (last_modified_time);

CREATE SEQUENCE instance_config_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE instance_config (
  id                    INT    NOT NULL DEFAULT nextval('instance_config_id_seq') PRIMARY KEY,
  instance_id           INT,
  config_app_id         VARCHAR      NOT NULL DEFAULT 'default',
  config_cluster_name   VARCHAR      NOT NULL DEFAULT 'default',
  config_namespace_name VARCHAR      NOT NULL DEFAULT 'default',
  release_key           VARCHAR      NOT NULL DEFAULT '',
  release_delivery_time TIMESTAMP,
  created_time          TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_time    TIMESTAMP          DEFAULT now(),
  UNIQUE (instance_id, config_app_id, config_namespace_name)
);
CREATE INDEX instance_config_config_app_id_config_cluster_name_config_namespace_name_last_modified_time_index
  ON instance_config (config_app_id, config_cluster_name, config_namespace_name, last_modified_time);
CREATE INDEX instance_config_release_key_index
  ON instance_config (release_key);
CREATE INDEX instance_config_last_modified_time_index
  ON instance_config (last_modified_time);

CREATE SEQUENCE item_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE item (
  id                 INT    NOT NULL DEFAULT nextval('item_id_seq') PRIMARY KEY,
  namespace_id       INT    NOT NULL DEFAULT 0,
  key                VARCHAR      NOT NULL DEFAULT 'default',
  value              VARCHAR      NOT NULL,
  comment            VARCHAR               DEFAULT '',
  line_num           INT             DEFAULT 0,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX item_namespace_id_index
  ON item (namespace_id);
CREATE INDEX item_last_modified_time_index
  ON item (last_modified_time);

CREATE SEQUENCE namespace_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE namespace (
  id                 INT    NOT NULL DEFAULT nextval('namespace_id_seq') PRIMARY KEY,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name       VARCHAR      NOT NULL DEFAULT 'default',
  namespace_name     VARCHAR      NOT NULL DEFAULT 'default',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX namespace_app_id_cluster_name_namespace_name_index
  ON namespace (app_id, cluster_name, namespace_name);
CREATE INDEX namespace_namespace_name_index
  ON namespace (namespace_name);
CREATE INDEX namespace_last_modified_time_index
  ON namespace (last_modified_time);

CREATE SEQUENCE namespace_lock_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE namespace_lock (
  id                 INT    NOT NULL DEFAULT nextval('namespace_lock_id_seq') PRIMARY KEY,
  namespace_id       INT    NOT NULL DEFAULT 0,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT 'default',
  last_modified_time TIMESTAMP          DEFAULT now(),
  UNIQUE (namespace_id)
);
CREATE INDEX namespace_lock_last_modified_time_index
  ON namespace_lock (last_modified_time);

CREATE SEQUENCE release_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE release (
  id                 INT    NOT NULL DEFAULT nextval('release_id_seq') PRIMARY KEY,
  release_key        VARCHAR      NOT NULL DEFAULT '',
  release_name       VARCHAR      NOT NULL DEFAULT 'default',
  comment            VARCHAR,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name       VARCHAR      NOT NULL DEFAULT 'default',
  namespace_name     VARCHAR      NOT NULL DEFAULT 'default',
  configurations     VARCHAR      NOT NULL,
  abandoned          BOOLEAN   NOT NULL DEFAULT FALSE,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX release_release_key_index
  ON release (release_key);
CREATE INDEX release_app_id_cluster_name_namespace_name_index
  ON release (app_id, cluster_name, namespace_name);
CREATE INDEX release_last_modified_time_index
  ON release (last_modified_time);

CREATE SEQUENCE release_history_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE release_history (
  id                  INT    NOT NULL DEFAULT nextval('release_history_id_seq') PRIMARY KEY,
  app_id              VARCHAR      NOT NULL DEFAULT 'default',
  cluster_name        VARCHAR      NOT NULL DEFAULT 'default',
  namespace_name      VARCHAR      NOT NULL DEFAULT 'default',
  branch_name         VARCHAR      NOT NULL DEFAULT 'default',
  release_id          INT    NOT NULL DEFAULT 0,
  previous_release_id INT    NOT NULL DEFAULT 0,
  operation           SMALLINT  NOT NULL DEFAULT 0,
  operation_context   VARCHAR      NOT NULL,
  deleted             BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by          VARCHAR      NOT NULL DEFAULT 'default',
  created_time        TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by    VARCHAR               DEFAULT '',
  last_modified_time  TIMESTAMP          DEFAULT now()
);
CREATE INDEX release_history_app_id_cluster_name_namespace_name_branch_name_index
  ON release_history (app_id, cluster_name, namespace_name, branch_name);
CREATE INDEX release_history_release_id_index
  ON release_history (release_id);
CREATE INDEX release_history_last_modified_time_index
  ON release_history (last_modified_time);

CREATE SEQUENCE release_message_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE release_message (
  id                 INT NOT NULL DEFAULT nextval('release_message_id_seq') PRIMARY KEY,
  message            VARCHAR   NOT NULL DEFAULT '',
  last_modified_time TIMESTAMP       DEFAULT now()
);
CREATE INDEX release_message_message_index
  ON release_message (message);
CREATE INDEX release_message_last_modified_time_index
  ON release_message (last_modified_time);

CREATE SEQUENCE server_config_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE server_config (
  id                 INT    NOT NULL DEFAULT nextval('server_config_id_seq') PRIMARY KEY,
  key                VARCHAR      NOT NULL DEFAULT 'default',
  cluster            VARCHAR      NOT NULL DEFAULT 'default',
  value              VARCHAR      NOT NULL DEFAULT 'default',
  comment            VARCHAR               DEFAULT '',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX server_config_key_index
  ON server_config (key);
CREATE INDEX server_config_last_modified_time_index
  ON server_config (last_modified_time);

CREATE SEQUENCE access_key_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE access_key (
  id                 INT    NOT NULL DEFAULT nextval('access_key_id_seq') PRIMARY KEY,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  secret             VARCHAR      NOT NULL DEFAULT '',
  enabled            BOOLEAN   NOT NULL DEFAULT FALSE,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX access_key_key_index
  ON access_key (app_id);
CREATE INDEX access_key_last_modified_time_index
  ON access_key (last_modified_time);

---------------------------------------------------------------------------------------------


INSERT INTO server_config (key, cluster, value, comment)
VALUES
  ('eureka.service.url', 'default', 'http://127.0.0.1:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔'),
  ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关'),
  ('item.key.length.limit', 'default', '1024', 'item key 最大长度限制'),
  ('item.value.length.limit', 'default', '1024000', 'item value最大长度限制'),
  ('config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！');
