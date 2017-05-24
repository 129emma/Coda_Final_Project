DROP TABLE IF EXISTS User_Info;

CREATE TABLE User_Info (
  username   VARCHAR(99) PRIMARY KEY,
  password   BLOB,
  salt       BLOB,
  firstName  VARCHAR(99),
  lastName   VARCHAR(99),
  email      VARCHAR(99),
  data_birth INT,
  tag        VARCHAR(99),
  Friends    VARCHAR(99)
);

DROP TABLE IF EXISTS Comment;

CREATE TABLE Comment (
  comment_ID INT PRIMARY KEY AUTO_INCREMENT,
  cotent     VARCHAR(99),
  post_time  INT,
  username   VARCHAR(99),
  article_ID INT
);

DROP TABLE IF EXISTS Article;

CREATE TABLE Article (
  article_ID INT PRIMARY KEY AUTO_INCREMENT,
  cotent     VARCHAR(99),
  post_time  INT,
  tags       VARCHAR(99),
  username   VARCHAR(99)
);

INSERT INTO User_Info (username, password, salt) VALUE ('qpen','df','fd');