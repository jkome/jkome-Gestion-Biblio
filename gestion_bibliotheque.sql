-- Création de tables
create database GESTION_BIBLIO;
use GESTION_BIBLIO;
CREATE TABLE Book (
    idBook INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Description TEXT,
    DatePublication DATE,
    NbrPage INT,
    Tail VARCHAR(10),
    URL_pdf VARCHAR(255),
    URL_cover_image VARCHAR(255),
    ValideParAdmin BOOLEAN
);

CREATE TABLE BookList (
    idList INT PRIMARY KEY AUTO_INCREMENT,
    listName VARCHAR(255),
    dateCreation DATE,
    listOrder INT
);

CREATE TABLE Category (
    idCategory INT PRIMARY KEY AUTO_INCREMENT,
    Libelle VARCHAR(255)
);

CREATE TABLE Comments (
    idComments INT PRIMARY KEY AUTO_INCREMENT,
    text TEXT
);

CREATE TABLE Compte (
    idCompte INT PRIMARY KEY AUTO_INCREMENT,
    CompleteName VARCHAR(255),
    dateCreation DATE,
    password VARCHAR(255),
    active BOOLEAN,
    URL_image VARCHAR(255)
);

CREATE TABLE Languages (
    idLanguage INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    iso_code VARCHAR(10)
);

CREATE TABLE User (
    idUser INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Tell VARCHAR(15),
    Ville VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Gestion_BookList (
    idCompte INT,
    idList INT,
    PRIMARY KEY (idCompte, idList),
    FOREIGN KEY (idCompte) REFERENCES Compte(idCompte),
    FOREIGN KEY (idList) REFERENCES BookList(idList)
);

CREATE TABLE Gestion_Book (
    idCompte INT,
    idBook INT,
    PRIMARY KEY (idCompte, idBook),
    FOREIGN KEY (idCompte) REFERENCES Compte(idCompte),
    FOREIGN KEY (idBook) REFERENCES Book(idBook)
);

CREATE TABLE Contain2_Book_BookList (
    idBook INT,
    idList INT,
    PRIMARY KEY (idBook, idList),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idList) REFERENCES BookList(idList)
);

CREATE TABLE Association_Book_Category (
    idBook INT,
    idCategory INT,
    PRIMARY KEY (idBook, idCategory),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

CREATE TABLE Contain_Book_Languages (
    idBook INT,
    idLanguage INT,
    PRIMARY KEY (idBook, idLanguage),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idLanguage) REFERENCES Languages(idLanguage)
);

CREATE TABLE Parent_Category_Category (
    idParentCategory INT,
    idCategory INT,
    PRIMARY KEY (idParentCategory, idCategory),
    FOREIGN KEY (idParentCategory) REFERENCES Category(idCategory),
    FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

CREATE TABLE Commoter (
    idBook INT,
    idComments INT,
    idUser INT,
    PRIMARY KEY (idBook, idComments, idUser),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idComments) REFERENCES Comments(idComments),
    FOREIGN KEY (idUser) REFERENCES User(idUser)
);

CREATE TABLE Parent2_Comments_Comments (
    idParentComments INT,
    idComments INT,
    PRIMARY KEY (idParentComments, idComments),
    FOREIGN KEY (idParentComments) REFERENCES Comments(idComments),
    FOREIGN KEY (idComments) REFERENCES Comments(idComments)
);

CREATE TABLE Avoir (
    idBook INT,
    idUser INT,
    PRIMARY KEY (idBook, idUser),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idUser) REFERENCES User(idUser)
);

CREATE TABLE LikeSave (
    idBook INT,
    idUser INT,
    Liked BOOLEAN,
    Save BOOLEAN,
    PRIMARY KEY (idBook, idUser),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idUser) REFERENCES User(idUser)
);

CREATE TABLE Gestion (
    idBook INT,
    idCompte INT,
    PRIMARY KEY (idBook, idCompte),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idCompte) REFERENCES Compte(idCompte)
);

CREATE TABLE Create_User (
    idCompte INT,
    idUser INT,
    PRIMARY KEY (idCompte, idUser),
    FOREIGN KEY (idCompte) REFERENCES Compte(idCompte),
    FOREIGN KEY (idUser) REFERENCES User(idUser)
);

CREATE TABLE Follow (
    idCompteFollower INT,
    idCompteFollowed INT,
    idUser INT,
    PRIMARY KEY (idCompteFollower, idCompteFollowed, idUser),
    FOREIGN KEY (idCompteFollower) REFERENCES Compte(idCompte),
    FOREIGN KEY (idCompteFollowed) REFERENCES Compte(idCompte),
    FOREIGN KEY (idUser) REFERENCES User(idUser)
);

-- Insérer des données

INSERT INTO Book (Title, Description, DatePublication, NbrPage, Tail, URL_pdf, URL_cover_image, ValideParAdmin)
VALUES
    ('The Alchemist', 'A novel by Paulo Coelho', '1988-04-01', 197, 'A5', 'url_pdf_A', 'url_image_A', 1),
    ('To Kill a Mockingbird', 'A novel by Harper Lee', '1960-07-11', 281, 'B5', 'url_pdf_B', 'url_image_B', 1),
    ('1984', 'A dystopian novel by George Orwell', '1949-06-08', 328, 'A4', 'url_pdf_C', 'url_image_C', 0);

