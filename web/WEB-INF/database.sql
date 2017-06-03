
DROP TABLE IF EXISTS AlbumsImage;

CREATE TABLE IF NOT EXISTS AlbumsImage(
  id CHAR(30),
  username CHAR(10),
  address VARCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS AlbumsVideo;

CREATE TABLE IF NOT EXISTS AlbumsVideo(
  id CHAR(30),
  username CHAR(10),
  address VARCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS AlbumsAudio;

CREATE TABLE IF NOT EXISTS AlbumsAudio(
  id CHAR(30),
  username CHAR(10),
  address varCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);