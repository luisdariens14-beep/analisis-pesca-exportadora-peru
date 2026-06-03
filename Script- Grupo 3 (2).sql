
/* =========================================
   CREACIÓN DE BASE DE DATOS PieLibre2
   Descripción: Script principal de creación
========================================= */
CREATE DATABASE PieLibre2

USE PieLibre2

/* Creamos los esquemas para organizar la base de datos */

CREATE SCHEMA Catalogo;
CREATE SCHEMA Persona;
CREATE SCHEMA Atencion;
CREATE SCHEMA Reporte;

/* =========================================
   CREACIÓN DE LAS TABLAS QUE ESTARAN EN LA BD
   Descripción: Script principal de creación
========================================= */
/* Tabla que almacena los servicios que ofrece el negocio de podología */
CREATE TABLE Catalogo.Servicio  (
IdServicio VARCHAR(10) PRIMARY KEY,
NombreServicio VARCHAR(40) NOT NULL,
PrecioDeServicio DECIMAL(10,2) NOT NULL,
);

/* Tabla que almacena los productos utilizados o vendidos */
CREATE TABLE Catalogo.Producto (
IdProducto VARCHAR(10) PRIMARY KEY,
NombreProducto VARCHAR(40) NOT NULL,
PrecioDeProducto DECIMAL(10,2) NOT NULL,
);

/* Tabla que almacena la información de las podólogas (personal que atiende) */
CREATE TABLE Persona.Podologa (
IdPodologa VARCHAR(10) PRIMARY KEY,
NombrePodologa VARCHAR(40) NOT NULL,
ApellidoPodologa VARCHAR(40) NOT NULL,
NumeroDeContacto VARCHAR(12) NOT NULL, 
);

/* Tabla que almacena las campañas o promociones */
CREATE TABLE Catalogo.Campana  (
IdCampana VARCHAR(10) PRIMARY KEY,
NombreCampana VARCHAR(40) NOT NULL,
); 


/* Tabla que almacena la información de los pacientes */
CREATE TABLE Persona.Paciente (
IdPaciente VARCHAR(10) PRIMARY KEY,
NombrePaciente VARCHAR(40) NOT NULL,
ApellidoPaciente VARCHAR(40) NOT NULL,
NumeroDeContacto VARCHAR(12) NOT NULL,
FechaDeInicio DATE NOT NULL,
IdCampana VARCHAR(10) CONSTRAINT FK_Paciente_Campana FOREIGN KEY (IdCampana) REFERENCES Catalogo.Campana(IdCampana)
);

/* Tabla que registra cada atención realizada a los pacientes */
CREATE TABLE Atencion.Atencion (
    IdAtencion VARCHAR(10) PRIMARY KEY,
    IdPaciente VARCHAR(10) NOT NULL CONSTRAINT FK_Atencion_Paciente FOREIGN KEY (IdPaciente) REFERENCES Persona.Paciente (IdPaciente),
    Fecha DATE NOT NULL,
    IdServicio VARCHAR(10) CONSTRAINT FK_Atencion_Servicio FOREIGN KEY (IdServicio) REFERENCES Catalogo.Servicio (IdServicio),
    IdProducto VARCHAR(10) CONSTRAINT FK_Atencion_Producto FOREIGN KEY (IdProducto) REFERENCES Catalogo.Producto (IdProducto) 
);

/* INSERCION DE DATOS ALA BASE DE DATOS */


INSERT INTO Catalogo.Servicio (IdServicio, NombreServicio, PrecioDeServicio) VALUES
('S001', 'Podologia integral', 95.00),
('S002', 'Extraccion de unero', 79.90),
('S003', 'Curacion de pie diabetico', 140.00),
('S004', 'Tratamiento antimicotico', 109.90),
('S005', 'Paquete laser podologico', 180.00),
('S006', 'Corte y limpieza de unas', 45.00),
('S007', 'Evaluacion podologica', 34.90),
('S008', 'Control de pie diabetico', 120.00),
('S009', 'Retiro de callosidades', 60.00),
('S010', 'Tratamiento de verruga plantar', 129.90),
('S011', 'Reconstruccion ungueal', 150.00),
('S012', 'Ortonixia correctiva', 170.00),
('S013', 'Hidratacion profunda de pies', 55.00),
('S014', 'Reflexologia podal', 90.00),
('S015', 'Deslaminacion de unas', 49.90),
('S016', 'Curacion post extraccion', 65.00),
('S017', 'Atencion podologica infantil', 70.00),
('S018', 'Exfoliacion terapeutica', 40.00),
('S019', 'Masaje podal relajante', 85.00),
('S020', 'Tratamiento integral premium', 220.00);
GO

