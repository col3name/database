SELECT * FROM `dish` 
LEFT JOIN type_dish ON dish.id_type_dish = type_dish.id_type_dish
WHERE dish.weight > 500;

SELECT * FROM `type_dish` 
RIGHT JOIN dish on dish.id_type_dish = type_dish.id_type_dish
WHERE dish.weight > 500;

SELECT * FROM `dish` 
LEFT JOIN type_dish ON dish.id_type_dish = type_dish.id_type_dish
WHERE dish.weight > 500 AND dish.id_type_dish > 2;

SELECT * FROM `dish` 
LEFT JOIN type_dish ON dish.id_type_dish = type_dish.id_type_dish
WHERE dish.weight > 500 AND type_dish.id_type_dish > 2;
 
SELECT * FROM product
LEFT JOIN product_in_recipe 
ON product_in_recipe.id_product = product.id_product
LEFT JOIN recipe 
ON product_in_recipe.id_recipe = recipe.id_recipe
WHERE product.calorific > 10 and recipe.id_dish = 10;