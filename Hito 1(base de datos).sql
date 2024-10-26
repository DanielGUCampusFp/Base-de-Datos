DROP DATABASE IF EXISTS Banda;
CREATE DATABASE Banda;
USE Banda;

CREATE TABLE Banda (
    ID_Banda INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Fecha_Fundacion DATE,
    Territorio VARCHAR(100)
);

CREATE TABLE Miembro (
    ID_Miembro INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    Fecha_Ingreso DATE,
    ID_Banda INT,
    FOREIGN KEY (ID_Banda) REFERENCES Banda(ID_Banda)
);

CREATE TABLE Delito (
    ID_Delito INT PRIMARY KEY,
    Tipo_Delito VARCHAR(100),
    Fecha DATE,
    Descripción VARCHAR(200),
    ID_Banda INT
);

CREATE TABLE Victima (
    ID_Victima INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    Descripción VARCHAR(100),
    ID_Delito INT
);

CREATE TABLE Cometer (
    ID_Miembro INT,
    ID_Banda INT,
    ID_Delito INT,
    FOREIGN KEY (ID_Miembro) REFERENCES Miembro(ID_Miembro),
    FOREIGN KEY (ID_Banda) REFERENCES Banda(ID_Banda),
    FOREIGN KEY (ID_Delito) REFERENCES Delito(ID_Delito),
    PRIMARY KEY (ID_Miembro, ID_Banda, ID_Delito)
);

CREATE TABLE Perjudicar (
    ID_Victima INT,
    ID_Delito INT,
    PRIMARY KEY (ID_Victima, ID_Delito),
    Tipo_Perjuicio VARCHAR(50),
    FOREIGN KEY (ID_Delito) REFERENCES Delito(ID_Delito),
    FOREIGN KEY (ID_Victima) REFERENCES Victima(ID_Victima)
);

INSERT INTO Banda (ID_Banda, Nombre, Fecha_Fundacion, Territorio) VALUES (1, 'Los Olvidados', '2015-04-12', 'Centro');
INSERT INTO Banda (ID_Banda, Nombre, Fecha_Fundacion, Territorio) VALUES (2, 'La Mano Negra', '2018-09-20', 'Norte');
INSERT INTO Banda (ID_Banda, Nombre, Fecha_Fundacion, Territorio) VALUES (3, 'Los Sin Nombre', '2020-01-10', 'Sur');

INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (1, 'Juan Pérez', 18, '2020-02-10', 1);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (2, 'María López', 20, '2020-03-15', 1);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (3, 'Carlos Ruiz', 19, '2021-07-01', 2);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (4, 'Pepito Pérez', 28, '2021-03-15', 1);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (5, 'Kiko Matamoros', 25, '2020-06-10', 1);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (6, 'Carlos Martínez', 30, '2019-08-22', 2);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (7, 'Ana Gómez', 27, '2022-01-05', 2);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (8, 'Luis Rodríguez', 29, '2018-11-30', 3);
INSERT INTO Miembro (ID_Miembro, Nombre, Edad, Fecha_Ingreso, ID_Banda) VALUES (9, 'Sofía Torres', 26, '2023-02-14', 3);

INSERT INTO Delito (ID_Delito, Tipo_Delito, Fecha, Descripción, ID_Banda) VALUES (1, 'Robo', '2023-01-20', 'Robo a una tienda', 1);
INSERT INTO Delito (ID_Delito, Tipo_Delito, Fecha, Descripción, ID_Banda) VALUES (2, 'Agresión', '2023-03-05', 'Agresión a un transeúnte', 2);
INSERT INTO Delito (ID_Delito, Tipo_Delito, Fecha, Descripción, ID_Banda) VALUES (3, 'Robo a mano armada', '2023-05-15', 'Robo en una joyería local', 3);
INSERT INTO Delito (ID_Delito, Tipo_Delito, Fecha, Descripción, ID_Banda) VALUES (4, 'Tráfico de drogas', '2023-07-22', 'Distribución de sustancias ilegales', 2);
INSERT INTO Delito (ID_Delito, Tipo_Delito, Fecha, Descripción, ID_Banda) VALUES (5, 'Extorsión', '2023-09-10', 'Extorsión a comerciantes en el sur de la ciudad', 2);


