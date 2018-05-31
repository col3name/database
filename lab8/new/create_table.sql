CREATE TABLE IF NOT EXISTS person (
  id_person INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),

  PRIMARY KEY (id_person)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_person_id_person
  ON `person` (id_person);
CREATE INDEX IN_person_name
  ON `person` (name);


CREATE TABLE IF NOT EXISTS profession_on_film (
  id_profession_on_film INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),

  PRIMARY KEY (id_profession_on_film)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_profession_on_film_id_profession_on_film
  ON `profession_on_film` (id_profession_on_film);
CREATE INDEX IN_person_name
  ON `profession_on_film` (name);

CREATE TABLE IF NOT EXISTS person_x_film (
  id_person_x_film INT(11) NOT NULL AUTO_INCREMENT,
  id_person INT(11) NOT NULL,
  id_film INT(11) NOT NULL,
  id_profession_on_film INT(11) NOT NULL,

  PRIMARY KEY (id_person_x_film),
  FOREIGN KEY (id_person) REFERENCES person(id_person),
  FOREIGN KEY (id_film) REFERENCES film(id_film),
  FOREIGN KEY (id_profession_on_film) REFERENCES profession_on_film (id_profession_on_film)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_person_x_film_id_person_x_film
  ON `person_x_film` (id_person_x_film);
CREATE INDEX IN_person_id_person
  ON `person_x_film` (id_person);
CREATE INDEX IN_person_id_film
  ON `person_x_film` (id_film);
CREATE INDEX IN_person_id_film_id_profession_on_film
  ON `person_x_film` (id_profession_on_film);

ALTER TABLE person_x_film ADD id_person INT(11);

CREATE TABLE IF NOT EXISTS film (
  id_film INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  image_path VARCHAR(255),
  issue_year INT(11),

  PRIMARY KEY (id_film)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_film_id_film
  ON `film` (id_film);
CREATE INDEX IN_film_name
  ON `film` (name);
CREATE FULLTEXT INDEX IN_film_description
  ON `film` (description);
CREATE INDEX IN_film_image_path
  ON `film` (image_path);
CREATE INDEX IN_film_issue_year
  ON `film` (issue_year);

CREATE TABLE IF NOT EXISTS country (
  id_country INT(11)      NOT NULL AUTO_INCREMENT,
  name       VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_country)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_country_id_country
  ON country (id_country);
CREATE INDEX IN_country_name
  ON country (name);


CREATE TABLE IF NOT EXISTS country (
  id_country INT(11)      NOT NULL AUTO_INCREMENT,
  name       VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_country)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_country_id_country
  ON country (id_country);
CREATE INDEX IN_country_name
  ON country (name);

CREATE TABLE IF NOT EXISTS country_on_film (
  id_country_on_film INT(11) NOT NULL AUTO_INCREMENT,
  id_film INT(11) NOT NULL,
  id_country INT(11) NOT NULL,

  PRIMARY KEY (id_country_on_film),
  FOREIGN KEY (id_film) REFERENCES film(id_film),
  FOREIGN KEY (id_country) REFERENCES country (id_country)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_country_on_film_id_country_on_film
  ON `country_on_film` (id_country_on_film);
CREATE INDEX IN_country_on_film_id_film
  ON `country_on_film` (id_film);
CREATE INDEX IN_country_on_film_id_country
  ON `country_on_film` (id_country);


CREATE TABLE IF NOT EXISTS genre (
  id_genre INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),

  PRIMARY KEY (id_genre)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_genre_id_genre
  ON `genre` (id_genre);
CREATE INDEX IN_genre_name
  ON `genre` (name);


DROP TABLE IF EXISTS genre_on_film;

CREATE TABLE IF NOT EXISTS genre_on_film (
  id_genre_on_film INT(11) NOT NULL AUTO_INCREMENT,
  id_film INT(11) NOT NULL,
  id_genre INT(11) NOT NULL,

  PRIMARY KEY (id_genre_on_film),
  FOREIGN KEY (id_film) REFERENCES film(id_film),
  FOREIGN KEY (id_genre) REFERENCES genre(id_genre)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS genre;

CREATE UNIQUE INDEX UN_genre_on_film_id_genre_on_film
  ON `genre_on_film` (id_genre_on_film);
CREATE INDEX IN_genre_on_film_id_film
  ON `genre_on_film` (id_film);
CREATE INDEX IN_genre_on_film_id_genre
  ON `genre_on_film` (id_genre);

DROP TABLE IF EXISTS film_review;
CREATE TABLE IF NOT EXISTS film_review (
  id_film_review INT(11) NOT NULL AUTO_INCREMENT,
  id_film INT(11) NOT NULL ,
  id_user INT(11) NOT NULL ,
  review_text TEXT NOT NULL,
  date DATETIME NOT NULL DEFAULT NOW(),

  PRIMARY KEY (id_film_review),
  FOREIGN KEY (id_film) REFERENCES film(id_film),
  FOREIGN KEY (id_user) REFERENCES user(id_user)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_film_review_id_film_review
  ON film_review (id_film_review);
CREATE INDEX IN_film_review_id_film
  ON film_review (id_film);
CREATE INDEX IN_film_review_id_user
  ON film_review (id_user);
CREATE FULLTEXT INDEX IN_film_review_review_text
  ON film_review (review_text);
CREATE INDEX IN_film_review_date
  ON film_review (date);

