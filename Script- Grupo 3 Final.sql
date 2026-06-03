CREATE DATABASE PieLibre22
USE PieLibre22


/* =========================================
   CREACIÓN DE LAS TABLAS QUE ESTARAN EN LA BD
   Descripción: Script principal de creación
========================================= */
/* Tabla que almacena los servicios que ofrece el negocio de podología */
CREATE TABLE Servicio  (
IdServicio VARCHAR(10) PRIMARY KEY,
NombreServicio VARCHAR(40) NOT NULL,
PrecioDeServicio DECIMAL(10,2) NOT NULL,
);

/* Tabla que almacena los productos utilizados o vendidos */
CREATE TABLE Producto (
IdProducto VARCHAR(10) PRIMARY KEY,
NombreProducto VARCHAR(40) NOT NULL,
PrecioDeProducto DECIMAL(10,2) NOT NULL,
);

/* Tabla que almacena la información de las podólogas (personal que atiende) */
CREATE TABLE Podologa (
IdPodologa VARCHAR(10) PRIMARY KEY,
NombrePodologa VARCHAR(40) NOT NULL,
ApellidoPodologa VARCHAR(40) NOT NULL,
NumeroDeContacto VARCHAR(12) NOT NULL, 
);

/* Tabla que almacena las campañas o promociones */
CREATE TABLE Campana  (
IdCampana VARCHAR(10) PRIMARY KEY,
NombreCampana VARCHAR(40) NOT NULL,
); 


/* Tabla que almacena la información de los pacientes */
CREATE TABLE Paciente (
IdPaciente VARCHAR(10) PRIMARY KEY,
NombrePaciente VARCHAR(40) NOT NULL,
ApellidoPaciente VARCHAR(40) NOT NULL,
NumeroDeContacto VARCHAR(12) NOT NULL,
FechaDeInicio DATE NOT NULL,
IdCampana VARCHAR(10) CONSTRAINT FK_Paciente_Campana FOREIGN KEY (IdCampana) REFERENCES Campana(IdCampana)
);

/* Tabla que registra cada atención realizada a los pacientes */
CREATE TABLE Atencion (
    IdAtencion VARCHAR(10) PRIMARY KEY,
    IdPaciente VARCHAR(10) NOT NULL CONSTRAINT FK_Atencion_Paciente FOREIGN KEY (IdPaciente) REFERENCES Paciente (IdPaciente),
    Fecha DATE NOT NULL,
    IdServicio VARCHAR(10) CONSTRAINT FK_Atencion_Servicio FOREIGN KEY (IdServicio) REFERENCES Servicio (IdServicio),
    IdProducto VARCHAR(10) CONSTRAINT FK_Atencion_Producto FOREIGN KEY (IdProducto) REFERENCES Producto (IdProducto),
	IdPodologa VARCHAR(10) CONSTRAINT FK_Atencion_Podologa FOREIGN KEY (IdPodologa) REFERENCES Podologa (IdPodologa)
);

/* INSERCION DE DATOS ALA BASE DE DATOS */


INSERT INTO Servicio (IdServicio, NombreServicio, PrecioDeServicio) VALUES
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

SELECT * FROM Servicio;


INSERT INTO Producto(IdProducto, NombreProducto, PrecioDeProducto)
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

SELECT * FROM Producto;

INSERT INTO   Podologa(IdPodologa, NombrePodologa, ApellidoPodologa, NumeroDeContacto)
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

SELECT * FROM Podologa ;

INSERT INTO Campana(IdCampana, NombreCampana)
VALUES
('C001', 'Campana 1'),
('C002', 'Campana 2');

GO
SELECT * FROM Campana ;


INSERT INTO Paciente  (IdPaciente, NombrePaciente, ApellidoPaciente, NumeroDeContacto, FechaDeInicio, IdCampana)
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

SELECT * FROM Paciente ;


