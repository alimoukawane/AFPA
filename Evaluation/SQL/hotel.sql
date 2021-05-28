-- - Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville
SELECT	hot_nom,hot_ville FROM	hotel.hotel

-- 2 - Afficher la ville de résidence de Mr White Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client
SELECT cli_nom,cli_prenom,cli_adresse,cli_ville FROM hotel.client
WHERE	cli_nom="white"





-- 3 - Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l'altitude
SELECT sta_nom,sta_altitude FROM	hotel.station
where sta_altitude<1000



-- 4 - Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité
SELECT	sta_nom,cha_numero,cha_capacite FROM hotel.chambre,hotel.station
WHERE cha_capacite>1


-- 5 - Afficher les clients n’habitant pas à Londre Le résultat doit faire apparaître le nom du client et la ville
SELECT cli_nom,cli_prenom,cli_ville FROM hotel.client
WHERE cli_ville<>"londre"



-- 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie
select hot_nom,hot_ville,hot_categorie from hotel.hotel
where hot_categorie>3 AND hot_ville="Bretou"

-- 7 - Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel,*
 la catégorie, la ville

select sta_nom,hot_nom,hot_categorie,hot_ville from hotel.hotel
INNER JOIN hotel.station
ON hot_id=sta_id


-- 8 - Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel,
--  la catégorie, la ville, le numéro de la chambre
SELECT hot_nom,hot_categorie,hot_ville,cha_numero FROM hotel.hotel

INNER JOIN	hotel.chambre
ON hot_id=cha_id



-- 9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou
--  Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité
select hot_nom,hot_categorie,hot_ville,cha_numero,cha_capacite from hotel.hotel
INNER JOIN hotel.chambre

WHERE	cha_capacite>1 AND	hot_ville="bretou"







-- 10 - Afficher la liste des réservations avec le nom des clients Le résultat doit faire apparaître le nom du client,
--  le nom de l’hôtel, la date de réservation
SELECT cli_nom,hot_nom, res_date
FROM hotel.hotel

INNER	JOIN  hotel.client
ON	hot_id=cli_id


INNER	JOIN hotel.reservation
ON cli_id=res_id





-- 11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station Le résultat doit faire apparaître
--  le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité

SELECT	 hot_nom, sta_nom, cha_numero, cha_capacite FROM	hotel.chambre
JOIN	hotel.hotel
ON cha_hot_id  = hot_id
JOIN hotel.station
ON sta_id=hot_sta_id





-- 12 - Afficher les réservations avec le nom du client et le nom de l’hôtel AVEC datediff Le résultat doit faire
--  apparaître le nom du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour

SELECT	cli_nom,hot_nom,res_date_debut, DATEDIFF	(res_date_fin,res_date_debut) FROM	hotel.hotel

INNER JOIN	hotel.client
ON	cli_id=hot_id


INNER	JOIN	hotel.reservation
ON	res_id=	cli_id;



-- Lot 3
-- 13 - Compter le nombre d’hôtel par station
SELECT station.sta_nom, count(hotel.hot_id)
FROM station
INNER JOIN hotel
	ON station.sta_id=hotel.hot_sta_id
GROUP BY station.sta_nom;




-- 14 - Compter le nombre de chambre par station
SELECT station.sta_nom, COUNT(chambre.cha_id) AS Nbre_chambre_station
FROM station
INNER JOIN hotel
	ON station.sta_id=hotel.hot_sta_id
INNER JOIN chambre
	ON hotel.hot_id=chambre.cha_hot_id
GROUP BY(station.sta_nom);



-- 15 - Compter le nombre de chambre par station ayant une capacité > 1
SELECT station.sta_nom, COUNT(chambre.cha_id) AS Nbre_chambre_station
FROM station
INNER JOIN hotel
	ON station.sta_id=hotel.hot_sta_id
INNER JOIN chambre
	ON hotel.hot_id=chambre.cha_hot_id
WHERE chambre.cha_capacite >1
GROUP BY(station.sta_nom)
;




-- 16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation

SELECT hotel.hot_nom, client.cli_nom
FROM client
INNER JOIN reservation
	ON client.cli_id=reservation.res_cli_id
INNER JOIN chambre
	ON reservation.res_cha_id=chambre.cha_id
INNER JOIN hotel
	ON hotel.hot_id=chambre.cha_hot_id
WHERE client.cli_nom='Squire'
;


-- 17 - Afficher la durée moyenne des réservations par station


SSELECT station.sta_nom AS	Nom_de_Station, AVG(DATEDIFF(reservation.res_date_fin,reservation.res_date_debut)) AS Duree_moyenne
FROM reservation
INNER JOIN station
	ON  reservation.res_cha_id=station.sta_id

INNER JOIN hotel
	ON hot_id=sta_id
	
	INNER JOIN chambre
	ON hotel.hot_sta_id=chambre.cha_id

	GROUP BY(station.sta_nom)
;



