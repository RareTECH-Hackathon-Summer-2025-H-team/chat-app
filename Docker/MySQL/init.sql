DROP DATABASE chatapp;
DROP USER 'testuser';

CREATE USER 'testuser' IDENTIFIED BY 'testuser';
CREATE DATABASE chatapp;
USE chatapp
GRANT ALL PRIVILEGES ON chatapp.* TO 'testuser';

CREATE TABLE users (
    uid INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) UNIQUE NOT NULL,
    region_kana VARCHAR(255) NOT NULL
);

CREATE TABLE prefectures (
    prefecture_id SERIAL PRIMARY KEY,
    FOREIGN KEY (region_id) REFERENCES regions(region_id) ON DELETE CASCADE,
    prefecture_name VARCHAR(255) UNIQUE NOT NULL,
    prefecture_kana VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE spots (
    spot_id SERIAL PRIMARY KEY,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    FOREIGN KEY (prefecture_id) REFERENCES prefectures(prefecture_id) ON DELETE CASCADE
);


CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    FOREIGN KEY (uid) REFERENCES users(uid) ON DELETE CASCADE,
    FOREIGN KEY (spot_id) REFERENCES spots(spot_id) ON DELETE CASCADE,
    message TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(uid, user_name, email, password) VALUES('970af84c-dd40-47ff-af23-282b72b7cca8','テスト','test@gmail.com','37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578');
INSERT INTO channels(id, uid, name, abstract) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8','ぼっち部屋','テストさんの孤独な部屋です');
INSERT INTO messages(id, uid, cid, message) VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8', '1', '誰かかまってください、、')

INSERT INTO `regions` VALUES
  (1,'北海道地方','ホッカイドウ'),
  (2,'東北地方','トウホクチホウ'),
  (3,'関東地方','カントウチホウ'),
  (4,'中部地方','チュウブチホウ'),
  (5,'近畿地方','キンキチホウ'),
  (6,'中国地方','チュウゴクチホウ'),
  (7,'四国地方','シコクチホウ'),
  (8,'九州地方','キュウシュウチホウ');

INSERT INTO `prefecture` VALUES
  (1,1,'北海道','ホッカイドウ'),
  (2,2,'青森県','アオモリケン'),
  (3,2,'岩手県','イワテケン'),
  (4,2,'宮城県','ミヤギケン'),
  (5,2,'秋田県','アキタケン'),
  (6,2,'山形県','ヤマガタケン'),
  (7,2,'福島県','フクシマケン'),
  (8,3,'茨城県','イバラキケン'),
  (9,3,'栃木県','トチギケン'),
  (10,3,'群馬県','グンマケン'),
  (11,3,'埼玉県','サイタマケン'),
  (12,3,'千葉県','チバケン'),
  (13,3,'東京都','トウキョウト'),
  (14,3,'神奈川県','カナガワケン'),
  (15,4,'新潟県','ニイガタケン'),
  (16,4,'富山県','トヤマケン'),
  (17,4,'石川県','イシカワケン'),
  (18,4,'福井県','フクイケン'),
  (19,4,'山梨県','ヤマナシケン'),
  (20,4,'長野県','ナガノケン'),
  (21,4,'岐阜県','ギフケン'),
  (22,4,'静岡県','シズオカケン'),
  (23,4,'愛知県','アイチケン'),
  (24,5,'三重県','ミエケン'),
  (25,5,'滋賀県','シガケン'),
  (26,5,'京都府','キョウトフ'),
  (27,5,'大阪府','オオサカフ'),
  (28,5,'兵庫県','ヒョウゴケン'),
  (29,5,'奈良県','ナラケン'),
  (30,5,'和歌山県','ワカヤマケン'),
  (31,6,'鳥取県','トットリケン'),
  (32,6,'島根県','シマネケン'),
  (33,6,'岡山県','オカヤマケン'),
  (34,6,'広島県','ヒロシマケン'),
  (35,6,'山口県','ヤマグチケン'),
  (36,7,'徳島県','トクシマケン'),
  (37,7,'香川県','カガワケン'),
  (38,7,'愛媛県','エヒメケン'),
  (39,7,'高知県','コウチケン'),
  (40,8,'福岡県','フクオカケン'),
  (41,8,'佐賀県','サガケン'),
  (42,8,'長崎県','ナガサキケン'),
  (43,8,'熊本県','クマモトケン'),
  (44,8,'大分県','オオイタケン'),
  (45,8,'宮崎県','ミヤザキケン'),
  (46,8,'鹿児島県','カゴシマケン'),
  (47,8,'沖縄県','オキナワケン');


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