SELECT * FROM Catalogo.Servicio ;


INSERT INTO Catalogo.Producto(IdProducto, NombreProducto, PrecioDeProducto)
VALUES
('P001', 'Talco para pies', 18.00),
('P002', 'Aceite antimicotico', 32.00),
('P003', 'Cortaunas especial', 24.90),
('P004', 'Crema hidratante para pies', 27.00),
('P005', 'Plantillas de gel', 45.00),
('P006', 'Spray desodorante podologico', 29.90),
('P007', 'Separadores de dedos', 15.00),
('P008', 'Lima profesional de unas', 21.00),
('P009', 'Protector para juanete', 38.00),
('P010', 'Jabon antimicotico', 19.90),
('P011', 'Crema para talones agrietados', 34.00),
('P012', 'Parche para ampollas', 16.00),
('P013', 'Antiseptico podologico', 26.00),
('P014', 'Venda elastica para pie', 22.00),
('P015', 'Silicona para callos', 28.90),
('P016', 'Plantillas ortopedicas basicas', 65.00),
('P017', 'Polvo secante para pies', 17.00),
('P018', 'Removedor de durezas', 31.00),
('P019', 'Kit basico de cuidado podal', 49.90),
('P020', 'Suero reparador ungueal', 36.00);

GO

SELECT * FROM Catalogo.Producto;


INSERT INTO   Persona.Podologa  (IdPodologa, NombrePodologa, ApellidoPodologa, NumeroDeContacto)
VALUES
('PO001', 'Mariela', 'Castro', '987654321'),
('PO002', 'Fernanda', 'Rojas', '976123458'),
('PO003', 'Lucia', 'Mendoza', '965741238'),
('PO004', 'Daniela', 'Vargas', '954852147'),
('PO005', 'Camila', 'Torres', '943216578'),
('PO006', 'Valeria', 'Paredes', '932145876'),
('PO007', 'Andrea', 'Salazar', '921334455'),
('PO008', 'Paola', 'Navarro', '910223344'),
('PO009', 'Fiorella', 'Gutierrez', '998112233'),
('PO010', 'Tatiana', 'Lopez', '986445577'),
('PO011', 'Carla', 'Ramirez', '975336688'),
('PO012', 'Jessica', 'Huaman', '964227799'),
('PO013', 'Rocio', 'Cespedes', '953118844'),
('PO014', 'Milagros', 'Soto', '942556677'),
('PO015', 'Brenda', 'Chavez', '931667788'),
('PO016', 'Diana', 'Flores', '920778899'),
('PO017', 'Yessenia', 'Aguilar', '999334455'),
('PO018', 'Katherine', 'Ortega', '988445566'),
('PO019', 'Nathaly', 'Morales', '977556644'),
('PO020', 'Estefany', 'Quispe', '966667755');

GO

SELECT * FROM Persona.Podologa ;

INSERT INTO Catalogo.Campana(IdCampana, NombreCampana)
VALUES
('C001', 'Campana 1'),
('C002', 'Campana 2');

GO

SELECT * FROM Catalogo.Campana ;


