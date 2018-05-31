-- 2) Выдать информацию о клиентах гостиницы “Алтай”, проживающих в номерах категории “люкс”.
SELECT
  client.id_client AS id_client,
  client.full_name AS full_name,
  client.phone     AS phone
FROM room_in_reservation
  LEFT JOIN reservation ON reservation.id_reservation = room_in_reservation.id_reservation
  LEFT JOIN client ON client.id_client = reservation.id_client
  LEFT JOIN room ON room.id_room = room_in_reservation.id_room_in_reservation
  LEFT JOIN room_kind ON room_kind.id_room_kind = room.id_room_kind
  LEFT JOIN hotel ON hotel.id_hotel = room.id_hotel
WHERE room_kind.name = 'люкс' AND hotel.name = 'Алтай';

-- 3)  Дать список свободных номеров всех гостиниц на 30.05.12.
SELECT DISTINCT
  hotel.name           AS hotel_name,
  room.number_in_hotel AS number_in_hotel
FROM room_in_reservation AS rir
  LEFT JOIN room ON room.id_room = rir.id_room
  LEFT JOIN hotel ON hotel.id_hotel = room.id_hotel
WHERE rir.date_of_arrival NOT BETWEEN '12-05-30' AND '12-05-31' OR rir.date_of_arrival IS NOT NULL;

-- 4)  Дать количество проживающих в гостинице “Восток” на 25.05.12 по каждой категории номера
SELECT
  room.id_room_kind,
  COUNT(room.id_room_kind) AS count_free_room
FROM room_in_reservation AS rir
  LEFT JOIN room ON room.id_room = rir.id_room_in_reservation
  LEFT JOIN hotel ON hotel.id_hotel = room.id_hotel
  LEFT JOIN reservation ON reservation.id_reservation = rir.id_room_in_reservation
WHERE hotel.name = 'Восток' AND
      rir.date_of_arrival <= '12-05-25' AND (rir.date_of_departure >= '12-05-25' OR rir.date_of_departure IS NULL)
GROUP BY room.id_room_kind;

-- 5) Дать список последних проживавших клиентов по всем комнатам гостиницы “Космос”,
-- выехавшим в апреле 2012 с указанием даты выезда.
CREATE TEMPORARY TABLE IF NOT EXISTS
  tmp_last_april
  AS (
    SELECT
      room.id_room                               AS id_room,
      MAX(room_in_reservation.date_of_departure) AS max_dep_date
    FROM room_in_reservation
      LEFT JOIN room ON room.id_room = room_in_reservation.id_room
      LEFT JOIN hotel ON hotel.id_hotel = room.id_hotel
    WHERE hotel.name = 'Космос' AND room_in_reservation.date_of_departure BETWEEN '2012-04-01' AND '2012-04-30'
    GROUP BY id_room
  );

SELECT
  tmp_last_april.id_room AS id_room,
  client.id_client       AS id_client,
  client.full_name       AS client_full_name
FROM tmp_last_april
  LEFT JOIN room_in_reservation
    ON room_in_reservation.id_room = tmp_last_april.id_room AND
       tmp_last_april.max_dep_date = room_in_reservation.date_of_departure
  LEFT JOIN reservation
    ON room_in_reservation.id_reservation = reservation.id_reservation
  LEFT JOIN client ON reservation.id_client = client.id_client;

-- 6)  Продлить до 30.05.12 дату проживания в гостинице “Сокол” всем клиентам комнат категории “люкс”, которые заселились 15.05.12, а выезжают 28.05.12
UPDATE room_in_reservation AS rir
  LEFT JOIN room
    ON room.id_room = rir.id_room
  LEFT JOIN hotel
    ON hotel.id_hotel = room.id_hotel
  LEFT JOIN room_kind
    ON room_kind.id_room_kind = room.id_room_kind
SET rir.date_of_departure = '12-05-30'
WHERE hotel.name = 'Сокол' AND room_kind.name = 'люкс' AND rir.date_of_arrival = '12.05.15' AND
      rir.date_of_departure = '12-05-28';

-- 7) Привести пример транзакции при создании брони.
START TRANSACTION;
INSERT INTO reservation (id_client, date) VALUE
  (1, NOW());

SET @last_reservation_id = LAST_INSERT_ID();

SET @free_room_id = (SELECT room.id_room
                     FROM room_in_reservation
                       LEFT JOIN room ON room_in_reservation.id_room = room.id_room
                       LEFT JOIN hotel ON room.id_hotel = hotel.id_hotel
                       LEFT JOIN room_kind ON room.id_room_kind = room_kind.id_room_kind
                     WHERE hotel.name = 'Восток' AND room_kind.name = 'люкс' AND
                           (date_of_departure < NOW() OR date_of_departure IS NULL) OR date_of_arrival > NOW()
                     LIMIT 1);

INSERT INTO room_in_reservation (id_reservation, id_room, date_of_arrival) VALUE
  (@last_reservation_id, @free_room_id, NOW());
COMMIT;