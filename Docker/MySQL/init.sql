DROP DATABASE chatapp;
DROP USER 'testuser';

CREATE USER 'testuser' IDENTIFIED BY 'testuser';
CREATE DATABASE chatapp;
USE chatapp
GRANT ALL PRIVILEGES ON chatapp.* TO 'testuser';

CREATE TABLE users (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL-- ,
    -- created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE prefectures (
    id SERIAL PRIMARY KEY,
    prefecture_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE spots (
    spot_id SERIAL PRIMARY KEY,
    cid INT NOT NULL,
    pid INT NOT NULL,
    FOREIGN KEY (cid) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES prefectures(id) ON DELETE CASCADE
);

CREATE TABLE messages (
    message_id INT PRIMARY KEY,
    FOREIGN KEY (uid) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (spot_id) REFERENCES spots(spot_id) ON DELETE CASCADE,
    message TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(id, name, email, password) VALUES('970af84c-dd40-47ff-af23-282b72b7cca8','テスト','test@gmail.com','37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578');
INSERT INTO channels(id, uid, name, abstract) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8','ぼっち部屋','テストさんの孤独な部屋です');
INSERT INTO messages(id, uid, cid, message) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8', '1', '誰かかまってください、、');
INSERT INTO categories(id, category_name) VALUES(1, '海'),(2, '川'),(3, '湖');
INSERT INTO `prefectures` VALUES
  (1,'北海道'),
  (2,'青森県'),
  (3,'岩手県'),
  (4,'宮城県'),
  (5,'秋田県'),
  (6,'山形県'),
  (7,'福島県'),
  (8,'茨城県'),
  (9,'栃木県'),
  (10,'群馬県'),
  (11,'埼玉県'),
  (12,'千葉県'),
  (13,'東京都'),
  (14,'神奈川県'),
  (15,'新潟県'),
  (16,'富山県'),
  (17,'石川県'),
  (18,'福井県'),
  (19,'山梨県'),
  (20,'長野県'),
  (21,'岐阜県'),
  (22,'静岡県'),
  (23,'愛知県'),
  (24,'三重県'),
  (25,'滋賀県'),
  (26,'京都府'),
  (27,'大阪府'),
  (28,'兵庫県'),
  (29,'奈良県'),
  (30,'和歌山県'),
  (31,'鳥取県'),
  (32,'島根県'),
  (33,'岡山県'),
  (34,'広島県'),
  (35,'山口県'),
  (36,'徳島県'),
  (37,'香川県'),
  (38,'愛媛県'),
  (39,'高知県'),
  (40,'福岡県'),
  (41,'佐賀県'),
  (42,'長崎県'),
  (43,'熊本県'),
  (44,'大分県'),
  (45,'宮崎県'),
  (46,'鹿児島県'),
  (47,'沖縄県')


-- 以下は元ファイルの内容. コピーして使用する --
-- DROP DATABASE chatapp;
-- DROP USER 'testuser';

-- CREATE USER 'testuser' IDENTIFIED BY 'testuser';
-- CREATE DATABASE chatapp;
-- USE chatapp
-- GRANT ALL PRIVILEGES ON chatapp.* TO 'testuser';

-- CREATE TABLE users (
--     uid VARCHAR(255) PRIMARY KEY,
--     user_name VARCHAR(255) UNIQUE NOT NULL,
--     email VARCHAR(255) UNIQUE NOT NULL,
--     password VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE channels (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     uid VARCHAR(255) NOT NULL,
--     name VARCHAR(255) UNIQUE NOT NULL,
--     abstract VARCHAR(255),
--     FOREIGN KEY (uid) REFERENCES users(uid) ON DELETE CASCADE
-- );

-- CREATE TABLE messages (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     uid VARCHAR(255) NOT NULL,
--     cid INT NOT NULL,
--     message TEXT,
--     created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (uid) REFERENCES users(uid) ON DELETE CASCADE,
--     FOREIGN KEY (cid) REFERENCES channels(id) ON DELETE CASCADE
-- );

-- INSERT INTO users(uid, user_name, email, password) VALUES('970af84c-dd40-47ff-af23-282b72b7cca8','テスト','test@gmail.com','37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578');
-- INSERT INTO channels(id, uid, name, abstract) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8','ぼっち部屋','テストさんの孤独な部屋です');
-- INSERT INTO messages(id, uid, cid, message) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8', '1', '誰かかまってください、、')