INSERT INTO Atencion(IdAtencion, IdPaciente, Fecha, IdServicio, IdProducto, IdPodologa)
VALUES
('A001', 'PA001', '2026-01-05', 'S007', 'P007', 'PO014'),
('A002', 'PA002', '2026-01-05', 'S020', 'P016', 'PO003'),
('A003', 'PA003', '2026-01-06', 'S006', NULL, 'PO011'),
('A004', 'PA004', '2026-01-06', 'S005', 'P019', 'PO007'),
('A005', 'PA005', '2026-01-07', NULL, 'P001', 'PO019'),
('A006', 'PA006', '2026-01-07', 'S011', 'P005', 'PO002'),
('A007', 'PA007', '2026-01-08', 'S018', 'P012', 'PO016'),
('A008', 'PA008', '2026-01-08', 'S012', NULL, 'PO009'),
('A009', 'PA009', '2026-01-09', 'S015', 'P017', 'PO005'),
('A010', 'PA010', '2026-01-09', NULL, 'P016', 'PO012'),
('A011', 'PA011', '2026-01-10', 'S013', NULL, 'PO001'),
('A012', 'PA012', '2026-01-10', 'S003', 'P020', 'PO018'),
('A013', 'PA013', '2026-01-11', 'S009', 'P014', 'PO006'),
('A014', 'PA014', '2026-01-11', 'S010', 'P011', 'PO020'),
('A015', 'PA015', '2026-01-12', NULL, 'P010', 'PO004'),
('A016', 'PA016', '2026-01-12', 'S008', NULL, 'PO015'),
('A017', 'PA017', '2026-01-13', 'S017', 'P008', 'PO010'),
('A018', 'PA018', '2026-01-13', 'S004', 'P018', 'PO013'),
('A019', 'PA019', '2026-01-14', 'S002', NULL, 'PO008'),
('A020', 'PA020', '2026-01-14', NULL, 'P009', 'PO017'),
('A021', 'PA021', '2026-01-15', 'S019', 'P004', 'PO003'),
('A022', 'PA022', '2026-01-15', 'S001', 'P006', 'PO014'),
('A023', 'PA023', '2026-01-16', 'S007', NULL, 'PO007'),
('A024', 'PA024', '2026-01-16', 'S020', 'P016', 'PO011'),
('A025', 'PA025', '2026-01-17', NULL, 'P007', 'PO002'),
('A026', 'PA026', '2026-01-17', 'S005', NULL, 'PO019'),
('A027', 'PA027', '2026-01-18', 'S006', 'P003', 'PO009'),
('A028', 'PA028', '2026-01-18', 'S011', 'P005', 'PO016'),
('A029', 'PA029', '2026-01-19', 'S018', NULL, 'PO005'),
('A030', 'PA030', '2026-01-19', 'S012', 'P019', 'PO001'),
('A031', 'PA031', '2026-01-20', 'S015', 'P001', 'PO012'),
('A032', 'PA032', '2026-01-20', NULL, 'P020', 'PO018'),
('A033', 'PA033', '2026-01-21', 'S013', 'P012', 'PO006'),
('A034', 'PA034', '2026-01-21', 'S003', NULL, 'PO020'),
('A035', 'PA035', '2026-01-22', NULL, 'P017', 'PO004'),
('A036', 'PA036', '2026-01-22', 'S010', 'P011', 'PO015'),
('A037', 'PA037', '2026-01-23', 'S009', NULL, 'PO010'),
('A038', 'PA038', '2026-01-23', 'S008', 'P006', 'PO013'),
('A039', 'PA039', '2026-01-24', 'S017', 'P014', 'PO008'),
('A040', 'PA040', '2026-01-24', NULL, 'P016', 'PO017'),
('A041', 'PA041', '2026-01-25', 'S002', 'P004', 'PO014'),
('A042', 'PA042', '2026-01-25', 'S004', 'P018', 'PO003'),
('A043', 'PA043', '2026-01-26', NULL, 'P010', 'PO011'),
('A044', 'PA044', '2026-01-26', 'S001', NULL, 'PO007'),
('A045', 'PA045', '2026-01-27', 'S019', 'P008', 'PO019'),
('A046', 'PA001', '2026-01-19', 'S006', 'P001', 'PO002'),
('A047', 'PA002', '2026-01-21', 'S005', NULL, 'PO016'),
('A048', 'PA004', '2026-01-24', NULL, 'P019', 'PO009'),
('A049', 'PA006', '2026-01-28', 'S011', 'P016', 'PO005'),
('A050', 'PA008', '2026-02-01', 'S012', 'P005', 'PO012'),
('A051', 'PA003', '2026-01-20', 'S007', NULL, 'PO001'),
('A052', 'PA005', '2026-01-23', 'S018', 'P007', 'PO018'),
('A053', 'PA007', '2026-01-29', NULL, 'P012', 'PO006'),
('A054', 'PA009', '2026-02-02', 'S015', 'P003', 'PO020'),
('A055', 'PA010', '2026-02-03', 'S020', 'P016', 'PO004'),
('A056', 'PA012', '2026-02-05', NULL, 'P020', 'PO015'),
('A057', 'PA014', '2026-02-08', 'S003', 'P011', 'PO010'),
('A058', 'PA016', '2026-02-10', 'S008', NULL, 'PO013'),
('A059', 'PA018', '2026-02-12', 'S004', 'P018', 'PO008'),
('A060', 'PA011', '2026-01-24', 'S013', 'P017', 'PO017'),
('A061', 'PA013', '2026-01-27', NULL, 'P014', 'PO003'),
('A062', 'PA015', '2026-02-01', 'S009', NULL, 'PO014'),
('A063', 'PA017', '2026-02-04', 'S017', 'P004', 'PO007'),
('A064', 'PA019', '2026-02-06', 'S002', 'P010', 'PO011'),
('A065', 'PA020', '2026-02-07', 'S010', NULL, 'PO002'),
('A066', 'PA022', '2026-02-09', NULL, 'P009', 'PO019'),
('A067', 'PA024', '2026-02-11', 'S001', 'P006', 'PO009'),
('A068', 'PA026', '2026-02-13', 'S005', 'P019', 'PO016'),
('A069', 'PA028', '2026-02-15', 'S011', NULL, 'PO005'),
('A070', 'PA030', '2026-02-17', 'S020', 'P016', 'PO012');
GO

