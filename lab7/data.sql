

INSERT INTO specialty (name) VALUES
  ('ПС'),
  ('ИВТ'),
  ('ВМ');

INSERT INTO subject (name, study_hours_number) VALUE
  ('математика', 1332),
  ('ооп', 522),
  ('базы данных', 532),
  ('frontend', 203),
  ('backend', 213),
  ('иип', 234),
  ('GameDev', 432);

INSERT INTO `group` (name, id_praepostor, id_specialty) VALUES
  ('ПС-21', 1, 1),
  ('ПС-22', 1, 1),
  ('ПС-31', 1, 1),
  ('ИВТ-31', 1, 2),
  ('ИВТ-32', 1, 2),
  ('ВМ-32', 1, 3),
  ('ВМ-31', 1, 3);

INSERT INTO student (surname, id_group, birth_year) VALUES
  ('Иванов', 1, 1998),
  ('Петров', 1, 1998),
  ('Гайдуков', 1, 1998),
  ('Гребнева', 1, 1998),
  ('Захарова', 1, 1998),
  ('Исаламов', 1, 1998),
  ('Лучинина', 1, 1998),
  ('Маткчов', 1, 1998),
  ('Пртасов', 1, 1998),
  ('Иванов', 1, 1998),
  ('Иванович', 2, 1958),
  ('Петро', 3, 1968),
  ('Овечкин', 3, 1978),
  ('Кузнецов', 2, 1985),
  ('Кучеров', 2, 1993),
  ('Тарасенко', 2, 1992),
  ('Панарин', 3, 1995),
  ('Орлов', 3, 1980),
  ('Бобровский', 3, 1987);

INSERT INTO teacher (surname, post) VALUES
  ('Петров', 'преподаватель'),
  ('Иванов', 'преподаватель'),
  ('Васильев', 'преподаватель');

INSERT INTO pair (id_teacher, id_subject, id_group, date) VALUES
  (1, 4, 2, '2018-01-02 00:00:00.000'),
  (1, 5, 2, '2018-01-09 00:00:00.000'),
  (1, 4, 2, '2018-01-17 00:00:00.000'),
  (1, 5, 2, '2018-01-28 00:00:00.000'),
  (1, 4, 2, '2018-02-05 00:00:00.000'),
  (1, 5, 2, '2018-02-14 00:00:00.000'),
  (1, 4, 2, '2018-02-21 00:00:00.000'),
  (1, 5, 2, '2018-02-21 00:00:00.000'),
  (1, 4, 2, '2018-02-28 00:00:00.000'),
  (1, 4, 2, '2018-03-05 00:00:00.000'),
  (1, 4, 2, '2018-03-13 00:00:00.000'),
  (1, 4, 2, '2018-03-20 00:00:00.000'),
  (1, 4, 2, '2018-03-27 00:00:00.000'),
  (1, 4, 2, '2018-04-04 00:00:00.000'),
  (1, 4, 2, '2018-05-24 00:00:00.000'),
  (1, 4, 2, '2018-05-25 00:00:00.000'),
  (1, 5, 2, '2018-02-28 00:00:00.000'),
  (1, 5, 2, '2018-03-05 00:00:00.000'),
  (1, 5, 2, '2018-03-13 00:00:00.000'),
  (1, 5, 2, '2018-03-20 00:00:00.000'),
  (1, 5, 2, '2018-03-27 00:00:00.000'),
  (1, 5, 2, '2018-04-04 00:00:00.000'),
  (1, 5, 2, '2018-05-24 00:00:00.000'),
  (1, 5, 2, '2018-05-25 00:00:00.000');

INSERT INTO student (surname, id_group, birth_year) VALUES
  ('Ijlf', 1, 1998),
  ('Cntgfyjdf', 1, 1998),
  ('Cjcyjdcrfz', 1, 1998),
  ('Uh,tytfz', 1, 1998),
  ('Pf[fhjd', 1, 1998),
  ('Bckfvjd', 1, 1998),
  ('Kexbibybf', 1, 1998),
  ('Vfn.rjd', 1, 1998),
  ('Ghjnfcjd', 1, 1998),
  ('Bdfyjd', 1, 1998),
  ('Bdfyjdbx', 2, 1958),
  ('Gtnhj', 3, 1968),
  ('Ovechkin', 3, 1978),
  ('Kuznecov', 2, 1985),
  ('Kuxerov', 2, 1993),
  ('Tarasenkto', 2, 1992),
  ('Panarin', 3, 1995),
  ('Orlov', 3, 1980),
  ('Boborovsky', 3, 1987);