INSERT INTO Persona.Paciente  (IdPaciente, NombrePaciente, ApellidoPaciente, NumeroDeContacto, FechaDeInicio, IdCampana)
VALUES
('PA001', 'Ana', 'Lopez', '987111001', '2026-01-05', 'C001'),
('PA002', 'Diego', 'Ramirez', '987111002', '2026-01-05', 'C002'),
('PA003', 'Lucia', 'Torres', '987111003', '2026-01-06', 'C001'),
('PA004', 'Mateo', 'Vargas', '987111004', '2026-01-06', 'C002'),
('PA005', 'Camila', 'Rojas', '987111005', '2026-01-07', 'C001'),
('PA006', 'Jose', 'Fernandez', '987111006', '2026-01-07', 'C002'),
('PA007', 'Valeria', 'Mendoza', '987111007', '2026-01-08', 'C001'),
('PA008', 'Andres', 'Castillo', '987111008', '2026-01-08', 'C002'),
('PA009', 'Mariana', 'Gutierrez', '987111009', '2026-01-09', 'C001'),
('PA010', 'Sebastian', 'Navarro', '987111010', '2026-01-09', 'C002'),
('PA011', 'Daniela', 'Paredes', '987111011', '2026-01-10', 'C001'),
('PA012', 'Alonso', 'Salazar', '987111012', '2026-01-10', 'C002'),
('PA013', 'Paola', 'Morales', '987111013', '2026-01-11', 'C001'),
('PA014', 'Javier', 'Chavez', '987111014', '2026-01-11', 'C002'),
('PA015', 'Fiorella', 'Aguilar', '987111015', '2026-01-12', 'C001'),
('PA016', 'Renato', 'Soto', '987111016', '2026-01-12', 'C002'),
('PA017', 'Milagros', 'Quispe', '987111017', '2026-01-13', 'C001'),
('PA018', 'Cristian', 'Flores', '987111018', '2026-01-13', 'C002'),
('PA019', 'Tatiana', 'Huaman', '987111019', '2026-01-14', 'C001'),
('PA020', 'Bruno', 'Ortega', '987111020', '2026-01-14', 'C002'),
('PA021', 'Carla', 'Cespedes', '987111021', '2026-01-15', 'C001'),
('PA022', 'Fabian', 'Reyes', '987111022', '2026-01-15', 'C002'),
('PA023', 'Rocio', 'Silva', '987111023', '2026-01-16', 'C001'),
('PA024', 'Mauricio', 'Delgado', '987111024', '2026-01-16', 'C002'),
('PA025', 'Estefany', 'Garcia', '987111025', '2026-01-17', 'C001'),
('PA026', 'Kevin', 'Mamani', '987111026', '2026-01-17', 'C002'),
('PA027', 'Andrea', 'Rivera', '987111027', '2026-01-18', 'C001'),
('PA028', 'Luis', 'Benites', '987111028', '2026-01-18', 'C002'),
('PA029', 'Jessica', 'Campos', '987111029', '2026-01-19', 'C001'),
('PA030', 'Piero', 'Pena', '987111030', '2026-01-19', 'C002'),
('PA031', 'Nathaly', 'Vega', '987111031', '2026-01-20', 'C001'),
('PA032', 'Diego', 'Cruz', '987111032', '2026-01-20', 'C002'),
('PA033', 'Katherine', 'Espinoza', '987111033', '2026-01-21', 'C001'),
('PA034', 'Miguel', 'Luna', '987111034', '2026-01-21', 'C002'),
('PA035', 'Yessenia', 'Medina', '987111035', '2026-01-22', 'C001'),
('PA036', 'Adrian', 'Nunez', '987111036', '2026-01-22', 'C002'),
('PA037', 'Diana', 'Poma', '987111037', '2026-01-23', 'C001'),
('PA038', 'Ricardo', 'Arias', '987111038', '2026-01-23', 'C002'),
('PA039', 'Lucero', 'Herrera', '987111039', '2026-01-24', 'C001'),
('PA040', 'Franco', 'Valdez', '987111040', '2026-01-24', 'C002'),
('PA041', 'Sandra', 'Cabrera', '987111041', '2026-01-25', 'C001'),
('PA042', 'Martin', 'Palomino', '987111042', '2026-01-25', 'C002'),
('PA043', 'Claudia', 'Fuentes', '987111043', '2026-01-26', 'C001'),
('PA044', 'Hector', 'Miranda', '987111044', '2026-01-26', 'C002'),
('PA045', 'Vanessa', 'Mejia', '987111045', '2026-01-27', 'C001');

GO

SELECT * FROM Persona.Paciente ;