SELECT * FROM Atencion;



/* =========================================
   ACTUALIZACIÓN DE TABLA: Atencion
   Descripción:
   - Se agrega columna TotalAtencion
   - Se calcula el total usando CASE (como el ejemplo)
========================================= */

ALTER TABLE Atencion
ADD TotalAtencion DECIMAL(10,2);
GO

UPDATE Atencion
SET TotalAtencion =
    CASE 
        WHEN IdServicio IS NOT NULL AND IdProducto IS NOT NULL THEN 
            (SELECT PrecioDeServicio 
             FROM Servicio 
             WHERE IdServicio = Atencion.IdServicio)
          + (SELECT PrecioDeProducto 
             FROM Producto 
             WHERE IdProducto = Atencion.IdProducto)

        WHEN IdServicio IS NOT NULL THEN 
            (SELECT PrecioDeServicio 
             FROM Servicio 
             WHERE IdServicio = Atencion.IdServicio)

        WHEN IdProducto IS NOT NULL THEN 
            (SELECT PrecioDeProducto 
             FROM Producto 
             WHERE IdProducto = Atencion.IdProducto)

        ELSE 0
    END;
GO

SELECT * FROM Atencion;

/* ===============
      CONSULTAS
   ================*/
/* TOP 5 SERVICIOS MAS USADOS*/
CREATE PROCEDURE SP_TopServicios
AS
BEGIN
    SELECT TOP 5
        S.NombreServicio,
        COUNT(A.IdServicio) AS VecesUsado
    FROM Atencion A
    INNER JOIN Servicio S ON A.IdServicio = S.IdServicio
    GROUP BY S.NombreServicio
    ORDER BY VecesUsado DESC;
END;