INSERT INTO teacher (surname, post) VALUES
  ('Петров', 'преподаватель'),
  ('Иванов', 'преподаватель'),
  ('Васильев', 'преподаватель');

INSERT INTO pair (id_teacher, id_subject, id_group, date) VALUES
  (1, 4, 2, '2018-01-02 00:00:00.000'),
  (1, 5, 2, '2018-01-09 00:00:00.000'),
  (1, 4, 2, '2018-01-17 00:00:00.000'),
  (1, 5, 2, '2018-01-28 00:00:00.000'),
  (1, 4, 2, '2018-02-05 00:00:00.000'),
  (1, 5, 2, '2018-02-14 00:00:00.000'),
  (1, 4, 2, '2018-02-21 00:00:00.000'),
  (1, 5, 2, '2018-02-21 00:00:00.000'),
  (1, 4, 2, '2018-02-28 00:00:00.000'),
  (1, 4, 2, '2018-03-05 00:00:00.000'),
  (1, 4, 2, '2018-03-13 00:00:00.000'),
  (1, 4, 2, '2018-03-20 00:00:00.000'),
  (1, 4, 2, '2018-03-27 00:00:00.000'),
  (1, 4, 2, '2018-04-04 00:00:00.000'),
  (1, 4, 2, '2018-05-24 00:00:00.000'),
  (1, 4, 2, '2018-05-25 00:00:00.000'),
  (1, 5, 2, '2018-02-28 00:00:00.000'),
  (1, 5, 2, '2018-03-05 00:00:00.000'),
  (1, 5, 2, '2018-03-13 00:00:00.000'),
  (1, 5, 2, '2018-03-20 00:00:00.000'),
  (1, 5, 2, '2018-03-27 00:00:00.000'),
  (1, 5, 2, '2018-04-04 00:00:00.000'),
  (1, 5, 2, '2018-05-24 00:00:00.000'),
  (1, 5, 2, '2018-05-25 00:00:00.000');

