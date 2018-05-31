-- 2. Выдать оценки студентов по математике если они обучаются/обучались данному предмету.
--    Оформить выдачу данных с использованием view.
CREATE OR REPLACE VIEW student_rate_on_math AS
  SELECT
    student.surname AS student_surname,
    rate.rate       AS student_rate
  FROM rate
    LEFT JOIN subject
      ON rate.id_subject = subject.id_subject
    LEFT JOIN student
      ON rate.id_student = student.id_student
  WHERE subject.name = 'математика' AND rate.rate IS NOT NULL;

SELECT *
FROM student_rate_on_math;

-- 3) Дать информацию о должниках с указанием фамилии студента и названия предмета.
DELIMITER //
CREATE PROCEDURE get_debtor(IN group_name VARCHAR(255))
  BEGIN
    DROP TABLE IF EXISTS group_deptor;
    CREATE TEMPORARY TABLE IF NOT EXISTS group_deptor AS (

      SELECT
        student.id_student,
        student.surname AS student_surname,
        subject.name    AS subjet_name,
        pair.id_pair
      FROM pair
        LEFT JOIN subject ON pair.id_subject = subject.id_subject
        LEFT JOIN `group` ON pair.id_group = `group`.id_group
        LEFT JOIN student ON `group`.id_group = student.id_group
      WHERE `group`.name = group_name
    );

    SELECT DISTINCT
      group_deptor.student_surname,
      group_deptor.subjet_name
    FROM group_deptor
      LEFT JOIN rate ON rate.id_student = group_deptor.id_student AND rate.id_pair = group_deptor.id_pair
    GROUP BY group_deptor.student_surname
    HAVING COUNT(rate.rate) = 0;
    DROP TABLE IF EXISTS group_deptor;
  END //
DELIMITER ;

CALL get_debtor('ПС-22');

-- 4. Дать среднюю оценку студентов по каждому предмету для тех предметов, по которым занимается не менее 10 студентов.
SELECT
  student.surname AS student_surname,
  subject.name    AS subject_name,
  AVG(rate.rate)  AS avarage_rate
FROM rate
  LEFT JOIN student ON rate.id_student = student.id_student
  LEFT JOIN pair ON rate.id_pair = pair.id_pair
  LEFT JOIN subject ON pair.id_subject = subject.id_subject
GROUP BY student_surname
HAVING COUNT(student.id_student) >= 10;

-- 6) Всем студентам специальности ИВТ, получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл.
UPDATE rate
  LEFT JOIN pair USING (id_pair)
  LEFT JOIN `group` USING (id_group)
  LEFT JOIN specialty USING (id_specialty)
  LEFT JOIN subject USING (id_subject)
SET rate.rate = rate.rate + 1
WHERE specialty.name = 'ИВТ' AND subject.name = 'базы данных' AND pair.date < '12.05.18';