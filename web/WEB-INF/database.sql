
DROP TABLE IF EXISTS AlbumsImage;

CREATE TABLE IF NOT EXISTS AlbumsImage(
  id INT AUTO_INCREMENT,
  fileName VARCHAR(50),
  username CHAR(10),
  address VARCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS AlbumsVideo;

CREATE TABLE IF NOT EXISTS AlbumsVideo(
  id INT AUTO_INCREMENT,
  fileName VARCHAR(50),
  username CHAR(10),
  address VARCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS AlbumsAudio;

CREATE TABLE IF NOT EXISTS AlbumsAudio(
  id INT AUTO_INCREMENT,
  fileName VARCHAR(50),
  username CHAR(10),
  address varCHAR(1000) NOT NULL ,
  postTime DATETIME,
  PRIMARY KEY(id)
);

SELECT * FROM Article WHERE username='qian' LIMIT 3