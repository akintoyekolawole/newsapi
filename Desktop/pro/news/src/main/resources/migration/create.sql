	/*create Role table */
CREATE TABLE role(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  unique_key varchar(32)  NOT NULL,
  name varchar(128)  NOT NULL,
  description varchar(525)  NOT NULL,
  status varchar(16)  NULL,
  created_at TIMESTAMP  NOT NULL,
  updated_at TIMESTAMP NULL,
  is_hidden varchar(16)  NOT NULL,
  PRIMARY KEY (id),
  UNIQUE(unique_key)
);


  /*create Permission table */
  CREATE TABLE permission(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name varchar(128)  NOT NULL,
    description varchar(525)  NOT NULL,
    code varchar(256)  NOT NULL,
    status varchar(16)  NULL,
    is_hidden varchar(16)  NOT NULL,
    PRIMARY KEY (id)
  );

  /*create Author table */

  CREATE TABLE "authors"(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    unique_key varchar(32)  NOT NULL,
    first_name varchar(255)  NULL,
    last_name varchar(255)  NULL,
    email varchar(255)  NULL,
    "password" varchar(255)  NULL,
    phone varchar(16)  NULL,
    "address" text  NULL,
    role_id VARCHAR(32)  NOT NULL REFERENCES  role (unique_key),
    status varchar(16)  NOT NULL,
    last_login_date varchar(50)  NULL,
    created_at  TIMESTAMP  NOT NULL,
    updated_at  TIMESTAMP NULL,
    PRIMARY KEY (unique_key)
  );

  /*create Token table */
  CREATE TABLE token(
    id  INT GENERATED BY DEFAULT AS IDENTITY,
    author varchar(32)  NULL REFERENCES authors (unique_key),
    token varchar(64)  NULL,
    status varchar(16)  NULL,
    created_at TIMESTAMP  NOT NULL,
    updated_at TIMESTAMP NULL,
    expires_at TIMESTAMP NULL
  );

  /*create Role permission table */
  CREATE TABLE role_permission(
    id  INT GENERATED BY DEFAULT AS IDENTITY,
    role_id bigint  NOT NULL REFERENCES role (id),
    permission_id bigint  NOT NULL REFERENCES permission (id),
    status varchar(16)  NOT NULL,
    created_at TIMESTAMP  NOT NULL,
    updated_at TIMESTAMP  NOT NULL
  );

  CREATE TABLE news(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    unique_key varchar(32)  NOT NULL,
    description text  NULL,
    "file" text  NULL,
    author VARCHAR(32)  NOT NULL REFERENCES  authors (unique_key),
    status varchar(16)  NOT NULL,
    created_at  TIMESTAMP  NOT NULL,
    updated_at  TIMESTAMP NULL,
    PRIMARY KEY (unique_key)
  );
