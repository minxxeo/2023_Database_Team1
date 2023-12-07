CREATE TABLE twitter_db.users ( /*Tables that store user information*/
    user_id INT PRIMARY KEY, 
    pw VARCHAR(255),
    nickname VARCHAR(255),
    gender VARCHAR(255),
    birth DATE,
    introduce TEXT
);

CREATE TABLE twitter_db.articles (/*Tables that store post information*/
    article_id INT PRIMARY KEY,
    contents TEXT,
    timestamp TIMESTAMP
);

CREATE TABLE twitter_db.tags (/*Table to store tag information*/
    tag_id INT PRIMARY KEY,
    name VARCHAR(255),
    frequency INT
);

CREATE TABLE twitter_db.article_tag (/*Table to store the relationship between posts and tags*/
    article_id INT,
    tag_id INT,
    PRIMARY KEY (article_id, tag_id),
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE relationship (/*Tables that store relationships between users*/
    user_id INT NOT NULL,
    related_user_id INT NOT NULL,
    relationship_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (user_id, related_user_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (related_user_id) REFERENCES user(user_id)
);


CREATE TABLE twitter_db.article_comment (/*Table to store the relationship between posts and comments*/
    comment_id INT PRIMARY KEY,
    article_id INT,
    contents TEXT,
    FOREIGN KEY (article_id) REFERENCES articles(article_id)
);
