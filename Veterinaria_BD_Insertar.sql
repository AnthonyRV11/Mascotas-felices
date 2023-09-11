USE MASCOTAS_FELICES
GO

INSERT INTO CLIENTES (NOMBRE, APELLIDO1, APELLIDO2, CEDULA, TELEFONO, CORREO)
VALUES 
    ('Juan', 'Lopez', 'Garcia', '1234567890', '555-555-5555', 'juan.lopez@example.com'),
    ('Maria', 'Gomez', 'Rodriguez', '2345678901', '555-555-5556', 'maria.gomez@example.com'),
    ('Carlos', 'Martinez', 'Perez', '3456789012', '555-555-5557', 'carlos.martinez@example.com'),
    ('Laura', 'Sanchez', 'Lopez', '4567890123', '555-555-5558', 'laura.sanchez@example.com'),
    ('Pedro', 'Gonzalez', 'Torres', '5678901234', '555-555-5559', 'pedro.gonzalez@example.com');


INSERT INTO PROVEEDORES (NOMBRE, TELEFONO, CORREO) VALUES
    ('Fresh Farms Distributors', '555-555-5555', 'info@freshfarms.com'),
    ('Organic Harvest Foods', '555-555-5556', 'sales@organicharvest.com'),
    ('Gourmet Delights Suppliers', '555-555-5557', 'contact@gourmetdelights.com'),
    ('Farm-to-Table Produce Co.', '555-555-5558', 'info@farmtotable.com'),
    ('Healthy Bites Distributors', '555-555-5559', 'sales@healthybites.com');

INSERT INTO PRODUCTOS (NOMBRE, PRECIO_COMPRA, PRECIO_VENTA, CANTIDAD) VALUES
    ('Alimento para perros - Marca A', 15.99, 19.19, 100),
    ('Alimento para gatos - Marca B', 12.99, 15.59, 80),
    ('Juguete para perros - Marca C', 5.99, 7.19, 50),
    ('Collar para perros - Marca D', 8.99, 10.79, 40),
    ('Correa para perros - Marca E', 7.99, 9.59, 45),
    ('Castración - Servicio Veterinario', 50.00, 60.00, 2),
    ('Revisión veterinaria - Servicio Veterinario', 30.00, 36.00, 2),
    ('Ecografía veterinaria - Servicio Veterinario', 80.00, 96.00, 2),
    ('Dermatología veterinaria - Servicio Veterinario', 40.00, 48.00, 2),
    ('Plan alimenticio para mascotas - Marca F', 20.00, 24.00, 2),
    ('Cirugía veterinaria - Servicio Veterinario', 120.00, 144.00, 2),
    ('Hueso para perros - Marca G', 3.99, 4.79, 60),
    ('Cepillo para gatos - Marca H', 2.99, 3.59, 30),
    ('Pienso para aves - Marca I', 6.99, 8.39, 25),
    ('Cama para mascotas - Marca J', 19.99, 23.99, 20),
    ('Comedero automático - Marca K', 10.99, 13.19, 15),
    ('Piedra de acuario - Marca L', 4.99, 5.99, 35),
    ('Luz LED para acuario - Marca M', 12.99, 15.59, 10),
    ('Juguete para gatos - Marca N', 4.99, 5.99, 25);
	