EXEC SP_TopServicios;

/*Total de ingresos por servicio - qué servicios generan más dinero.*/
SELECT 
    S.NombreServicio,
    COUNT(A.IdServicio) AS CantidadAtenciones,
    SUM(S.PrecioDeServicio) AS TotalIngresos

FROM Atencion A
INNER JOIN Servicio S ON A.IdServicio = S.IdServicio
GROUP BY S.NombreServicio
ORDER BY TotalIngresos DESC;

/* PACIENTES POR CAMPAÑA*/
SELECT 
    C.NombreCampana,
    COUNT(P.IdPaciente) AS TotalPacientes
FROM Paciente P
INNER JOIN Campana C 
    ON P.IdCampana = C.IdCampana

GROUP BY C.NombreCampana;


/* TOTAL GASTADO POR PACIENTE: cuánto gasta cada paciente*/
SELECT 
    P.NombrePaciente,
    P.ApellidoPaciente,
    SUM(ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0)) AS TotalGastado

FROM Paciente P
LEFT JOIN Atencion A ON P.IdPaciente = A.IdPaciente
LEFT JOIN Servicio S ON A.IdServicio = S.IdServicio
LEFT JOIN Producto PR  ON A.IdProducto = PR.IdProducto
LEFT JOIN Campana CP ON CP.IdCampana =P.IdCampana 
GROUP BY 
     P.NombrePaciente,
     P.ApellidoPaciente

ORDER BY TotalGastado DESC;

/* TOTAL GASTADO POR PROCEDENCIA DE CAMPAÑA: cuánto gasta cada paciente que viene de tal campaña*/
SELECT 
    CP.IdCampana,
    SUM(ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0)) AS TotalGastado
FROM Paciente P
LEFT JOIN Atencion A ON P.IdPaciente = A.IdPaciente
LEFT JOIN Servicio S ON A.IdServicio = S.IdServicio
LEFT JOIN Producto PR ON A.IdProducto = PR.IdProducto
LEFT JOIN Campana CP ON CP.IdCampana = P.IdCampana
GROUP BY CP.IdCampana
ORDER BY TotalGastado DESC;



/*Servicio más usado por cada día: qué servicio domina cada día.*/

SELECT 
    A.Fecha,
    S.NombreServicio,
    COUNT(*) AS Total

FROM Atencion A
INNER JOIN Servicio S ON A.IdServicio = S.IdServicio

GROUP BY A.Fecha, S.NombreServicio

HAVING COUNT(*) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT COUNT(*) AS Cantidad
        FROM Atencion A2
        WHERE A2.Fecha = A.Fecha
        AND A2.IdServicio IS NOT NULL
        GROUP BY A2.IdServicio
    ) AS T
);

/*Procedimiento: resumen general del negocio, KPIs principales del negocio*/
CREATE PROCEDURE SP_ResumenGeneral
AS
BEGIN
    SELECT 
        COUNT(DISTINCT P.IdPaciente) AS TotalPacientes,
        COUNT(A.IdAtencion) AS TotalAtenciones,
        SUM(ISNULL(S.PrecioDeServicio,0) + ISNULL(PR.PrecioDeProducto,0)) AS IngresosTotales

    FROM Paciente P
    LEFT JOIN Atencion A ON P.IdPaciente = A.IdPaciente
    LEFT JOIN Servicio S ON A.IdServicio = S.IdServicio
    LEFT JOIN Producto PR ON A.IdProducto = PR.IdProducto;
END;


EXEC SP_ResumenGeneral



/*Productos nunca vendidos, productos sin rotación (importante para inventario).*/
SELECT 
    P.NombreProducto
FROM Producto p
LEFT JOIN Atencion A 
    ON P.IdProducto = A.IdProducto
WHERE A.IdProducto IS NULL;


/*Días con baja actividad (menos de 2 atenciones), días flojos del negocio.*/
SELECT 
    Fecha,
    COUNT(*) AS Total
FROM Atencion
GROUP BY Fecha
HAVING COUNT(*) < 2;