<?php
// Remplacez les valeurs ci-dessous par vos propres informations de connexion à la base de données
$host = "localhost";
$dbname = "jsanimaux";
$username = "root";
$password = "";

// Tentative de connexion à la base de données
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Définition du mode d'erreur PDO sur Exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Requête SQL pour récupérer les données
    $sql = "SELECT Animaux.id_animal, Animaux.nom, Animaux.date_de_naissance, Animaux.date_d_adoption, Images.chemin AS image 
            FROM Animaux 
            LEFT JOIN Images ON Animaux.id_animal = Images.id_animal";

    // Exécution de la requête
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    // Récupération des résultats
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Envoi des résultats au format JSON
    echo json_encode($result);
} catch(PDOException $e) {
    // Gestion des erreurs
    echo "Erreur de connexion : " . $e->getMessage();
}
?>