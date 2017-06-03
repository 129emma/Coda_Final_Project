
DROP TABLE IF EXISTS AlbumsImage;

CREATE TABLE IF NOT EXISTS AlbumsImage(
  id VARCHAR(40),
  username CHAR(10),
  address CHAR(100) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS AlbumsVideo;

CREATE TABLE IF NOT EXISTS AlbumsVideo(
  id INT AUTO_INCREMENT,
  username CHAR(10),
  address CHAR(200) NOT NULL ,
  postTime DATETIME,

  PRIMARY KEY(id)
);