--1.
INSERT INTO type_dish VALUES (0, 'первые блюда');
INSERT INTO `type_dish`(`id_type_dish`, `name`) VALUES (2, 'вторые блюда');
INSERT INTO dish (id_type_dish) SELECT id_type_dish FROM type_dish;

--2.
DELETE FROM `type_dish`;
DELETE FROM `type_dish` WHERE id_type_dish > 0;
TRUNCATE TABLE `type_dish`;

--3.
UPDATE `product` SET `name`='Рис',`calorific`=130;
UPDATE `product` SET `calorific`=132 WHERE id_product = 1;
UPDATE `product` SET `name`='Морковь',`calorific`=50 WHERE id_product = 3;

--4.
SELECT name, calorific FROM `product`; 
SELECT * FROM `product`;
SELECT * FROM `product` WHERE name = 'Рис';