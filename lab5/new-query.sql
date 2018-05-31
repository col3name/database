-- 2)
-- Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий аптек, дат, объема заказов.
EXPLAIN
SELECT *
FROM ordering
  LEFT JOIN production_drug
    ON production_drug.id_production_drug = ordering.id_production_drug
  LEFT JOIN drug
    ON drug.id_drug = production_drug.id_drug
  LEFT JOIN dealer_company
    ON dealer_company.id_dealer_company = ordering.id_dialer_company
  LEFT JOIN pharmaceutical_company
    ON pharmaceutical_company.id_pharmaceutical_company = dealer_company.id_pharmaceutical_company
WHERE pharmaceutical_company.name = 'Аргус' AND drug.name = 'Кордерон';

-- 3)
-- Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 1.05.12.
SELECT
  drug.name,
  MIN(ordering.date_order)
FROM ordering
  LEFT JOIN production_drug
    ON production_drug.id_production_drug = ordering.id_production_drug
  LEFT JOIN pharmaceutical_company
    ON pharmaceutical_company.id_pharmaceutical_company = production_drug.id_pharmaceutical_company
  LEFT JOIN drug
    ON drug.id_drug = production_drug.id_drug
WHERE pharmaceutical_company.name = 'Фарма'
GROUP BY drug.name
HAVING MIN(ordering.date_order) > '12-05-01';

-- 4)
-- Дать минимальный и максимальный баллы лекарств каждой фирмы,
-- которая производит не менее 100 препаратов, с указанием названий фирмы.
SELECT
  pharmaceutical_company.name as name,
  MIN(production_drug.quality_assessment),
  MAX(production_drug.quality_assessment)
FROM `ordering`
  LEFT JOIN production_drug
    ON production_drug.id_production_drug = ordering.id_production_drug
  LEFT JOIN pharmaceutical_company
    ON pharmaceutical_company.id_pharmaceutical_company = production_drug.id_pharmaceutical_company
  LEFT JOIN drug
    ON drug.id_drug = production_drug.id_drug
GROUP BY name
HAVING nmb_drug > 100;

-- 5)
-- Дать списки сделавших заказы аптек по всем дилерам компании “Гедеон Рихтер”.
-- Если у дилера нет заказов, в названии аптеки проставить NULL.
-- ! дилер + название аптеки
-- где null?
SELECT
  dealer_company.id_dealer_company,
  dealer_company.family_dialer,
  pharmacy.name
FROM `ordering`
  LEFT JOIN pharmacy  ON ordering.id_pharmacy = pharmacy.id_pharmacy
  LEFT JOIN dealer_company  ON dealer_company.id_dealer_company = ordering.id_dialer_company
  LEFT JOIN pharmaceutical_company
    ON pharmaceutical_company.id_pharmaceutical_company = dealer_company.id_pharmaceutical_company
WHERE pharmaceutical_company.name = 'Гедеон Рихтер';

-- 6)
-- Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней.
UPDATE production_drug
  LEFT JOIN drug
    ON drug.id_drug = production_drug.id_drug
SET production_drug.price_per_unit_production = production_drug.price_per_unit_production * 0.8
WHERE production_drug.price_per_unit_production > 3000 AND drug.duration_standard_treatment <= 7