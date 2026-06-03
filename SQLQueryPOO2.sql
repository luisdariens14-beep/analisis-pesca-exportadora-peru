CREATE DATABASE OasisDB;

CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('JEFE DE CONTABILIDAD', 'PERSONAL DE COBRANZA')),
    activo BIT DEFAULT 1,
    fecha_creacion DATETIME DEFAULT GETDATE()
);

CREATE TABLE clientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ruc VARCHAR(11) UNIQUE NOT NULL,
    razon_social NVARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    mensualidad DECIMAL(10,2) NOT NULL,
    activo BIT DEFAULT 1,
    fecha_registro DATETIME DEFAULT GETDATE()
);

CREATE TABLE recibos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    numero_recibo VARCHAR(20) UNIQUE NOT NULL,
    fecha_emision DATETIME DEFAULT GETDATE(),
    total DECIMAL(10,2) NOT NULL,
    cliente_id INT FOREIGN KEY REFERENCES clientes(id),
    activo BIT DEFAULT 1
);

CREATE TABLE conceptos_pago (
    id INT IDENTITY(1,1) PRIMARY KEY,
    descripcion NVARCHAR(500) NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL CHECK (metodo_pago IN ('EFECTIVO', 'TRANSFERENCIA', 'YAPE', 'PLIN')),
    fecha DATETIME DEFAULT GETDATE(),
    monto DECIMAL(10,2) NOT NULL,
    recibo_id INT FOREIGN KEY REFERENCES recibos(id), 
    activo BIT DEFAULT 1
);