INSERT INTO Atencion.Atencion  (IdAtencion, IdPaciente, Fecha, IdServicio, IdProducto)
VALUES
('A001', 'PA001', '2026-01-05', 'S007', 'P007'),
('A002', 'PA002', '2026-01-05', 'S020', 'P016'),
('A003', 'PA003', '2026-01-06', 'S006', NULL),
('A004', 'PA004', '2026-01-06', 'S005', 'P019'),
('A005', 'PA005', '2026-01-07', NULL, 'P001'),
('A006', 'PA006', '2026-01-07', 'S011', 'P005'),
('A007', 'PA007', '2026-01-08', 'S018', 'P012'),
('A008', 'PA008', '2026-01-08', 'S012', NULL),
('A009', 'PA009', '2026-01-09', 'S015', 'P017'),
('A010', 'PA010', '2026-01-09', NULL, 'P016'),
('A011', 'PA011', '2026-01-10', 'S013', NULL),
('A012', 'PA012', '2026-01-10', 'S003', 'P020'),
('A013', 'PA013', '2026-01-11', 'S009', 'P014'),
('A014', 'PA014', '2026-01-11', 'S010', 'P011'),
('A015', 'PA015', '2026-01-12', NULL, 'P010'),
('A016', 'PA016', '2026-01-12', 'S008', NULL),
('A017', 'PA017', '2026-01-13', 'S017', 'P008'),
('A018', 'PA018', '2026-01-13', 'S004', 'P018'),
('A019', 'PA019', '2026-01-14', 'S002', NULL),
('A020', 'PA020', '2026-01-14', NULL, 'P009'),
('A021', 'PA021', '2026-01-15', 'S019', 'P004'),
('A022', 'PA022', '2026-01-15', 'S001', 'P006'),
('A023', 'PA023', '2026-01-16', 'S007', NULL),
('A024', 'PA024', '2026-01-16', 'S020', 'P016'),
('A025', 'PA025', '2026-01-17', NULL, 'P007'),
('A026', 'PA026', '2026-01-17', 'S005', NULL),
('A027', 'PA027', '2026-01-18', 'S006', 'P003'),
('A028', 'PA028', '2026-01-18', 'S011', 'P005'),
('A029', 'PA029', '2026-01-19', 'S018', NULL),
('A030', 'PA030', '2026-01-19', 'S012', 'P019'),
('A031', 'PA031', '2026-01-20', 'S015', 'P001'),
('A032', 'PA032', '2026-01-20', NULL, 'P020'),
('A033', 'PA033', '2026-01-21', 'S013', 'P012'),
('A034', 'PA034', '2026-01-21', 'S003', NULL),
('A035', 'PA035', '2026-01-22', NULL, 'P017'),
('A036', 'PA036', '2026-01-22', 'S010', 'P011'),
('A037', 'PA037', '2026-01-23', 'S009', NULL),
('A038', 'PA038', '2026-01-23', 'S008', 'P006'),
('A039', 'PA039', '2026-01-24', 'S017', 'P014'),
('A040', 'PA040', '2026-01-24', NULL, 'P016'),
('A041', 'PA041', '2026-01-25', 'S002', 'P004'),
('A042', 'PA042', '2026-01-25', 'S004', 'P018'),
('A043', 'PA043', '2026-01-26', NULL, 'P010'),
('A044', 'PA044', '2026-01-26', 'S001', NULL),
('A045', 'PA045', '2026-01-27', 'S019', 'P008'),

('A046', 'PA001', '2026-01-19', 'S006', 'P001'),
('A047', 'PA002', '2026-01-21', 'S005', NULL),
('A048', 'PA004', '2026-01-24', NULL, 'P019'),
('A049', 'PA006', '2026-01-28', 'S011', 'P016'),
('A050', 'PA008', '2026-02-01', 'S012', 'P005'),
('A051', 'PA003', '2026-01-20', 'S007', NULL),
('A052', 'PA005', '2026-01-23', 'S018', 'P007'),
('A053', 'PA007', '2026-01-29', NULL, 'P012'),
('A054', 'PA009', '2026-02-02', 'S015', 'P003'),
('A055', 'PA010', '2026-02-03', 'S020', 'P016'),
('A056', 'PA012', '2026-02-05', NULL, 'P020'),
('A057', 'PA014', '2026-02-08', 'S003', 'P011'),
('A058', 'PA016', '2026-02-10', 'S008', NULL),
('A059', 'PA018', '2026-02-12', 'S004', 'P018'),
('A060', 'PA011', '2026-01-24', 'S013', 'P017'),
('A061', 'PA013', '2026-01-27', NULL, 'P014'),
('A062', 'PA015', '2026-02-01', 'S009', NULL),
('A063', 'PA017', '2026-02-04', 'S017', 'P004'),
('A064', 'PA019', '2026-02-06', 'S002', 'P010'),
('A065', 'PA020', '2026-02-07', 'S010', NULL),
('A066', 'PA022', '2026-02-09', NULL, 'P009'),
('A067', 'PA024', '2026-02-11', 'S001', 'P006'),
('A068', 'PA026', '2026-02-13', 'S005', 'P019'),
('A069', 'PA028', '2026-02-15', 'S011', NULL),
('A070', 'PA030', '2026-02-17', 'S020', 'P016');

