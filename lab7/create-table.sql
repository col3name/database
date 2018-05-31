CREATE TABLE IF NOT EXISTS teacher (
  id_teacher INT(11)      NOT NULL AUTO_INCREMENT,
  surname    VARCHAR(255) NOT NULL,
  post       VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_teacher)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_teacher_id_teacher
  ON teacher (id_teacher);
CREATE INDEX IN_teacher_surname
  ON teacher (surname);
CREATE INDEX IN_teacher_post
  ON teacher (post);

CREATE TABLE IF NOT EXISTS subject (
  id_subject         INT(11)      NOT NULL AUTO_INCREMENT,
  name               VARCHAR(255) NOT NULL,
  study_hours_number INT(11)      NOT NULL,
  PRIMARY KEY (id_subject)
)
  ENGINE = InnodDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_subject_id_subject
  ON subject (id_subject);
CREATE INDEX IN_subject_name
  ON subject (name);
CREATE INDEX IN_subject_study_hours_number
  ON subject (study_hours_number);

CREATE TABLE IF NOT EXISTS specialty (
  id_specialty INT(11)      NOT NULL AUTO_INCREMENT,
  name         VARCHAR(255) NOT NULL,

  PRIMARY KEY (id_specialty)
)
  ENGINE = InnodDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_specialty_id_specialty
  ON specialty (id_specialty);
CREATE INDEX IN_specialty_name
  ON specialty (name);

CREATE TABLE IF NOT EXISTS `group` (
  id_group      INT(11)      NOT NULL AUTO_INCREMENT,
  name          VARCHAR(255) NOT NULL,
  id_praepostor INT(11)      NOT NULL,
  id_specialty  INT(11)      NOT NULL,

  PRIMARY KEY (id_group),
  FOREIGN KEY (id_specialty) REFERENCES specialty (id_specialty)
)
  ENGINE = InnodDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_group_id_group
  ON `group` (id_group);
CREATE INDEX IN_group_name
  ON `group` (name);
CREATE INDEX IN_group_id_praepostor
  ON `group` (id_praepostor);
CREATE INDEX IN_group_id_specialty
  ON `group` (id_specialty);

# ================================
CREATE TABLE IF NOT EXISTS `student` (
  id_student INT(11)      NOT NULL AUTO_INCREMENT,
  surname    VARCHAR(255) NOT NULL,
  id_group   INT(11)      NOT NULL,
  birth_year INT(11)      NOT NULL,

  PRIMARY KEY (id_student),
  FOREIGN KEY (id_group) REFERENCES `group` (id_group)
)
  ENGINE = InnodDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_student_id_student
  ON `student` (id_student);
CREATE INDEX IN_student_surname
  ON `student` (surname);
CREATE INDEX IN_student_id_group
  ON `student` (id_group);
CREATE INDEX IN_student_birth_year
  ON `student` (birth_year);

CREATE TABLE IF NOT EXISTS `pair` (
  id_pair    INT(11) NOT NULL AUTO_INCREMENT,
  id_teacher INT(11) NOT NULL,
  id_subject INT(11) NOT NULL,
  id_group   INT(11) NOT NULL,
  `date`     DATETIME,

  PRIMARY KEY (id_pair),
  FOREIGN KEY (id_teacher) REFERENCES `teacher` (id_teacher),
  FOREIGN KEY (id_subject) REFERENCES `subject` (id_subject),
  FOREIGN KEY (id_group) REFERENCES `group` (id_group)
)
  ENGINE = InnodDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_pair_id_pair
  ON `pair` (id_pair);
CREATE INDEX IN_pair_id_teacher
  ON `pair` (id_teacher);
CREATE INDEX IN_pair_id_subject
  ON `pair` (id_subject);
CREATE INDEX IN_pair_id_group
  ON `pair` (id_group);
CREATE INDEX IN_pair_date
  ON `pair` (`date`);

CREATE TABLE IF NOT EXISTS `rate` (
  id_rate    INT(11) NOT NULL AUTO_INCREMENT,
  id_student INT(11) NOT NULL,
  id_pair INT(11) NOT NULL,
  `rate`     INT(11),

  PRIMARY KEY (id_rate),
  FOREIGN KEY (id_student) REFERENCES `student` (id_student),
  FOREIGN KEY (id_pair) REFERENCES `pair` (id_pair)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_rate_id_rate
  ON `rate` (id_rate);
CREATE INDEX IN_pair_id_student
  ON `rate` (id_student);
CREATE INDEX IN_student_id_pair
  ON `rate` (id_pair);
CREATE INDEX IN_pair_date
  ON `rate` (`rate`);