INSERT INTO Victima (ID_Victima, Nombre, Edad, Descripción, ID_Delito) VALUES (1, 'Pedro Gómez', 30, 'Robo de dinero', 1);
INSERT INTO Victima (ID_Victima, Nombre, Edad, Descripción, ID_Delito) VALUES (2, 'Ana Torres', 22, 'Lesiones por agresión', 2);
INSERT INTO Victima (ID_Victima, Nombre, Edad, Descripción, ID_Delito) VALUES (3, 'Pedro González', 45, 'Dueño de la joyería asaltada, sufrió daños físicos y psicológicos.', 3);
INSERT INTO Victima (ID_Victima, Nombre, Edad, Descripción, ID_Delito) VALUES (4, 'Lucía Fernández', 32, 'Comerciante extorsionada, recibió amenazas constantes.', 4);
INSERT INTO Victima (ID_Victima, Nombre, Edad, Descripción, ID_Delito) VALUES (5, 'Javier Martínez', 29, 'Participante de una red de tráfico, atrapado en un operativo.', 5);

INSERT INTO Perjudicar (ID_Victima, ID_Delito, Tipo_Perjuicio) VALUES (1, 1, 'Daño físico');
INSERT INTO Perjudicar (ID_Victima, ID_Delito, Tipo_Perjuicio) VALUES (2, 2, 'Estrés emocional');

INSERT INTO Cometer (ID_Miembro, ID_Banda, ID_Delito) VALUES (1, 1, 1);

SELECT Miembro.Nombre AS Nombre_Miembro, Banda.Nombre AS Nombre_Banda FROM Miembro JOIN Banda ON Miembro.ID_Banda = Banda.ID_Banda;
SELECT Delito.Tipo_Delito, Delito.Fecha, Delito.Descripción, Banda.Nombre AS Nombre_Banda FROM Delito JOIN Banda ON Delito.ID_Banda = Banda.ID_Banda;
SELECT Miembro.Nombre AS Nombre_Miembro, Banda.Nombre AS Nombre_Banda, Delito.Tipo_Delito, Delito.Fecha AS Fecha_Delito FROM Cometer JOIN Miembro ON Cometer.ID_Miembro = Miembro.ID_Miembro JOIN Banda ON Cometer.ID_Banda = Banda.ID_Banda JOIN Delito ON Cometer.ID_Delito = Delito.ID_Delito;
SELECT Victima.Nombre AS Nombre_Victima, Delito.Tipo_Delito, Victima.Descripción AS Descripción_Victima FROM Victima JOIN Delito ON Victima.ID_Delito = Delito.ID_Delito;
SELECT D.ID_Delito, D.Tipo_Delito, V.Nombre AS Nombre_Victima FROM Delito D JOIN Victima V ON D.ID_Delito = V.ID_Delito;
SELECT M.Nombre AS Nombre_Miembro, B.Nombre AS Nombre_Banda FROM Miembro M JOIN Banda B ON M.ID_Banda = B.ID_Banda;
SELECT Tipo_Delito, Fecha FROM Delito;
SELECT Victima.Nombre AS Nombre_Victima, Delito.Tipo_Delito, Perjudicar.Tipo_Perjuicio FROM Perjudicar JOIN Victima ON Perjudicar.ID_Victima = Victima.ID_Victima JOIN Delito ON Perjudicar.ID_Delito = Delito.ID_Delito;
SELECT V.ID_Delito, V.ID_Victima, V.Nombre, V.Edad, V.Descripción, P.Tipo_Perjuicio FROM Victima V INNER JOIN Perjudicar P ON V.ID_Delito = P.ID_Delito;
SELECT * FROM Miembro WHERE Nombre = 'María López';