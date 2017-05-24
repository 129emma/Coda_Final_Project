DROP TABLE IF EXISTS dblab18_ex02_userinfo;

CREATE TABLE dblab18_ex02_userinfo (
  firstName VARCHAR(32),
  lastName  VARCHAR(32),
  username  VARCHAR(32) PRIMARY KEY,
  email     VARCHAR(32)
);

INSERT INTO dblab18_ex02_userinfo VALUES ('Qian', 'Peng', 'qpen546', 'qpen546@aucklanduni.ac.nz');