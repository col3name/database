CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id_pharmacy` INT(11)      NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(255) NOT NULL,
  `address`     VARCHAR(255) NOT NULL,

  PRIMARY KEY (id_pharmacy)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_pharmacy_id_pharmacy
  ON `pharmacy` (id_pharmacy);
CREATE INDEX IN_pharmacy_name
  ON `pharmacy` (name);
CREATE INDEX IN_pharmacy_address
  ON `pharmacy` (address);

CREATE TABLE IF NOT EXISTS `pharmaceutical_company` (
  `id_pharmaceutical_company` INT(11)      NOT NULL AUTO_INCREMENT,
  `name`                      VARCHAR(255) NOT NULL,
  `date_foundation`           DATE         NOT NULL,

  PRIMARY KEY (id_pharmaceutical_company)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_pharmaceutical_company_id_pharmaceutical_company
  ON `pharmaceutical_company` (id_pharmaceutical_company);
CREATE INDEX IN_pharmaceutical_company_name
  ON `pharmaceutical_company` (name);
CREATE INDEX IN_pharmaceutical_company_date_foundation
  ON `pharmaceutical_company` (date_foundation);

CREATE TABLE IF NOT EXISTS `dealer_company` (
  `id_dealer_company`         INT(11)      NOT NULL AUTO_INCREMENT,
  `id_pharmaceutical_company` INT(11)      NOT NULL,
  `family_dialer`             VARCHAR(255) NOT NULL,
  `phone`                     VARCHAR(20)  NOT NULL,

  PRIMARY KEY (id_dealer_company),
  FOREIGN KEY (id_pharmaceutical_company) REFERENCES pharmaceutical_company (id_pharmaceutical_company)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_dealer_company_id_dealer_company
  ON `dealer_company` (id_dealer_company);
CREATE INDEX IN_dealer_company_id_pharmaceutical_company
  ON `dealer_company` (id_pharmaceutical_company);
CREATE INDEX IN_dealer_company_family_dialer
  ON `dealer_company` (family_dialer);
CREATE INDEX IN_dealer_company_phone
  ON `dealer_company` (phone);

CREATE TABLE IF NOT EXISTS `drug` (
  `id_drug`                     INT(11)      NOT NULL AUTO_INCREMENT,
  `name`                        VARCHAR(255) NOT NULL,
  `duration_standard_treatment` INT(11)      NOT NULL,

  PRIMARY KEY (id_drug)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_drug_id_drug
  ON `drug` (id_drug);
CREATE INDEX IN_drug_name
  ON `drug` (name);
CREATE INDEX IN_drug_duration_standard_treatment
  ON `drug` (duration_standard_treatment);


CREATE TABLE IF NOT EXISTS `production_drug` (
  `id_production_drug`        INT(11) NOT NULL AUTO_INCREMENT,
  `id_pharmaceutical_company` INT(11) NOT NULL,
  `id_drug`                   INT(11) NOT NULL,
  `price_per_unit_production` INT(11) NOT NULL,
  `quality_assessment`        INT(11) NOT NULL,

  PRIMARY KEY (id_production_drug),
  FOREIGN KEY (id_pharmaceutical_company) REFERENCES pharmaceutical_company (id_pharmaceutical_company),
  FOREIGN KEY (id_drug) REFERENCES drug (id_drug)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 350
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_production_drug_id_production_drug
  ON `production_drug` (id_production_drug);
CREATE INDEX IN_production_id_pharmaceutical_company
  ON `production_drug` (id_pharmaceutical_company);
CREATE INDEX IN_production_drug_id_drug
  ON `production_drug` (id_drug);
CREATE INDEX IN_production_drug_price_per_unit_production
  ON `production_drug` (price_per_unit_production);
CREATE INDEX IN_production_drug_quality_assessment
  ON `production_drug` (quality_assessment);

CREATE TABLE IF NOT EXISTS `ordering` (
  `id_ordering`        INT(11) NOT NULL AUTO_INCREMENT,
  `id_production_drug` INT(11) NOT NULL,
  `id_dialer_company`  INT(11) NOT NULL,
  `id_pharmacy`        INT(11) NOT NULL,
  `date_order`         DATE    NOT NULL,
  `number_drug`        INT(11) NOT NULL,

  PRIMARY KEY (id_ordering),
  FOREIGN KEY (id_production_drug) REFERENCES production_drug (id_production_drug),
  FOREIGN KEY (id_dialer_company) REFERENCES dealer_company (id_dealer_company),
  FOREIGN KEY (id_pharmacy) REFERENCES pharmacy (id_pharmacy)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 401
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX UN_ordering_id_ordering
  ON `ordering` (id_ordering);
CREATE INDEX IN_production_id_production_drug
  ON `ordering` (id_production_drug);
CREATE INDEX IN_production_id_dialer_company
  ON `ordering` (id_dialer_company);
CREATE INDEX IN_production_id_pharmacy
  ON `ordering` (id_pharmacy);
CREATE INDEX IN_production_date_order
  ON `ordering` (date_order);
CREATE INDEX IN_production_number_drug
  ON `ordering` (number_drug);
