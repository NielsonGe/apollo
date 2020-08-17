CREATE SEQUENCE app_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE app (
  id                 INT    NOT NULL DEFAULT nextval('app_id_seq') PRIMARY KEY,
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

CREATE SEQUENCE consumer_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE consumer (
  id                 INT    NOT NULL DEFAULT nextval('consumer_id_seq') PRIMARY KEY,
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  consumer_name      VARCHAR      NOT NULL DEFAULT 'default',
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
CREATE INDEX consumer_app_id_index
  ON consumer (app_id);
CREATE INDEX consumer_last_modified_time_index
  ON consumer (last_modified_time);

CREATE SEQUENCE consumer_audit_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE consumer_audit (
  id                 INT    NOT NULL DEFAULT nextval('consumer_audit_id_seq') PRIMARY KEY,
  consumer_id        INT,
  uri                VARCHAR      NOT NULL DEFAULT '',
  method             VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX consumer_audit_consumer_id_index
  ON consumer_audit (consumer_id);
CREATE INDEX consumer_audit_last_modified_time_index
  ON consumer_audit (last_modified_time);

CREATE SEQUENCE consumer_role_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE consumer_role (
  id                 INT    NOT NULL DEFAULT nextval('consumer_role_id_seq') PRIMARY KEY,
  consumer_id        INT,
  role_id            INT,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX consumer_role_consumer_id_role_id_index
  ON consumer_role (consumer_id, role_id);
CREATE INDEX consumer_role_role_id_index
  ON consumer_role (role_id);
CREATE INDEX consumer_role_last_modified_time_index
  ON consumer_role (last_modified_time);

CREATE SEQUENCE consumer_token_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE consumer_token (
  id                 INT    NOT NULL DEFAULT nextval('consumer_token_id_seq') PRIMARY KEY,
  consumer_id        INT,
  token              VARCHAR      NOT NULL DEFAULT '',
  expires            TIMESTAMP NOT NULL DEFAULT '2099-12-31 23:59:59' :: TIMESTAMP,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now(),
  UNIQUE (token)
);
CREATE INDEX consumer_token_last_modified_time_index
  ON consumer_token (last_modified_time);

CREATE SEQUENCE favorite_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE favorite (
  id                 INT    NOT NULL DEFAULT nextval('favorite_id_seq') PRIMARY KEY,
  user_id            VARCHAR      NOT NULL DEFAULT 'default',
  app_id             VARCHAR      NOT NULL DEFAULT 'default',
  favorite_position  INT    NOT NULL DEFAULT 10000,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX favorite_user_id_index
  ON favorite (user_id);
CREATE INDEX favorite_app_id_index
  ON favorite (app_id);
CREATE INDEX favorite_last_modified_time_index
  ON favorite (last_modified_time);

CREATE SEQUENCE permission_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE permission (
  id                 INT    NOT NULL DEFAULT nextval('permission_id_seq') PRIMARY KEY,
  permission_type    VARCHAR      NOT NULL DEFAULT '',
  target_id          VARCHAR      NOT NULL DEFAULT '',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX permission_permission_type_target_id_index
  ON permission (permission_type, target_id);
CREATE INDEX permission_last_modified_time_index
  ON permission (last_modified_time);

CREATE SEQUENCE role_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE role (
  id                 INT    NOT NULL DEFAULT nextval('role_id_seq') PRIMARY KEY,
  role_name          VARCHAR      NOT NULL DEFAULT '',
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT 'default',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX role_role_name_index
  ON role (role_name);
CREATE INDEX role_last_modified_time_index
  ON role (last_modified_time);

CREATE SEQUENCE role_permission_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE role_permission (
  id                 INT    NOT NULL DEFAULT nextval('role_permission_id_seq') PRIMARY KEY,
  role_id            INT,
  permission_id      INT,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX role_permission_role_id_index
  ON role_permission (role_id);
CREATE INDEX role_permission_permission_id_index
  ON role_permission (permission_id);
CREATE INDEX role_permission_last_modified_time_index
  ON role_permission (last_modified_time);

CREATE SEQUENCE server_config_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE server_config (
  id                 INT    NOT NULL DEFAULT nextval('server_config_id_seq') PRIMARY KEY,
  key                VARCHAR      NOT NULL DEFAULT 'default',
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

CREATE SEQUENCE user_role_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE user_role (
  id                 INT    NOT NULL DEFAULT nextval('user_role_id_seq') PRIMARY KEY,
  user_id            VARCHAR               DEFAULT '',
  role_id            INT,
  deleted            BOOLEAN   NOT NULL DEFAULT FALSE,
  created_by         VARCHAR      NOT NULL DEFAULT '',
  created_time       TIMESTAMP NOT NULL DEFAULT now(),
  last_modified_by   VARCHAR               DEFAULT '',
  last_modified_time TIMESTAMP          DEFAULT now()
);
CREATE INDEX user_role_user_id_role_id_index
  ON user_role (user_id, role_id);
CREATE INDEX user_role_role_id_index
  ON user_role (role_id);
CREATE INDEX user_role_last_modified_time_index
  ON user_role (last_modified_time);

CREATE SEQUENCE users_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE users (
  id       INT  NOT NULL DEFAULT nextval('users_id_seq') PRIMARY KEY,
  username VARCHAR    NOT NULL DEFAULT 'default',
  password VARCHAR    NOT NULL DEFAULT 'default',
  email    VARCHAR    NOT NULL DEFAULT 'default',
  enabled  BOOLEAN NOT NULL
);

CREATE SEQUENCE authorities_id_seq
  INCREMENT 1
  START 1;
CREATE TABLE authorities (
  id        INT NOT NULL DEFAULT nextval('authorities_id_seq') PRIMARY KEY,
  username  VARCHAR   NOT NULL,
  authority VARCHAR   NOT NULL
);

---------------------------------------------------------------------------------------------


INSERT INTO server_config (key, value, comment)
VALUES
  ('apollo.portal.envs', 'dev', '可支持的环境列表'),
  ('organizations', '[{"orgId":"gdmp","orgName":"gdmp"}]', '部门列表'),
  ('superAdmin', 'apollo', 'Portal超级管理员'),
  ('api.readTimeout', '10000', 'http接口read timeout'),
  ('consumer.token.salt', 'someSalt', 'consumer token salt'),
  ('admin.createPrivateNamespace.switch', 'false', '是否允许项目管理员创建私有namespace');

INSERT INTO users (username, password, email, enabled)
VALUES
  ('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@gridsum.com', TRUE);

INSERT INTO authorities (username, authority)
VALUES
  ('apollo', 'ROLE_user');
