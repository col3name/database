SELECT * FROM `product` ORDER BY calorific ASC;
SELECT * FROM `product` ORDER BY calorific DESC;
SELECT * FROM `product` ORDER BY name, calorific ASC;
SELECT name, calorific FROM `product` ORDER BY name ASC;

SELECT MIN(calorific) FROM product;
SELECT MAX(calorific) FROM product;
SELECT AVG(calorific) FROM product;
SELECT SUM(calorific) FROM product;

/* получить количесто каждого типа блюд*/
SELECT COUNT(id_dish), id_type_dish
FROM dish
GROUP BY id_type_dish;

/*
получить типы блюда, количество блюд которого больше 2
*/
SELECT COUNT(id_dish), id_type_dish
FROM dish
GROUP BY id_type_dish
HAVING COUNT(id_dish) > 2;

