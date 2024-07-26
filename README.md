# Campusbike

![modeloERD](https://raw.githubusercontent.com/DannaG18/CampusBikes/main/modeloERD.png)

## Casos de Uso para la Base de Datos

**Caso de Uso 1: Gestión de Inventario de Bicicletas** 

**Descripción:** Este caso de uso describe cómo el sistema gestiona el inventario de bicicletas, permitiendo agregar nuevas bicicletas, actualizar la información existente y eliminar bicicletas que ya no están disponibles. 

**Actores:** 

Administrador de Inventario 

**Flujo Principal:** 

1. El administrador de inventario ingresa al sistema. 
2. El administrador selecciona la opción para agregar una nueva bicicleta.
3. El administrador ingresa los detalles de la bicicleta (modelo, marca, precio, stock). 4. El sistema valida y guarda la información de la nueva bicicleta. 
4. El administrador selecciona una bicicleta existente para actualizar. 
5. El administrador actualiza la información (precio, stock). 
6. El sistema valida y guarda los cambios. 
7. El administrador selecciona una bicicleta para eliminar. 
8. El sistema elimina la bicicleta seleccionada del inventario. 

```sql
-- USE CASE 1
--Add new bikes
INSERT INTO bike (id_bike, model_id, brand_id, price, stock) VALUES
('B001', 'M001', 'B001', 500.00, 10),
('B002', 'M002', 'B002', 750.00, 5);

--Update info bike
UPDATE bike
SET price = 600.00, stock = 8
WHERE id_bike = 'B001';

--Delete info bike
DELETE FROM bike
WHERE id_bike = 'B001';
```

**Caso de Uso 2: Registro de Ventas** 

**Descripción:** Este caso de uso describe el proceso de registro de una venta de bicicletas, incluyendo la creación de una nueva venta, la selección de las bicicletas vendidas y el cálculo del total de la venta. 

**Actores:** 

Vendedor 

**Flujo Principal:** 

1. El vendedor ingresa al sistema. 
2. El vendedor selecciona la opción para registrar una nueva venta. 
3. El vendedor selecciona el cliente que realiza la compra. 
4. El vendedor selecciona las bicicletas que el cliente desea comprar y especifica la cantidad. 5. El sistema calcula el total de la venta. 
5. El vendedor confirma la venta. 
6. El sistema guarda la venta y actualiza el inventario de bicicletas. 

```sql
--USE CASE 2
--Add new purchase
INSERT INTO purchase (date_purchase, supplier_id, total_amount) VALUES
('2024-07-22', 'S001', 5000.00),
('2024-07-23', 'S002', 7500.00);

--Select purchases bike
SELECT id_purchase, date_purchase, supplier_id, total_amount
FROM purchase;

--Total purchases
SELECT SUM(total_amount) AS total_sales
FROM purchases;
```

**Caso de Uso 3: Gestión de Proveedores y Repuestos** 

**Descripción:** Este caso de uso describe cómo el sistema gestiona la información de proveedores y repuestos, permitiendo agregar nuevos proveedores y repuestos, actualizar la información existente y eliminar proveedores y repuestos que ya no están activos. 

**Actores:** 

Administrador de Proveedores 

**Flujo Principal:** 

1. El administrador de proveedores ingresa al sistema. 
2. El administrador selecciona la opción para agregar un nuevo proveedor. 
3. El administrador ingresa los detalles del proveedor (nombre, contacto, teléfono, correo electrónico, ciudad). 
4. El sistema valida y guarda la información del nuevo proveedor. 
5. El administrador selecciona la opción para agregar un nuevo repuesto. 
6. El administrador ingresa los detalles del repuesto (nombre, descripción, precio, stock, proveedor). 
7. El sistema valida y guarda la información del nuevo repuesto.
8. El administrador selecciona un proveedor existente para actualizar. 
9. El administrador actualiza la información del proveedor. 
10. El sistema valida y guarda los cambios. 
11. El administrador selecciona un repuesto existente para actualizar. 
12. El administrador actualiza la información del repuesto. 
13. El sistema valida y guarda los cambios. 
14. El administrador selecciona un proveedor para eliminar. 
15. El sistema elimina el proveedor seleccionado. 
16. El administrador selecciona un repuesto para eliminar. 
17. El sistema elimina el repuesto seleccionado. 

```sql
--USE CASE 3
--Add suppliers and replacements
INSERT INTO supplier (id_supplier, document_type, name_supplier, contact_id, phone_id, email, city_id) VALUES
('S001', 1, 'Supplier 1', 1, 1, 'supplier1@example.com', 'NYC'),
('S002', 2, 'Supplier 2', 2, 2, 'supplier2@example.com', 'TOR');
INSERT INTO replacement (id_replacement, name_replacement, description, price, stock, supplier_id) VALUES
('R001', 'Replacement 1', 'Description 1', 50.00, 100, 'S001'),
('R002', 'Replacement 2', 'Description 2', 75.00, 200, 'S002');

--Update information 
UPDATE supplier
SET document_type = 2, name_supplier = 'Supplier 1.1'
WHERE id_supplier = 'S001';

UPDATE replacement 
SET name_replacement = 'Replacement 1.1', 'Description 1.1'
WHERE id_replacement = 'R001.1';

--Delete information
DELETE FROM supplier
WHERE id_supplier = 'S001';
DELETE FROM replacement
WHERE id_replacement = 'Replacement 1';
```

**Caso de Uso 4: Consulta de Historial de Ventas por Cliente** 

**Descripción:** Este caso de uso describe cómo el sistema permite a un usuario consultar el historial de ventas de un cliente específico, mostrando todas las compras realizadas por el cliente y los detalles de cada venta. 

**Actores:** 

Vendedor 

Administrador 

**Flujo Principal:** 

1. El usuario ingresa al sistema. 
2. El usuario selecciona la opción para consultar el historial de ventas. 
3. El usuario selecciona el cliente del cual desea ver el historial. 
4. El sistema muestra todas las ventas realizadas por el cliente seleccionado. 5. El usuario selecciona una venta específica para ver los detalles. 
5. El sistema muestra los detalles de la venta seleccionada (bicicletas compradas, cantidad, precio). 

```sql
--USE CASE 4
--Show purchases of a specific client
SELECT sd.id_sale_detail, sd.sale_id, sd.bike_id, sd.bikes_number, sd.unit_price, s.date_sale, s.client_id, s.total_amount
FROM sale_detail AS sd
INNER JOIN sale AS s ON s.id_sale = sd.sale_id
INNER JOIN client AS c ON c.id_client = s.client_id
WHERE id_client = 'C001';
```

**Caso de Uso 5: Gestión de Compras de Repuestos** 

**Descripción:** Este caso de uso describe cómo el sistema gestiona las compras de repuestos a proveedores, permitiendo registrar una nueva compra, especificar los repuestos comprados y actualizar el stock de repuestos. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para registrar una nueva compra. 3. El administrador selecciona el proveedor al que se realizó la compra. 
3. El administrador ingresa los detalles de la compra (fecha, total). 
4. El sistema guarda la compra y genera un identificador único.
5. El administrador selecciona los repuestos comprados y especifica la cantidad y el precio unitario. 
6. El sistema guarda los detalles de la compra y actualiza el stock de los repuestos comprados. **Casos de Uso con Subconsultas**

```sql
--USE CASE 5
--Purchase register
INSERT INTO purchase (date_purchase, supplier_id, total_amount) VALUES
('2024-07-22', 'S001', 5000.00),
('2024-07-23', 'S002', 7500.00);

--Replacement especifications
SELECT pd.id_purchase_detail, pd.purchase_id, p.supplier_id, su.name_supplier, pd.replacement_id, r.name_replacement, pd.purchase_number, pd.unit_price
FROM purchase_detail AS pd
INNER JOIN purchase AS p ON p.id_purchase = pd.purchase_id
INNER JOIN replacement AS r ON r.id_replacement = pd.replacement_id
INNER JOIN supplier AS su ON su.id_supplier = p.supplier_id;

--Update replacement stock
UPDATE replacement
SET stock = 20
WHERE id_replacement = 'R001';
```

 

**Caso de Uso 6: Consulta de Bicicletas Más Vendidas por Marca** 

**Descripción:** Este caso de uso describe cómo el sistema permite a un usuario consultar las bicicletas más vendidas por cada marca. 

**Actores:** 

Vendedor 

Administrador 

**Flujo Principal:** 

1. El usuario ingresa al sistema. 
2. El usuario selecciona la opción para consultar las bicicletas más vendidas por marca. 
3. El sistema muestra una lista de marcas y el modelo de bicicleta más vendido para cada marca. 

```SQL
--USE CASE 6
--Show 
SELECT sales_by_model.brand AS brand, sales_by_model.model AS model, sales_by_model.id_brand, sales_by_model.id_model
FROM (
    SELECT br.name_brand AS brand, m.name_model AS model, SUM(sd.bikes_number) AS sale_total, m.id_model, br.id_brand
    FROM brand br
    JOIN bike b ON b.brand_id = br.id_brand
    JOIN model m ON b.model_id = m.id_model
    JOIN sale_detail sd ON sd.bike_id = b.id_bike
    GROUP BY br.name_brand, m.name_model, m.id_model, br.id_brand
) AS sales_by_model
WHERE sale_total = (
    SELECT MAX(sale_total)
    FROM(
        SELECT br1.name_brand AS brand, m1.name_model AS model, SUM(sd1.bikes_number) AS total_purchases, m1.id_model, br1.id_brand
        FROM brand br1
        JOIN bike b1 ON b1.brand_id = br1.id_brand
        JOIN model m1 ON b1.model_id = m1.id_model
        JOIN sale_detail sd1 ON sd1.bike_id = b1.id_bike
        GROUP BY br1.name_brand, m1.name_model, m1.id_model, br1.id_brand
    ) AS sum
    WHERE sum.brand = sales_by_model.brand
);

+---------+---------+----------+----------+
| brand   | model   | id_brand | id_model |
+---------+---------+----------+----------+
| Brand 1 | Model 1 | B001     | M001     |
| Brand 2 | Model 2 | B002     | M002     |
+---------+---------+----------+----------+
```

**Caso de Uso 7: Clientes con Mayor Gasto en un Año Específico** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar los clientes que han gastado más en un año específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para consultar los clientes con mayor gasto en un año específico. 
3. El administrador ingresa el año deseado. 
4. El sistema muestra una lista de los clientes que han gastado más en ese año, ordenados por total gastado. 

```SQL
--USE CASE 7
--Shows the customers who have spent the most in a specific year
SELECT id_client, name_client, sale_spend
FROM (
    SELECT cli.id_client AS id_client, CONCAT(cli.first_name,' ', cli.last_name) AS name_client, (
        SELECT SUM(total_amount)
        FROM sale s
        WHERE s.client_id = cli.id_client
        AND YEAR(s.date_sale) = 2024) AS sale_spend
        FROM client cli
    ) AS sub
WHERE sale_spend IS NOT NULL
ORDER BY sale_spend  DESC;

+-----------+---------------+------------+
| id_client | name_client   | sale_spend |
+-----------+---------------+------------+
| C001      | Alice Johnson |    1250.00 |
| C002      | Bob Williams  |     750.00 |
+-----------+---------------+------------+
```

**Caso de Uso 8: Proveedores con Más Compras en el Último Mes** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar los proveedores que han recibido más compras en el último mes. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para consultar los proveedores con más compras en el último mes.
3. El sistema muestra una lista de proveedores ordenados por el número de compras recibidas en el último mes. 

```SQL
--USE CASE 8
--Shows the suppliers who have received the most purchases in the last month
SELECT id_supplier, name_supplier, total_purchase
FROM (
    SELECT sp.id_supplier AS id_supplier, sp.name_supplier AS name_supplier, COUNT(p.id_purchase) AS total_purchase
    FROM supplier sp
    JOIN purchase p ON sp.id_supplier = p.supplier_id 
    WHERE p.date_purchase >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    GROUP BY id_supplier, name_supplier
) AS sub
ORDER BY total_purchase DESC;

+-------------+---------------+----------------+
| id_supplier | name_supplier | total_purchase |
+-------------+---------------+----------------+
| S001        | Supplier 1    |              2 |
| S002        | Supplier 2    |              1 |
+-------------+---------------+----------------+
```

**Caso de Uso 9: Repuestos con Menor Rotación en el Inventario** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar los repuestos que han tenido menor rotación en el inventario, es decir, los menos vendidos. 

**Actores:** 

Administrador de Inventario 

**Flujo Principal:** 

1. El administrador de inventario ingresa al sistema. 
2. El administrador selecciona la opción para consultar los repuestos con menor rotación. 
3. El sistema muestra una lista de repuestos ordenados por la cantidad vendida, de menor a mayor. 

```SQL
SELECT r.id_replacement, less_purchased  
FROM (
    SELECT replacement_id, SUM(purchase_number) AS less_purchased
    FROM purchase_detail
    GROUP BY replacement_id
) AS sales_summary 
RIGHT JOIN replacement AS r ON r.id_replacement = sales_summary.replacement_id
ORDER BY less_purchased ASC; 

+----------------+----------------+
| id_replacement | less_purchased |
+----------------+----------------+
| R001           |             50 |
| R002           |             75 |
+----------------+----------------+
```

**Caso de Uso 10: Ciudades con Más Ventas Realizadas** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar las ciudades donde se han realizado más ventas de bicicletas. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para consultar las ciudades con más ventas realizadas. 3. El sistema muestra una lista de ciudades ordenadas por la cantidad de ventas realizadas. 

```SQL
SELECT city, top_sales
FROM (
    SELECT id_city, name_city AS city,
        (SELECT COUNT(s.id_sale)
        FROM sale AS s
        JOIN client AS cl ON cl.id_client = s.client_id
        WHERE cl.city_id = c.id_city) AS top_sales
    FROM city AS c
) AS city_sales
ORDER BY top_sales DESC
LIMIT 2;

+----------+-----------+
| city     | top_sales |
+----------+-----------+
| New York |         1 |
| Toronto  |         1 |
+----------+-----------+
```

**Casos de Uso con Joins** 

**Caso de Uso 11: Consulta de Ventas por Ciudad** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar el total de ventas realizadas en cada ciudad. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para consultar las ventas por ciudad. 3. El sistema muestra una lista de ciudades con el total de ventas realizadas en cada una. **Caso de Uso 12: Consulta de Proveedores por País** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar los proveedores agrupados por país. 

**Actores:**

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para consultar los proveedores por país. 3. El sistema muestra una lista de países con los proveedores en cada país. 

**Caso de Uso 13: Compras de Repuestos por Proveedor** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar el total de repuestos comprados a cada proveedor. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para consultar las compras de repuestos por proveedor. 
3. El sistema muestra una lista de proveedores con el total de repuestos comprados a cada uno. 

**Caso de Uso 14: Clientes con Ventas en un Rango de Fechas** 

**Descripción:** Este caso de uso describe cómo el sistema permite consultar los clientes que han realizado compras dentro de un rango de fechas específico. 

**Actores:** 

Vendedor 

Administrador 

**Flujo Principal:** 

1. El usuario ingresa al sistema. 
2. El usuario selecciona la opción para consultar los clientes con ventas en un rango de fechas. 3. El usuario ingresa las fechas de inicio y fin del rango. 
3. El sistema muestra una lista de clientes que han realizado compras dentro del rango de fechas especificado. 

**Casos de Uso para Implementar Procedimientos Almacenados** 

**Caso de Uso 1: Actualización de Inventario de Bicicletas** 

**Descripción:** Este caso de uso describe cómo el sistema actualiza el inventario de bicicletas cuando se realiza una venta. 

**Actores:** 

Vendedor 

**Flujo Principal:**

1. El vendedor ingresa al sistema. 
2. El vendedor registra una venta de bicicletas. 
3. El sistema llama a un procedimiento almacenado para actualizar el inventario de las bicicletas vendidas. 
4. El procedimiento almacenado actualiza el stock de cada bicicleta. 

**Caso de Uso 2: Registro de Nueva Venta** 

**Descripción:** Este caso de uso describe cómo el sistema registra una nueva venta, incluyendo la creación de la venta y la inserción de los detalles de la venta. 

**Actores:** 

Vendedor 

**Flujo Principal:** 

1. El vendedor ingresa al sistema. 
2. El vendedor registra una nueva venta. 
3. El sistema llama a un procedimiento almacenado para registrar la venta y sus detalles. 4. El procedimiento almacenado inserta la venta y sus detalles en las tablas correspondientes. **Caso de Uso 3: Generación de Reporte de Ventas por Cliente** 

**Descripción:** Este caso de uso describe cómo el sistema genera un reporte de ventas para un cliente específico, mostrando todas las ventas realizadas por el cliente y los detalles de cada venta. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona un cliente para generar un reporte de ventas. 3. El sistema llama a un procedimiento almacenado para generar el reporte. 
3. El procedimiento almacenado obtiene las ventas y los detalles de las ventas realizadas por el cliente. 

**Caso de Uso 4: Registro de Compra de Repuestos** 

**Descripción:** Este caso de uso describe cómo el sistema registra una nueva compra de repuestos a un proveedor. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador registra una nueva compra. 
3. El sistema llama a un procedimiento almacenado para registrar la compra y sus detalles.
4. El procedimiento almacenado inserta la compra y sus detalles en las tablas correspondientes y actualiza el stock de repuestos. 

**Caso de Uso 5: Generación de Reporte de Inventario** 

**Descripción:** Este caso de uso describe cómo el sistema genera un reporte de inventario de bicicletas y repuestos. 

**Actores:** 

Administrador de Inventario 

**Flujo Principal:** 

1. El administrador de inventario ingresa al sistema. 
2. El administrador solicita un reporte de inventario. 
3. El sistema llama a un procedimiento almacenado para generar el reporte. 4. El procedimiento almacenado obtiene la información del inventario de bicicletas y repuestos. 

**Caso de Uso 6: Actualización Masiva de Precios** 

**Descripción:** Este caso de uso describe cómo el sistema permite actualizar masivamente los precios de todas las bicicletas de una marca específica. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para actualizar los precios de una marca específica. 3. El administrador ingresa la marca y el porcentaje de incremento. 
3. El sistema llama a un procedimiento almacenado para actualizar los precios. 
4. El procedimiento almacenado actualiza los precios de todas las bicicletas de la marca especificada. 

**Caso de Uso 7: Generación de Reporte de Clientes por Ciudad** 

**Descripción:** Este caso de uso describe cómo el sistema genera un reporte de clientes agrupados por ciudad. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para generar un reporte de clientes por ciudad. 3. El sistema llama a un procedimiento almacenado para generar el reporte. 4. El procedimiento almacenado obtiene la información de los clientes agrupados por ciudad.

**Caso de Uso 8: Verificación de Stock antes de Venta** 

**Descripción:** Este caso de uso describe cómo el sistema verifica el stock de una bicicleta antes de permitir la venta. 

**Actores:** 

Vendedor 

**Flujo Principal:** 

1. El vendedor ingresa al sistema. 
2. El vendedor selecciona una bicicleta para vender. 
3. El sistema llama a un procedimiento almacenado para verificar el stock. 
4. El procedimiento almacenado devuelve un mensaje indicando si hay suficiente stock para realizar la venta. 

**Caso de Uso 9: Registro de Devoluciones** 

**Descripción:** Este caso de uso describe cómo el sistema registra la devolución de una bicicleta por un cliente. 

**Actores:** 

Vendedor 

**Flujo Principal:** 

1. El vendedor ingresa al sistema. 
2. El vendedor registra una devolución de bicicleta. 
3. El sistema llama a un procedimiento almacenado para registrar la devolución. 4. El procedimiento almacenado inserta la devolución y actualiza el stock de la bicicleta. 

**Caso de Uso 10: Generación de Reporte de Compras por Proveedor** 

**Descripción:** Este caso de uso describe cómo el sistema genera un reporte de compras realizadas a un proveedor específico, mostrando todos los detalles de las compras. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona un proveedor para generar un reporte de compras. 3. El sistema llama a un procedimiento almacenado para generar el reporte. 
3. El procedimiento almacenado obtiene las compras y los detalles de las compras realizadas al proveedor.

**Caso de Uso 11: Calculadora de Descuentos en Ventas** 

**Descripción:** Este caso de uso describe cómo el sistema aplica un descuento a una venta antes de registrar los detalles de la venta. 

**Actores:** 

Vendedor 

**Flujo Principal:** 

1. El vendedor ingresa al sistema. 
2. El vendedor aplica un descuento a una venta. 
3. El sistema llama a un procedimiento almacenado para calcular el total con descuento. 4. El procedimiento almacenado calcula el total con el descuento aplicado y registra la venta. 

**Casos de Uso para Funciones de Resumen** 

**Caso de Uso 1: Calcular el Total de Ventas Mensuales** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de ventas realizadas en un mes específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ventas mensuales. 3. El administrador ingresa el mes y el año. 
3. El sistema llama a un procedimiento almacenado para calcular el total de ventas. 5. El procedimiento almacenado devuelve el total de ventas del mes especificado. 

**Caso de Uso 2: Calcular el Promedio de Ventas por Cliente** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el promedio de ventas realizadas por un cliente específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el promedio de ventas por cliente. 3. El administrador ingresa el ID del cliente. 
3. El sistema llama a un procedimiento almacenado para calcular el promedio de ventas. 5. El procedimiento almacenado devuelve el promedio de ventas del cliente especificado.

**Caso de Uso 3: Contar el Número de Ventas Realizadas en un Rango de Fechas** 

**Descripción:** Este caso de uso describe cómo el sistema cuenta el número de ventas realizadas dentro de un rango de fechas específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para contar el número de ventas en un rango de fechas. 
3. El administrador ingresa las fechas de inicio y fin. 
4. El sistema llama a un procedimiento almacenado para contar las ventas. 
5. El procedimiento almacenado devuelve el número de ventas en el rango de fechas especificado. 

**Caso de Uso 4: Calcular el Total de Repuestos Comprados por Proveedor** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de repuestos comprados a un proveedor específico. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de repuestos comprados por proveedor. 
3. El administrador ingresa el ID del proveedor. 
4. El sistema llama a un procedimiento almacenado para calcular el total de repuestos. 
5. El procedimiento almacenado devuelve el total de repuestos comprados al proveedor especificado. 

**Caso de Uso 5: Calcular el Ingreso Total por Año** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el ingreso total generado en un año específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el ingreso total por año. 3. El administrador ingresa el año. 
3. El sistema llama a un procedimiento almacenado para calcular el ingreso total.
4. El procedimiento almacenado devuelve el ingreso total del año especificado. **Caso de Uso 6: Calcular el Número de Clientes Activos en un Mes** 

**Descripción:** Este caso de uso describe cómo el sistema cuenta el número de clientes que han realizado al menos una compra en un mes específico. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para contar el número de clientes activos en un mes. 3. El administrador ingresa el mes y el año. 
3. El sistema llama a un procedimiento almacenado para contar los clientes activos. 
4. El procedimiento almacenado devuelve el número de clientes que han realizado compras en el mes especificado. 

**Caso de Uso 7: Calcular el Promedio de Compras por Proveedor** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el promedio de compras realizadas a un proveedor específico. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para calcular el promedio de compras por proveedor. 3. El administrador ingresa el ID del proveedor. 
3. El sistema llama a un procedimiento almacenado para calcular el promedio de compras. 5. El procedimiento almacenado devuelve el promedio de compras del proveedor especificado. 

**Caso de Uso 8: Calcular el Total de Ventas por Marca** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de ventas agrupadas por la marca de las bicicletas vendidas. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ventas por marca. 3. El sistema llama a un procedimiento almacenado para calcular el total de ventas por marca. 4. El procedimiento almacenado devuelve el total de ventas agrupadas por marca.

**Caso de Uso 9: Calcular el Promedio de Precios de Bicicletas por Marca** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el promedio de precios de las bicicletas agrupadas por marca. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el promedio de precios por marca. 3. El sistema llama a un procedimiento almacenado para calcular el promedio de precios. 4. El procedimiento almacenado devuelve el promedio de precios agrupadas por marca. 

**Caso de Uso 10: Contar el Número de Repuestos por Proveedor** 

**Descripción:** Este caso de uso describe cómo el sistema cuenta el número de repuestos suministrados por cada proveedor. 

**Actores:** 

Administrador de Compras 

**Flujo Principal:** 

1. El administrador de compras ingresa al sistema. 
2. El administrador selecciona la opción para contar el número de repuestos por proveedor. 3. El sistema llama a un procedimiento almacenado para contar los repuestos. 
3. El procedimiento almacenado devuelve el número de repuestos suministrados por cada proveedor. 

**Caso de Uso 11: Calcular el Total de Ingresos por Cliente** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de ingresos generados por cada cliente. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ingresos por cliente. 3. El sistema llama a un procedimiento almacenado para calcular el total de ingresos. 4. El procedimiento almacenado devuelve el total de ingresos generados por cada cliente. 

**Caso de Uso 12: Calcular el Promedio de Compras Mensuales** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el promedio de compras realizadas mensualmente por todos los clientes. 

**Actores:**

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el promedio de compras mensuales. 
3. El sistema llama a un procedimiento almacenado para calcular el promedio de compras mensuales. 
4. El procedimiento almacenado devuelve el promedio de compras realizadas mensualmente. **Caso de Uso 13: Calcular el Total de Ventas por Día de la Semana** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de ventas realizadas en cada día de la semana. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ventas por día de la semana. 3. El sistema llama a un procedimiento almacenado para calcular el total de ventas. 4. El procedimiento almacenado devuelve el total de ventas agrupadas por día de la semana. 

**Caso de Uso 14: Contar el Número de Ventas por Categoría de Bicicleta** 

**Descripción:** Este caso de uso describe cómo el sistema cuenta el número de ventas realizadas para cada categoría de bicicleta (por ejemplo, montaña, carretera, híbrida). 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para contar el número de ventas por categoría de bicicleta. 
3. El sistema llama a un procedimiento almacenado para contar las ventas. 4. El procedimiento almacenado devuelve el número de ventas por categoría de bicicleta. 

**Caso de Uso 15: Calcular el Total de Ventas por Año y Mes** 

**Descripción:** Este caso de uso describe cómo el sistema calcula el total de ventas realizadas cada mes, agrupadas por año. 

**Actores:** 

Administrador 

**Flujo Principal:** 

1. El administrador ingresa al sistema. 
2. El administrador selecciona la opción para calcular el total de ventas por año y mes.
3. El sistema llama a un procedimiento almacenado para calcular el total de ventas. 4. El procedimiento almacenado devuelve el total de ventas agrupadas por año y mes. **Requerimientos de entrega** 
4. Crear repositorio en GitHub 
5. Cargar en el repositorio el DER y el archivo con la definición de la estructura de la base de datos. 
6. Cargar en el repositorio los archivos donde se encuentren los comandos de inserción de los datos requeridos para cumplir con cada una de las consultas. 
7. Crear readme con cada descripción y Nro de caso de uso y su respectiva solución. **Parámetros de evaluación** 
8. El proyecto tendrá un peso del 60%. 
9. La entrega del proyecto tendrá un valor del 45% y la sustentación privada tendra un valor del 55%. La sustentacion tendra una duración de 10 minutos donde cada camper tendrá que resolver 5 consultas desarrolladas en cada caso de uso.