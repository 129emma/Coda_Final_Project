DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS UserInfo;

CREATE TABLE UserInfo (
  username  VARCHAR(99) PRIMARY KEY,
  password  BLOB,
  salt      BLOB,
  firstName VARCHAR(99),
  lastName  VARCHAR(99),
  email     VARCHAR(99),
  birthDate DATE,
  gender    VARCHAR(99),
  avatar    VARCHAR(999)
);

DROP TABLE IF EXISTS Article;

CREATE TABLE Article (
  articleID  INT PRIMARY KEY AUTO_INCREMENT,
  title      VARCHAR(50),
  content    VARCHAR(5000),
  postTime   DATETIME,
  tags       VARCHAR(99),
  username   VARCHAR(99),
  userAvatar VARCHAR(999)
);

DROP TABLE IF EXISTS Comment;

CREATE TABLE Comment (
  commentID INT PRIMARY KEY AUTO_INCREMENT,
  content   VARCHAR(500),
  postTime  DATETIME,
  username  VARCHAR(99),
  articleID INT
);


DROP TABLE IF EXISTS CommentReply;

CREATE TABLE CommentReply (
  commentReplyID INT PRIMARY KEY AUTO_INCREMENT,
  content        VARCHAR(500),
  postTime       DATETIME,
  username       VARCHAR(99),
  commentID      INT,
  articleID      INT
);