GO

SELECT * FROM Atencion.Atencion;


/* =========================================
   ACTUALIZACIÓN DE TABLA: Persona.Podologa
   Descripción: Modificación + reinserción de datos
========================================= */

ALTER TABLE Persona.Podologa
ALTER COLUMN NombrePodologa VARCHAR(60);
DELETE FROM Persona.Podologa;
INSERT INTO Persona.Podologa 
(IdPodologa, NombrePodologa, ApellidoPodologa, NumeroDeContacto) VALUES

('PO001','Adriana','Lopez','900111001'),
('PO002','Valeria','Ramos','900111002'),
('PO003','Camila','Torres','900111003'),
('PO004','Luciana','Vega','900111004'),
('PO005','Daniela','Castillo','900111005'),
('PO006','Fernanda','Salas','900111006'),
('PO007','Mariana','Paredes','900111007'),
('PO008','Andrea','Mendoza','900111008'),
('PO009','Paola','Quispe','900111009'),
('PO010','Rocio','Huaman','900111010'),
('PO011','Milagros','Cruz','900111011'),
('PO012','Jessica','Flores','900111012'),
('PO013','Katherine','Navarro','900111013'),
('PO014','Tatiana','Reyes','900111014'),
('PO015','Fiorella','Silva','900111015'),
('PO016','Estefany','Ortega','900111016'),
('PO017','Brenda','Campos','900111017'),
('PO018','Diana','Rojas','900111018'),
('PO019','Nathaly','Garcia','900111019'),
('PO020','Yessenia','Delgado','900111020');

GO

SELECT * FROM Persona.Podologa;

/* =========================================
   ACTUALIZACIÓN DE TABLA: Atencion.Atencion
   Descripción:
   - Se agrega columna TotalAtencion
   - Se calcula el total usando CASE (como el ejemplo)
========================================= */

ALTER TABLE Atencion.Atencion
ADD TotalAtencion DECIMAL(10,2);
GO

UPDATE Atencion.Atencion
SET TotalAtencion =
    CASE 
        WHEN IdServicio IS NOT NULL AND IdProducto IS NOT NULL THEN 
            (SELECT PrecioDeServicio 
             FROM Catalogo.Servicio 
             WHERE IdServicio = Atencion.Atencion.IdServicio)
          + (SELECT PrecioDeProducto 
             FROM Catalogo.Producto 
             WHERE IdProducto = Atencion.Atencion.IdProducto)

        WHEN IdServicio IS NOT NULL THEN 
            (SELECT PrecioDeServicio 
             FROM Catalogo.Servicio 
             WHERE IdServicio = Atencion.Atencion.IdServicio)

        WHEN IdProducto IS NOT NULL THEN 
            (SELECT PrecioDeProducto 
             FROM Catalogo.Producto 
             WHERE IdProducto = Atencion.Atencion.IdProducto)

        ELSE 0
    END;
GO

SELECT * FROM Atencion.Atencion;

/* ===============
      CONSULTAS
   ================*/
/* TOP 5 SERVICIOS MAS USADOS*/
CREATE PROCEDURE Catalogo.SP_TopServicios
AS
BEGIN
    SELECT TOP 5
        S.NombreServicio,
        COUNT(A.IdServicio) AS VecesUsado
    FROM Atencion.Atencion A
    INNER JOIN Catalogo.Servicio S ON A.IdServicio = S.IdServicio
    GROUP BY S.NombreServicio
    ORDER BY VecesUsado DESC;
END;

EXEC Catalogo.SP_TopServicios;

/*Total de ingresos por servicio - qué servicios generan más dinero.*/
SELECT 
    S.NombreServicio,
    COUNT(A.IdServicio) AS CantidadAtenciones,
    SUM(S.PrecioDeServicio) AS TotalIngresos

