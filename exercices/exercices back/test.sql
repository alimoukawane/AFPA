-- -- DROP DATABASE IF EXISTS bddhotel, 

-- CREATE DATABASE bddhotel,  

-- USE bddhotel, 

-- CREATE TABLE    hotel ( 
--     num_hotel INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
--     capacite_hotel INT, 
--     categorie_hotel VARCHAR(10),
--     nom_hotel VARCHAR(50),
--     adresse_hotel   VARCHAR(255),
--     num_station  INT,
--         FOREIGN KEY (num_station) REFERENCES station(hotel) 

-- ), 
 

-- USE bddhotel, 

-- CREATE TABLE    station( 
--     num_station INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
--     nom_station VARCHAR(50)
    
         

-- ), 



CREATE TABLE    client ( 
        num_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        nom_client VARCHAR(50),
        prenom_client VARCHAR(50),
        adresse_client   VARCHAR(255) 
      

), 

CREATE TABLE    reservation ( 
    num_chambre INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    num_client  INT NOT NULL AUTO_INCREMENT SECONDARY KEY,
    date_debut  DATE,
    date_fin    DATE,
    date_reservation DATE,
    montant_arrhes FLOAT,
    prix_total FLOAT


),


    capacite_hotel INT, 
    categorie_hotel VARCHAR(10),
    nom_hotel VARCHAR(50),
    adresse_hotel   VARCHAR(255),
    num_station  INT,
    num_station INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nom_station VARCHAR(50)
      

), 

CREATE TABLE    chambre ( 
    num_chambre INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    capacite_chambre  INT ,
    degre_confort  INT,
    type_chambre VARCHAR(20),
    num_hotel INT
),