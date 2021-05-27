-- 1 Liste des contacts français

SELECT customers.CompanyName AS Société, customers.ContactName AS Contact, customers.ContactTitle AS Fonction, customers.Phone AS Téléphone
FROM customers
WHERE customers.Country LIKE '%France%'
;

-- 2 Produits vendus par le fournisseur "Exotic liquids"

SELECT products.ProductName AS Produit, products.UnitPrice AS Prix
FROM products
INNER JOIN suppliers
	ON products.SupplierID=suppliers.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
;

-- 3 Nombre de produits vendus par les fournisseurs Français dans l'ordre décroissant
SELECT suppliers.CompanyName AS Fournisseur, COUNT(products.ProductID) AS Nbre_Produit
FROM suppliers
INNER JOIN products
	ON suppliers.SupplierID=products.SupplierID
WHERE suppliers.Country LIKE '%France%'
GROUP BY(suppliers.CompanyName)
ORDER BY Nbre_Produit DESC 
;

-- 4 Liste des clients Français avec plus de 10 commandes

SELECT customers.CompanyName AS CLIENT, COUNT(orders.OrderID) AS Nbre_Commandes
FROM customers
INNER JOIN orders
	ON customers.CustomerID=orders.CustomerID
WHERE customers.Country LIKE '%France%'
GROUP BY(customers.CompanyName)
HAVING Nbre_Commandes >10
;

-- 5 Liste des clients ayant un chiffre d'affaires > 30 000


SELECT customers.CompanyName AS Clients, SUM(`order details`.UnitPrice * `order details`.Quantity) AS CA, customers.Country AS Pays
FROM customers
INNER JOIN orders
	ON customers.CustomerID=orders.CustomerID
INNER JOIN `order details`
	ON orders.OrderID=`order details`.OrderID
GROUP BY Clients, Pays
HAVING CA>30000
ORDER BY CA DESC
;


-- 6 Liste des pays dont les clients ont passé commande de produits fournis par "Exotic Liquids"

SELECT DISTINCT customers.Country AS Pays
FROM customers
INNER JOIN orders
	ON customers.CustomerID=orders.CustomerID
INNER JOIN `order details`
	ON orders.OrderID=`order details`.OrderID
INNER JOIN products
	ON `order details`.ProductID=products.ProductID
INNER JOIN suppliers
	ON products.SupplierID=suppliers.SupplierID
WHERE suppliers.CompanyName LIKE '%Exotic Liquids%'
ORDER BY Pays
;

-- 7 Montant des ventes de 1997

SELECT SUM(`order details`.UnitPrice * `order details`.Quantity) AS Montant_Ventes_97
	FROM orders
	INNER JOIN `order details`
		ON orders.OrderID=`order details`.OrderID
WHERE YEAR(orders.OrderDate)=1997
; 

-- Montant des ventes de 1997 mois par mois

SELECT MONTH(orders.OrderDate) AS Mois_97, SUM(`order details`.UnitPrice * `order details`.Quantity) AS Montant_Ventes_97
	FROM orders
	INNER JOIN `order details`
		ON orders.OrderID=`order details`.OrderID
WHERE YEAR(orders.OrderDate)=1997
GROUP BY MONTH(orders.OrderDate)
; 

-- 9 Depuis quelle date le client "Du monde entier" n'a plus commandé ?

SELECT MAX(date(orders.OrderDate)) AS 'Date de la dernière commande'
FROM orders
INNER JOIN customers
	ON orders.CustomerID=customers.CustomerID
WHERE customers.CompanyName LIKE '%Du monde entier%' 
;

-- 10 Quel est le délai moyen de livraison en jours ?


	SELECT ROUND ( AVG (DATEDIFF(orders.ShippedDate, orders.OrderDate ))) AS	'Durée moyenne de livraison' 
	FROM orders
 
;