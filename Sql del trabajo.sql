CREATE DATABASE DBHamburgueseria;
GO

USE DBHamburgueseria;
GO

-- Tabla CategoriaProducto
CREATE TABLE CategoriaProducto (
    idCategoria INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(150) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES CategoriaProducto(idCategoria)
);

-- Tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    nombreCompleto NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(15),
    correo NVARCHAR(150) NOT NULL UNIQUE,
    contrasena NVARCHAR(200) NOT NULL,
);

-- Tabla Administrador
CREATE TABLE Administrador (
    idAdministrador INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(150) NOT NULL UNIQUE,
    contrasena NVARCHAR(200) NOT NULL
);

-- Tabla Venta
CREATE TABLE Venta (
    idVenta INT PRIMARY KEY IDENTITY(1,1),
    idUsuario INT,
    fechaVenta DATETIME DEFAULT GETDATE(),
    total DECIMAL(10, 2),
    estado NVARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

INSERT INTO Usuario (nombreCompleto, telefono, correo, contrasena) 
VALUES ('Gonzalo Meza', '1234567890', 'gonzalo@gmail.com', '123')

INSERT INTO Administrador (nombre, correo, contrasena)
VALUES 
('Gonzalo Meza', 'empleado1@burger.com', 'contra23')

INSERT INTO CategoriaProducto (nombre)
VALUES 
('Hamburguesas'),
('Bebidas')

INSERT INTO Producto (nombre, descripcion, precio, stock, idCategoria) VALUES 
('Hamburguesa de carne', 'Deliciosa hamburguesa de carne fresca', 10.00, 50, 1),
('Hamburguesa Criolla con Salsa Huancaina', 'Hamburguesa criolla con salsa huancaina', 12.00, 50, 1),
('Hamburguesa Rellena de Pollo a la Brasa', 'Hamburguesa rellena con pollo a la brasa', 11.00, 50, 1),
('Hamburguesa de Lomo Saltado', 'Hamburguesa inspirada en el lomo saltado peruano', 13.00, 50, 1),
('Hamburguesa de Pollo y Ají de Gallina', 'Hamburguesa de pollo con ají de gallina', 14.00, 50, 1),
('Hamburguesa Vegana', 'Hamburguesa vegana saludable y deliciosa', 12.50, 50, 1);


INSERT INTO Producto (nombre, descripcion, precio, stock, idCategoria) VALUES 
('Inca Cola', 'Refresco peruano de sabor único y refrescante', 10.00, 50, 2),
('Coca Cola', 'El clásico refresco de cola que nunca pasa de moda', 11.00, 50, 2),
('Big Cola', 'Refresco de cola con un sabor intenso y burbujeante', 12.00, 50, 2),
('7 UP', 'Refresco de limón con un toque de frescura', 10.00, 50, 2),
('Pepsi', 'Refresco de cola con un sabor distintivo y refrescante', 9.00, 50, 2),
('Oro', 'Refresco de sabor a naranja con burbujas refrescantes', 12.00, 50, 2);


INSERT INTO Venta (idUsuario, fechaVenta, total, estado) VALUES 
(1, '2024-12-11 19:00:00', 10.00, 'Pendiente'),
(1, '2024-12-11 19:15:00', 12.00, 'Pendiente'),
(1, '2024-12-11 19:30:00', 11.00, 'Pendiente'),
(1, '2024-12-11 19:45:00', 13.00, 'Pendiente'),
(1, '2024-12-11 19:50:00', 14.00, 'Pendiente'),
(1, '2024-12-11 19:55:00', 12.50, 'Pendiente');


   