FROM Atencion.Atencion A
INNER JOIN Catalogo.Servicio S ON A.IdServicio = S.IdServicio
GROUP BY S.NombreServicio
ORDER BY TotalIngresos DESC;

/* PACIENTES POR CAMPAÑA*/
SELECT 
    C.NombreCampana,
    COUNT(P.IdPaciente) AS TotalPacientes

FROM Persona.Paciente P
INNER JOIN Catalogo.Campana C 
    ON P.IdCampana = C.IdCampana

GROUP BY C.NombreCampana;


/* TOTAL GASTADO POR PACIENTE Y CAMPAÑA: cuánto gasta cada paciente*/
SELECT 
    P.NombrePaciente,
    P.ApellidoPaciente,
    CP.IdCampana,
    SUM(ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0)) AS TotalGastado

FROM Persona.Paciente P
LEFT JOIN Atencion.Atencion A ON P.IdPaciente = A.IdPaciente
LEFT JOIN Catalogo.Servicio S ON A.IdServicio = S.IdServicio
LEFT JOIN Catalogo.Producto PR  ON A.IdProducto = PR.IdProducto
LEFT JOIN Catalogo.Campana CP ON CP.IdCampana =P.IdCampana 
GROUP BY 
    CP.IdCampana,
     P.NombrePaciente,
     P.ApellidoPaciente

ORDER BY TotalGastado DESC;


/*Servicio más usado por cada día: qué servicio domina cada día.*/

SELECT 
    A.Fecha,
    S.NombreServicio,
    COUNT(*) AS Total

FROM Atencion.Atencion A
INNER JOIN Catalogo.Servicio S ON A.IdServicio = S.IdServicio

GROUP BY A.Fecha, S.NombreServicio

HAVING COUNT(*) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT COUNT(*) AS Cantidad
        FROM Atencion.Atencion A2
        WHERE A2.Fecha = A.Fecha
        AND A2.IdServicio IS NOT NULL
        GROUP BY A2.IdServicio
    ) AS T
);

/*Procedimiento: resumen general del negocio, KPIs principales del negocio*/
CREATE PROCEDURE Reporte.SP_ResumenGeneral
AS
BEGIN
    SELECT 
        COUNT(DISTINCT P.IdPaciente) AS TotalPacientes,
        COUNT(A.IdAtencion) AS TotalAtenciones,
        SUM(ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0)) AS IngresosTotales

    FROM Persona.Paciente P
    LEFT JOIN Atencion.Atencion A ON P.IdPaciente = A.IdPaciente
    LEFT JOIN Catalogo.Servicio S ON A.IdServicio = S.IdServicio
    LEFT JOIN Catalogo.Producto PR ON A.IdProducto = PR.IdProducto;
END;


EXEC  Reporte.SP_ResumenGeneral;

/*DetalLe financiero por atención, ingresos por cada atención.*/
CREATE VIEW Reporte.VW_DetalleFinanciero
AS
SELECT 
    A.IdAtencion,
    A.Fecha,

    ISNULL(S.PrecioDeServicio,0) AS PrecioServicio,
    ISNULL(PR.PrecioDeProducto,0) AS PrecioProducto,

    ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0) AS Total

FROM Atencion.Atencion A
LEFT JOIN Catalogo.Servicio S  ON A.IdServicio = S.IdServicio
LEFT JOIN Catalogo.Producto PR ON A.IdProducto = PR.IdProducto;

SELECT * FROM Reporte.VW_DetalleFinanciero

/*Productos nunca vendidos, productos sin rotación (importante para inventario).*/
SELECT 
    P.NombreProducto

FROM Catalogo.Producto P

LEFT JOIN Atencion.Atencion A 
    ON P.IdProducto = A.IdProducto

WHERE A.IdProducto IS NULL;

/*Mes con mayor actividad, estacionalidad del negocio.*/
SELECT 
    MONTH(Fecha) AS Mes,
    COUNT(*) AS TotalAtenciones

FROM Atencion.Atencion

GROUP BY MONTH(Fecha)
ORDER BY TotalAtenciones DESC;

/*Días con baja actividad (menos de 2 atenciones), días flojos del negocio.*/
SELECT 
    Fecha,
    COUNT(*) AS Total

FROM Atencion.Atencion

GROUP BY Fecha

HAVING COUNT(*) < 2;