INSERT INTO BookList (listName, dateCreation, listOrder)
VALUES
    ('Reading List 2022', '2022-01-01', 1),
    ('Favorites', '2022-03-15', 2),
    ('Must-Reads', '2022-06-20', 3);

INSERT INTO Category (Libelle)
VALUES
    ('Fiction'),
    ('Mystery'),
    ('Science Fiction'),
    ('Classic');

INSERT INTO Comments (text)
VALUES
    ('Great book! Loved the plot.'),
    ('Could not put it down!'),
    ('Interesting characters and storyline.');

INSERT INTO Compte (CompleteName, dateCreation, password, active, URL_image)
VALUES
    ('El Amrani Fatima', '2022-01-01', 'password123', 1, 'url_image_Fatima_El Amrani'),
    ('Bouazzaoui Ahmed', '2022-02-15', 'pass456', 1, 'url_image_Ahmed_Bouazzaoui'),
    ('Chakir Nadia', '2022-03-20', 'securepass', 0, 'url_image_Nadia_Chakir');

INSERT INTO Languages (name, iso_code)
VALUES
    ('English', 'en'),
    ('French', 'fr'),
    ('Spanish', 'es');

INSERT INTO User (Nom, Prenom, Tell, Ville, email)
VALUES
    ('El Amrani', 'Fatima', '0661122334', 'Casablanca', 'fatima.elamrani@example.com'),
    ('Bouazzaoui', 'Ahmed', '0655112233', 'Rabat', 'ahmed.bouazzaoui@example.com'),
    ('Chakir', 'Nadia', '0666333444', 'Marrakech', 'nadia.chakir@example.com');

INSERT INTO Gestion_BookList (idCompte, idList)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Gestion_Book (idCompte, idBook)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Contain2_Book_BookList (idBook, idList)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Association_Book_Category (idBook, idCategory)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Contain_Book_Languages (idBook, idLanguage)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Parent_Category_Category (idParentCategory, idCategory)
VALUES
    (1, 2),
    (2, 3),
    (3, 4);

INSERT INTO Commoter (idBook, idComments, idUser)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

INSERT INTO Parent2_Comments_Comments (idParentComments, idComments)
VALUES
    (1, 2),
    (2, 3),
    (3, 1);

INSERT INTO Avoir (idBook, idUser)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO LikeSave (idBook, idUser, Liked, Save)
VALUES
    (1, 1, 1, 0),
    (2, 2, 1, 1),
    (3, 3, 0, 1);

INSERT INTO Gestion (idBook, idCompte)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Create_User (idCompte, idUser)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Follow (idCompteFollower, idCompteFollowed, idUser)
VALUES
    (1, 2, 1),
    (2, 3, 2),
    (3, 1, 3);

-- Requêtes

-- 1. Sélectionner tous les livres
SELECT * FROM Book;

-- 2. Sélectionner les utilisateurs de la ville de Marrakech
SELECT * FROM User WHERE Ville = 'Marrakech';

-- 3. Sélectionner les listes de livres triées par date de création
SELECT * FROM BookList ORDER BY dateCreation;

-- 4. Sélectionner les commentaires pour le livre avec l'idBook 1
SELECT Comments.* FROM Comments, Commoter
	WHERE Comments.idComments=Commoter.idComments 
	AND idBook = 1;

-- 5. Sélectionner les livres dans la catégorie 'Fiction'
SELECT b.* FROM Book b
JOIN Association_Book_Category abc ON b.idBook = abc.idBook
JOIN Category c ON abc.idCategory = c.idCategory
WHERE c.Libelle = 'Fiction';

-- 6. Sélectionner les utilisateurs qui ont aimé un livre spécifique (idBook 1)
SELECT u.* FROM User u
JOIN LikeSave ls ON u.idUser = ls.idUser
WHERE ls.idBook = 1 AND ls.Liked = 1;

-- 7. Sélectionner les listes de livres avec leur contenu pour un utilisateur donné (idCompte 1)
SELECT bl.*, b.* FROM BookList bl
JOIN Contain2_Book_BookList cbbl ON bl.idList = cbbl.idList
JOIN Book b ON cbbl.idBook = b.idBook
JOIN Gestion_BookList gbl ON bl.idList = gbl.idList
WHERE gbl.idCompte = 1;

-- 8. Sélectionner les utilisateurs qui suivent un autre utilisateur (idCompteFollower 1)
SELECT u.* FROM User u
JOIN Follow f ON u.idUser = f.idUser
WHERE f.idCompteFollower = 1;

-- 9. Sélectionner les livres avec leur nombre de commentaires
SELECT b.*, COUNT(c.idComments) AS CommentCount FROM Book b
LEFT JOIN Commoter cm ON b.idBook = cm.idBook
LEFT JOIN Comments c ON cm.idComments = c.idComments
GROUP BY b.idBook;

-- 10. Sélectionner les utilisateurs qui ont créé un compte mais n'ont pas encore suivi d'autres utilisateurs
SELECT u.* FROM User u
JOIN Create_User cu ON u.idUser = cu.idUser
LEFT JOIN Follow f ON u.idUser = f.idUser
WHERE f.idCompteFollowed IS NULL;
