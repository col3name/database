# Главная страница
#
# Для фильтров каталога
# 1) Получить 20 фильмов 2016 года
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path,
  film.issue_year  AS film_issue_year
FROM film
  INNER JOIN (
               SELECT film.id_film
               FROM film
               WHERE film.issue_year = '2016'
               LIMIT 0, 20
             ) AS lim USING (id_film);

# 2) Получить информацию о фильма в с 2016 по 2018 годы
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path,
  film.issue_year  AS film_issue_year
FROM film
  INNER JOIN (
               SELECT film.id_film
               FROM film
               WHERE film.issue_year BETWEEN '2016' AND '2018'
               LIMIT 0, 20
             ) AS lim USING (id_film);

# 3) Получить 20 фильмов определенного жанра (например, спорт)
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path,
  film.issue_year  AS film_issue_year
FROM film
  INNER JOIN (
               SELECT film.id_film
               FROM genre_on_film
                 LEFT JOIN genre ON genre_on_film.id_genre = genre.id_genre
                 LEFT JOIN film ON genre_on_film.id_genre = film.id_film
               WHERE genre.name = 'Спорт'
               GROUP BY film.id_film
               LIMIT 0, 20
             ) AS lim USING (id_film);

# 4) Получить 20 фильмов любого жанра
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path,
  film.issue_year  AS film_issue_year
FROM film
LIMIT 20;

# 5) Получить 20 фильмов из США
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path,
  film.issue_year  AS film_issue_year
FROM film
  INNER JOIN (
               SELECT film.id_film
               FROM country_on_film
                 LEFT JOIN country ON country_on_film.id_country = country.id_country
                 LEFT JOIN film ON country_on_film.id_film = film.id_film
               WHERE country.name = 'США'
               GROUP BY film.id_film
               LIMIT 0, 20
             ) AS lim USING (id_film);

# Детальная страница
# 6) Получить жанры фильма по id фильмы (т.к. при переходе на детальную в GET запросе передасться id_film)
#    остальные профессии по аналоги
SELECT genre.name
FROM genre_on_film
  LEFT JOIN film ON genre_on_film.id_film = film.id_film
  LEFT JOIN genre ON genre_on_film.id_genre = genre.id_genre
WHERE film.id_film = 2;

# 7) Получить актеров фильма id фильма
SELECT person.name
FROM person_x_film AS pxf
  LEFT JOIN person ON pxf.id_person = person.id_person
  LEFT JOIN profession_on_film pro ON pxf.id_profession_on_film = pro.id_profession_on_film
WHERE id_film = 2 AND pro.name = 'актер';

# 8) Отзывы к фильму
SELECT
  film_review.review_text,
  film_review.date,
  user.login
FROM film_review
  LEFT JOIN film ON film_review.id_film = film.id_film
  LEFT JOIN user ON film_review.id_user = user.id_user
WHERE film.id_film = 8;

# 9) Получить фильмы, где снимался Евгений Кузнцeов
SELECT
  film.id_film,
  film.name        AS film_name,
  film.description AS film_description,
  film.image_path  AS film_image_path
FROM person_x_film
  LEFT JOIN person ON person_x_film.id_person = person.id_person
  LEFT JOIN profession_on_film AS pnf ON person_x_film.id_profession_on_film = pnf.id_profession_on_film
WHERE person.name = 'Евгений Кузнцеов' AND pnf.name = 'актер';

# 10) Оставить отзыв
INSERT INTO film_review (id_film, id_user, review_text) VALUE
  (1, 2, 'Фильм понравился. Всем совету посмотреть');

# 11) Удалить отзыв пользователя
DELETE FROM film_review
WHERE film_review.id_user = 1;

# 12) Редкатировать название фильмы
UPDATE film
SET film.name = '123'
WHERE id_film = '3';

# 13) Добавить жанр фильму
INSERT INTO genre_on_film (id_film, id_genre) VALUE
  (1, 2);

# 14) Удалить жанр у фильма
-- redo
DELETE FROM genre_on_film
WHERE genre_on_film.id_film = 1 AND genre_on_film.id_genre = 2;

-- 15) добавление жанра
INSERT INTO genre (name) VALUE ('Детектив');

-- 16 удаление жанра
DELETE FROM genre
WHERE genre.id_genre = 1;

-- 17) добавление страны
INSERT INTO country (name) VALUE ('Великобритания');

-- 18) удаление страны
DELETE FROM country
WHERE country.id_country = 1;

-- 19) добавление профессии
INSERT INTO profession_on_film (name) VALUE ('Сценарист');

-- 20) удаление профессии
DELETE FROM profession_on_film
WHERE profession_on_film.id_country = 1;

-- 21) добавление фильма
INSERT INTO film (name, description, image_path, issue_year) VALUE
  ('Побег из Шоушенка',
   'Культовый американский художественный фильм-драма 1994 года, снятый режиссёром Фрэнком Дарабонтом по повести Стивена Кинга «Рита Хейуорт и спасение из Шоушенка',
   'image/image.jpg', 2008);

-- 22) удаление фильма
DELETE FROM film
WHERE id_film = 1;

-- 23) самый комментируемый фильм
SELECT
  film.name,
  MAX(comment_count) AS comment_count
FROM (
       SELECT
         id_film,
         COUNT(id_film) AS comment_count
       FROM film_review
       GROUP BY id_film) AS counts
  LEFT JOIN film USING (id_film)
ORDER BY comment_count DESC;

-- 24) самый популярный жанр
SELECT
  genre.name,
  MAX(comment_count) AS film_count
FROM (
       SELECT
         id_genre,
         COUNT(id_film) AS comment_count
       FROM genre_on_film
       GROUP BY id_genre) AS counts
  LEFT JOIN genre USING (id_genre)
ORDER BY comment_count DESC;

-- 25) сколько фильмов по годам
SELECT
  film.issue_year,
  COUNT(id_film) AS count_film
FROM film
GROUP BY issue_year
ORDER BY count_film DESC;

-- 26) обновить постер фильма
UPDATE film
SET image_path = '/image/film/new-image.png'
WHERE id_film = 1;

-- 27) удалить постер фильма
UPDATE film
SET image_path = NULL
WHERE id_film = 1;

-- 28) редактировать название фильма
UPDATE film
SET name = 'Чудо'
WHERE id_film = 1;

-- 29) редактировать описание фильма
UPDATE film
SET description = 'Чудо'
WHERE id_film = 1;