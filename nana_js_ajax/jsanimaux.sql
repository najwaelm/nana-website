-- Création de la table Animaux
CREATE TABLE `Animaux` (
  `id_animal` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `date_de_naissance` DATE,
  `date_d_adoption` DATE,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Images
CREATE TABLE `Images` (
  `id_image` INT NOT NULL AUTO_INCREMENT,
  `chemin` VARCHAR(255) NOT NULL,
  `id_animal` INT NOT NULL,
  PRIMARY KEY (`id_image`),
  CONSTRAINT `fk_images_animaux` FOREIGN KEY (`id_animal`) REFERENCES `Animaux` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Caracteres
CREATE TABLE `Caracteres` (
  `id_caractere` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id_caractere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Statut qui relie Animaux et Caracteres
CREATE TABLE `Statut` (
  `id_animal` INT NOT NULL,
  `id_caractere` INT NOT NULL,
  PRIMARY KEY (`id_animal`, `id_caractere`),
  CONSTRAINT `fk_statut_animaux` FOREIGN KEY (`id_animal`) REFERENCES `Animaux` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_statut_caracteres` FOREIGN KEY (`id_caractere`) REFERENCES `Caracteres` (`id_caractere`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-------------------INSERTION DE DONNEEE------------------------

INSERT INTO Animaux (nom, date_de_naissance, date_d_adoption) VALUES
('Framboise','2017-05-02','2023-03-20'),
('Odin','2011-05-05','2022-03-20'),
('Samdie','2017-08-10','2023-03-01');


-- Insérer les informations des chats dans la table `Animaux`
USE `jsanimaux2` ;
INSERT INTO Caracteres (description) VALUES
('doux'),
('calme'),
('agité'),
('turbulant');


-- Insérer les chemins des images dans la table `Images`
-- Note: Les ID des animaux doivent correspondre à ceux créés dans la table `Animaux`.
INSERT INTO Images (chemin, id_animal) VALUES
('images/Animaux/Chats/Framboise/Framboise.jpg', (SELECT id_animal FROM Animaux WHERE nom = 'Framboise')),
('images/Animaux/Chats/Odin/Odin.jpg', (SELECT id_animal FROM Animaux WHERE nom = 'Odin')),
('images/Animaux/Chats/Samdie/Samdie.jpg', (SELECT id_animal FROM Animaux WHERE nom = 'Samdie'));


-- Associer les caractères aux chats dans la table `Etat`
INSERT INTO Etat (id_animal, id_caractere) VALUES
((SELECT id_animal FROM Animaux WHERE nom = 'Framboise'), (SELECT id_caractere FROM Caracteres WHERE description = 'doux')),
((SELECT id_animal FROM Animaux WHERE nom = 'Framboise'), (SELECT id_caractere FROM Caracteres WHERE description = 'calme')),
((SELECT id_animal FROM Animaux WHERE nom = 'Odin'), (SELECT id_caractere FROM Caracteres WHERE description = 'agité')),
((SELECT id_animal FROM Animaux WHERE nom = 'Odin'), (SELECT id_caractere FROM Caracteres WHERE description = 'turbulant')),
((SELECT id_animal FROM Animaux WHERE nom = 'Samdie'), (SELECT id_caractere FROM Caracteres WHERE description = 'doux')),
((SELECT id_animal FROM Animaux WHERE nom = 'Samdie'), (SELECT id_caractere FROM Caracteres WHERE description = 'calme'));