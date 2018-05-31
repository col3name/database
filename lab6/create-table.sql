CREATE DATABASE IF NOT EXISTS lab06;
USE lab06;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11)      NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `phone`     varchar(20)  NOT NULL,

  PRIMARY KEY (id_client)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_client_id_client
  ON `client` (id_client);
CREATE INDEX IN_client_full_name
  ON `client` (full_name);
CREATE INDEX IN_client_phone
  ON `client` (phone);

CREATE TABLE IF NOT EXISTS `hotel` (
  `id_hotel`     INT(11)      NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(255) NOT NULL,
  `number_stars` INT(11)      NOT NULL,
  `address`      VARCHAR(255) NOT NULL,

  PRIMARY KEY (id_hotel)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_hotel_id_hotel
  ON `hotel` (id_hotel);
CREATE INDEX IN_hotel_name
  ON `hotel` (name);
CREATE INDEX IN_hotel_number_stars
  ON `hotel` (number_stars);
CREATE INDEX IN_hotel_address
  ON `hotel` (address);


CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` INT(11) NOT NULL AUTO_INCREMENT,
  `id_client`      INT(11) NOT NULL,
  `date`           DATE    NOT NULL,

  PRIMARY KEY (id_reservation),
  FOREIGN KEY (id_client) REFERENCES client (id_client)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_reservation_id_reservation
  ON `reservation` (id_reservation);
CREATE INDEX IN_reservation_id_client
  ON `reservation` (id_client);
CREATE INDEX IN_reservation_date
  ON `reservation` (date);

CREATE TABLE IF NOT EXISTS `room_kind` (
  `id_room_kind` INT(11)      NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(255) NOT NULL,
  `min_area`     INT(11)      NOT NULL,

  PRIMARY KEY (id_room_kind)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_room_kind_id_room_kind
  ON `room_kind` (id_room_kind);
CREATE INDEX IN_room_kind_name
  ON `room_kind` (name);
CREATE INDEX IN_room_kind_min_area
  ON `room_kind` (min_area);

CREATE TABLE IF NOT EXISTS `room` (
  `id_room`           INT(11) NOT NULL AUTO_INCREMENT,
  `id_hotel`          INT(11) NOT NULL,
  `id_room_kind`      INT(11) NOT NULL,
  `number_in_hotel`   INT(11) NOT NULL,
  `cost_of_one_night` INT(11) NOT NULL,

  PRIMARY KEY (id_room),
  FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel),
  FOREIGN KEY (id_room_kind) REFERENCES room_kind (id_room_kind)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_room_id_room
  ON `room` (id_room);
CREATE INDEX IN_room_id_hotel
  ON `room` (id_hotel);
CREATE INDEX IN_room_id_room_kind
  ON `room` (id_room_kind);
CREATE INDEX IN_room_number_in_hotel
  ON `room` (number_in_hotel);
CREATE INDEX IN_room_cost_of_one_night
  ON `room` (cost_of_one_night);

CREATE TABLE IF NOT EXISTS `room_in_reservation` (
  `id_room_in_reservation` INT(11) NOT NULL AUTO_INCREMENT,
  `id_reservation`         INT(11) NOT NULL,
  `id_room`                INT(11) NOT NULL,
  `date_of_arrival`        DATE    NOT NULL,
  `date_of_departure`      DATE DEFAULT NULL,

  PRIMARY KEY (id_room_in_reservation),
  FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation),
  FOREIGN KEY (id_room) REFERENCES room(id_room)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_room_in_reservation_id_room_in_reservation
  ON `room_in_reservation` (id_room_in_reservation);
CREATE INDEX IN_room_in_reservation_id_room
  ON `room_in_reservation` (id_room);
CREATE INDEX IN_room_in_reservation_date_of_arrival
  ON `room_in_reservation` (date_of_arrival);
CREATE INDEX IN_room_in_reservation_date_of_departure
  ON `room_in_reservation` (date_of_departure);