INSERT INTO rate (id_student, id_pair, rate) VALUES
  (21, 1, 3),
  (22, 1, 4),
  (23, 1, 4),
  (24, 1, 4),
  (25, 1, 4),
  (26, 1, 4),
  (25, 1, 4),
  (26, 1, 4),
  (28, 1, 4),
  (29, 1, 4),
  (30, 1, 4),
  (31, 1, 4),
  (32, 1, 4),
  (33, 1, 4),
  (34, 1, 4),
  (35, 1, 4),
  (36, 1, 4),
  (21, 2, 3),
  (21, 3, 3),
  (21, 4, 3),
  (21, 4, 3),
  (21, 5, 3),
  (21, 6, 3),
  (21, 7, 3),
  (21, 8, 3),
  (21, 9, 3),
  (21, 10, 3),
  (21, 11, 3),
  (21, 12, 3),
  (21, 13, 3),
  (21, 14, 3),
  (21, 15, 3),
  (21, 16, 3),
  (21, 17, 3),
  (21, 18, 3),
  (21, 19, 3),
  (21, 20, 3),
  (21, 21, 3),
  (22, 2, 4),
  (22, 3, 4),
  (22, 4, 4),
  (22, 4, 4),
  (22, 5, 4),
  (22, 6, 4),
  (22, 7, 4),
  (22, 8, 4),
  (22, 9, 4),
  (22, 10, 4),
  (22, 11, 4),
  (22, 12, 4),
  (22, 13, 4),
  (22, 14, 4),
  (22, 15, 4),
  (22, 16, 4),
  (22, 17, 4),
  (22, 18, 4),
  (22, 19, 4),
  (22, 20, 4),
  (22, 21, 4),
  (23, 2, 4),
  (23, 3, 4),
  (23, 4, 4),
  (23, 4, 4),
  (23, 5, 4),
  (23, 6, 4),
  (23, 7, 4),
  (23, 8, 4),
  (23, 9, 4),
  (23, 10, 4),
  (23, 11, 4),
  (23, 12, 4),
  (23, 13, 4),
  (23, 14, 4),
  (23, 15, 4),
  (23, 16, 4),
  (23, 17, 4),
  (23, 18, 4),
  (23, 19, 4),
  (23, 20, 4),
  (23, 21, 4),
  (24, 2, 4),
  (24, 3, 4),
  (24, 4, 4),
  (24, 4, 4),
  (24, 5, 4),
  (24, 6, 4),
  (24, 7, 4),
  (24, 8, 4),
  (24, 9, 4),
  (24, 10, 4),
  (24, 11, 4),
  (24, 12, 4),
  (24, 13, 4),
  (24, 14, 4),
  (24, 15, 4),
  (24, 16, 4),
  (24, 17, 4),
  (24, 18, 4),
  (24, 19, 4),
  (24, 20, 4),
  (24, 21, 4),
  (25, 2, 4),
  (25, 3, 4),
  (25, 4, 4),
  (25, 4, 4),
  (25, 5, 4),
  (25, 6, 4),
  (25, 7, 4),
  (25, 8, 4),
  (25, 9, 4),
  (25, 10, 4),
  (25, 11, 4),
  (25, 12, 4),
  (25, 13, 4),
  (25, 14, 4),
  (25, 15, 4),
  (25, 16, 4),
  (25, 17, 4),
  (25, 18, 4),
  (25, 19, 4),
  (25, 20, 4),
  (25, 21, 4),
  (26, 2, 4),
  (26, 3, 4),
  (26, 4, 4),
  (26, 4, 4),
  (26, 5, 4),
  (26, 6, 4),
  (26, 7, 4),
  (26, 8, 4),
  (26, 9, 4),
  (26, 10, 4),
  (26, 11, 4),
  (26, 12, 4),
  (26, 13, 4),
  (26, 14, 4),
  (26, 15, 4),
  (26, 16, 4),
  (26, 17, 4),
  (26, 18, 4),
  (26, 19, 4),
  (26, 20, 4),
  (26, 21, 4),
  (25, 2, 4),
  (25, 3, 4),
  (25, 4, 4),
  (25, 4, 4),
  (25, 5, 4),
  (25, 6, 4),
  (25, 7, 4),
  (25, 8, 4),
  (25, 9, 4),
  (25, 10, 4),
  (25, 11, 4),
  (25, 12, 4),
  (25, 13, 4),
  (25, 14, 4),
  (25, 15, 4),
  (25, 16, 4),
  (25, 17, 4),
  (25, 18, 4),
  (25, 19, 4),
  (25, 20, 4),
  (25, 21, 4),
  (26, 2, 4),
  (26, 3, 4),
  (26, 4, 4),
  (26, 4, 4),
  (26, 5, 4),
  (26, 6, 4),
  (26, 7, 4),
  (26, 8, 4),
  (26, 9, 4),
  (26, 10, 4),
  (26, 11, 4),
  (26, 12, 4),
  (26, 13, 4),
  (26, 14, 4),
  (26, 15, 4),
  (26, 16, 4),
  (26, 17, 4),
  (26, 18, 4),
  (26, 19, 4),
  (26, 20, 4),
  (26, 21, 4),
  (28, 2, 4),
  (28, 3, 4),
  (28, 4, 4),
  (28, 4, 4),
  (28, 5, 4),
  (28, 6, 4),
  (28, 7, 4),
  (28, 8, 4),
  (28, 9, 4),
  (28, 10, 4),
  (28, 11, 4),
  (28, 12, 4),
  (28, 13, 4),
  (28, 14, 4),
  (28, 15, 4),
  (28, 16, 4),
  (28, 17, 4),
  (28, 18, 4),
  (28, 19, 4),
  (28, 20, 4),
  (28, 21, 4),
  (29, 2, 4),
  (29, 3, 4),
  (29, 4, 4),
  (29, 4, 4),
  (29, 5, 4),
  (29, 6, 4),
  (29, 7, 4),
  (29, 8, 4),
  (29, 9, 4),
  (29, 10, 4),
  (29, 11, 4),
  (29, 12, 4),
  (29, 13, 4),
  (29, 14, 4),
  (29, 15, 4),
  (29, 16, 4),
  (29, 17, 4),
  (29, 18, 4),
  (29, 19, 4),
  (29, 20, 4),
  (29, 21, 4),
  (30, 2, 4),
  (30, 3, 4),
  (30, 4, 4),
  (30, 4, 4),
  (30, 5, 4),
  (30, 6, 4),
  (30, 7, 4),
  (30, 8, 4),
  (30, 9, 4),
  (30, 10, 4),
  (30, 11, 4),
  (30, 12, 4),
  (30, 13, 4),
  (30, 14, 4),
  (30, 15, 4),
  (30, 16, 4),
  (30, 17, 4),
  (30, 18, 4),
  (30, 19, 4),
  (30, 20, 4),
  (30, 21, 4),
  (31, 2, 4),
  (31, 3, 4),
  (31, 4, 4),
  (31, 4, 4),
  (31, 5, 4),
  (31, 6, 4),
  (31, 7, 4),
  (31, 8, 4),
  (31, 9, 4),
  (31, 10, 4),
  (31, 11, 4),
  (31, 12, 4),
  (31, 13, 4),
  (31, 14, 4),
  (31, 15, 4),
  (31, 16, 4),
  (31, 17, 4),
  (31, 18, 4),
  (31, 19, 4),
  (31, 20, 4),
  (31, 21, 4),
  (32, 2, 4),
  (32, 3, 4),
  (32, 4, 4),
  (32, 4, 4),
  (32, 5, 4),
  (32, 6, 4),
  (32, 7, 4),
  (32, 8, 4),
  (32, 9, 4),
  (32, 10, 4),
  (32, 11, 4),
  (32, 12, 4),
  (32, 13, 4),
  (32, 14, 4),
  (32, 15, 4),
  (32, 16, 4),
  (32, 17, 4),
  (32, 18, 4),
  (32, 19, 4),
  (32, 20, 4),
  (32, 21, 4),
  (33, 2, 4),
  (33, 3, 4),
  (33, 4, 4),
  (33, 4, 4),
  (33, 5, 4),
  (33, 6, 4),
  (33, 7, 4),
  (33, 8, 4),
  (33, 9, 4),
  (33, 10, 4),
  (33, 11, 4),
  (33, 12, 4),
  (33, 13, 4),
  (33, 14, 4),
  (33, 15, 4),
  (33, 16, 4),
  (33, 17, 4),
  (33, 18, 4),
  (33, 19, 4),
  (33, 20, 4),
  (33, 21, 4),
  (34, 2, 4),
  (34, 3, 4),
  (34, 4, 4),
  (34, 4, 4),
  (34, 5, 4),
  (34, 6, 4),
  (34, 7, 4),
  (34, 8, 4),
  (34, 9, 4),
  (34, 10, 4),
  (34, 11, 4),
  (34, 12, 4),
  (34, 13, 4),
  (34, 14, 4),
  (34, 15, 4),
  (34, 16, 4),
  (34, 17, 4),
  (34, 18, 4),
  (34, 19, 4),
  (34, 20, 4),
  (34, 21, 4),
  (35, 2, 4),
  (35, 3, 4),
  (35, 4, 4),
  (35, 4, 4),
  (35, 5, 4),
  (35, 6, 4),
  (35, 7, 4),
  (35, 8, 4),
  (35, 9, 4),
  (35, 10, 4),
  (35, 11, 4),
  (35, 12, 4),
  (35, 13, 4),
  (35, 14, 4),
  (35, 15, 4),
  (35, 16, 4),
  (35, 17, 4),
  (35, 18, 4),
  (35, 19, 4),
  (35, 20, 4),
  (35, 21, 4),
  (36, 2, 4),
  (36, 3, 4),
  (36, 4, 4),
  (36, 4, 4),
  (36, 5, 4),
  (36, 6, 4),
  (36, 7, 4),
  (36, 8, 4),
  (36, 9, 4),
  (36, 10, 4),
  (36, 11, 4),
  (36, 12, 4),
  (36, 13, 4),
  (36, 14, 4),
  (36, 15, 4),
  (36, 16, 4),
  (36, 17, 4),
  (36, 18, 4),
  (36, 19, 4),
  (36, 20, 4),
  (36, 21, 4);