USE MASCOTAS_FELICES
GO
--******************************************************************************************************
--CREAMOS TODOS LOS PROCEDIMIENTOS ALMACENADOS

--CLIENTES
--Procedimiento almacenado para poder insertar un cliente
CREATE OR ALTER PROCEDURE InsertarActualizarCliente(
    @ID_CLIENTE INT,
    @Nombre VARCHAR(20),
    @Apellido1 VARCHAR(20),
    @Apellido2 VARCHAR(20),
    @Cedula VARCHAR(20),
    @Telefono VARCHAR(20),
    @Correo VARCHAR(50),
    @Mensaje VARCHAR(100) OUTPUT
)
AS
BEGIN
    IF @ID_CLIENTE > 0
    BEGIN
        -- Actualizar cliente si el ID_CLIENTE es mayor que 0
        IF @Cedula = (SELECT CEDULA FROM CLIENTES WHERE ID_CLIENTE = @ID_CLIENTE)
        BEGIN
            UPDATE CLIENTES
            SET NOMBRE = @Nombre,
                APELLIDO1 = @Apellido1,
                APELLIDO2 = @Apellido2,
                TELEFONO = @Telefono,
                CORREO = @Correo
            WHERE ID_CLIENTE = @ID_CLIENTE;

            SET @Mensaje = 'Cliente actualizado correctamente!';
            RETURN 1;
        END
        ELSE
        BEGIN
            SET @Mensaje = 'No puedes cambiar la cédula del cliente!';
            RETURN 0;
        END
    END
    ELSE
    BEGIN
        -- Insertar nuevo cliente si el ID_CLIENTE es 0
        IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE CEDULA = @Cedula)
        BEGIN
            INSERT INTO CLIENTES (NOMBRE, APELLIDO1, APELLIDO2, CEDULA, TELEFONO, CORREO)
            VALUES (@Nombre, @Apellido1, @Apellido2, @Cedula, @Telefono, @Correo);

            SET @Mensaje = 'Cliente insertado correctamente!';
            RETURN 1;
        END
        ELSE
        BEGIN
            SET @Mensaje = 'La cédula ya existe en la base de datos, prueba con otra!';
            RETURN 0;
        END
    END
END;
GO

--Procedimiento almacenado para poder eliminar un cliente
CREATE PROCEDURE EliminarCliente(
    @ID_CLIENTE INT,
    @Mensaje VARCHAR(100) OUTPUT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM FACTURA_VENTA WHERE ID_CLIENTE = @ID_CLIENTE)
    BEGIN
        DELETE FROM CLIENTES
        WHERE ID_CLIENTE = @ID_CLIENTE;

        SET @Mensaje = 'Cliente eliminado correctamente.';
        RETURN 1;
    END
    ELSE
    BEGIN
        SET @Mensaje = 'No se puede eliminar el cliente porque tiene facturas asociadas.';
        RETURN 0;
    END
END;
GO
--******************************************************************************************************
--PROVEDORES
--Procedimiento almacenado para poder insertar un provedor
CREATE OR ALTER PROCEDURE InsertarActualizarProveedor(
    @ID_PROVEEDOR INT,
    @Nombre VARCHAR(20),
    @Telefono VARCHAR(20),
    @Correo VARCHAR(50),
    @Mensaje VARCHAR(100) OUTPUT
)
AS
BEGIN
    IF @ID_PROVEEDOR > 0
    BEGIN
        -- Actualizar proveedor si el ID_PROVEEDOR es mayor que 0
        IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE TELEFONO = @Telefono AND ID_PROVEEDOR != @ID_PROVEEDOR)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE NOMBRE = @Nombre AND ID_PROVEEDOR != @ID_PROVEEDOR)
            BEGIN
                UPDATE PROVEEDORES
                SET NOMBRE = @Nombre,
                    TELEFONO = @Telefono,
                    CORREO = @Correo
                WHERE ID_PROVEEDOR = @ID_PROVEEDOR;

                SET @Mensaje = 'Proveedor actualizado correctamente!';
                RETURN 1;
            END
            ELSE
            BEGIN
                SET @Mensaje = 'Ya existe un proveedor con el mismo nombre, prueba con otro.';
                RETURN 0;
            END
        END
        ELSE
        BEGIN
            SET @Mensaje = 'Ya existe un proveedor con el mismo teléfono, prueba con otro.';
            RETURN 0;
        END
    END
    ELSE
    BEGIN
        -- Insertar nuevo proveedor si el ID_PROVEEDOR es 0
        IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE CORREO = @Correo)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE NOMBRE = @Nombre)
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE TELEFONO = @Telefono)
                BEGIN
                    INSERT INTO PROVEEDORES (NOMBRE, TELEFONO, CORREO)
                    VALUES (@Nombre, @Telefono, @Correo);

                    SET @Mensaje = 'Proveedor insertado correctamente!';
                    RETURN 1;
                END
                ELSE
                BEGIN
                    SET @Mensaje = 'Ya existe un proveedor con el mismo teléfono, prueba con otro.';
                    RETURN 0;
                END
            END
            ELSE
            BEGIN
                SET @Mensaje = 'Ya existe un proveedor con el mismo nombre, prueba con otro.';
                RETURN 0;
            END
        END
        ELSE
        BEGIN
            SET @Mensaje = 'El correo del proveedor ya existe en la base de datos, prueba con otro.';
            RETURN 0;
        END
    END
END;
GO

--Procedimiento almacenado para poder eliminar un provedor
CREATE PROCEDURE EliminarProveedor
    @id INT,
    @Mensaje VARCHAR(100) OUTPUT
AS
BEGIN
    -- Verificar si hay facturas de compra relacionadas con el proveedor
    IF NOT EXISTS (SELECT 1 FROM FACTURA_COMPRA WHERE ID_PROVEEDOR = @id)
    BEGIN
        -- No hay facturas de compra, eliminar el proveedor
        DELETE FROM PROVEEDORES
        WHERE ID_PROVEEDOR = @id;

        SET @Mensaje = 'Proveedor eliminado correctamente!';
        RETURN 1;
    END
    ELSE
    BEGIN
        -- Hay facturas de compra, no se puede eliminar el proveedor
        SET @Mensaje = 'No se puede eliminar el proveedor ya que tiene facturas de compra asociadas, elimina la factura y vuelve!';
        RETURN 0;
    END
END;
GO

--******************************************************************************************************
--FACTURA_COMPRA
--Procedimiento almacenado para crear factura
CREATE OR ALTER PROCEDURE CrearFacturaCompra
    @ID_PROVEEDOR INT,
	@NuevaFacturaID INT OUTPUT
AS
BEGIN
    --DECLARE @NuevaFacturaID INT; -- Declarar la variable para el ID generado
    DECLARE @TOTAL_PAGO DECIMAL(10, 2);
    
    INSERT INTO FACTURA_COMPRA (ID_PROVEEDOR)
    VALUES (@ID_PROVEEDOR);
    
    -- Obtener el ID generado para la factura recién insertada
    SET @NuevaFacturaID = SCOPE_IDENTITY();
    
    RETURN 1
END;
GO

--******************************************************************************************************
--DETALLE_FACTURA_COMPRA
--Procedimiento almacenado para ingresar un detalle de factura y se sume el total de cantidad que tiene mas el que se ingreso
CREATE OR ALTER PROCEDURE InsertarDetalleFacturaCompra
    @ID_FACTURA INT,
    @ID_PRODUCTO INT,
    @CANTIDAD_PRODUCTO INT
AS
BEGIN
    -- Actualizar el detalle de factura
    INSERT INTO DETALLE_FACTURA_COMPRA (ID_FACTURA, ID_PRODUCTO, CANTIDAD_PRODUCTO)
    VALUES (@ID_FACTURA, @ID_PRODUCTO, @CANTIDAD_PRODUCTO);

    -- Actualizar el TOTAL_PAGO en FACTURA_COMPRA
    UPDATE FACTURA_COMPRA
    SET TOTAL_PAGO = (SELECT ISNULL(SUM(P.PRECIO_COMPRA * DF.CANTIDAD_PRODUCTO), 0) FROM DETALLE_FACTURA_COMPRA DF INNER JOIN PRODUCTOS P ON DF.ID_PRODUCTO = P.ID_PRODUCTO WHERE DF.ID_FACTURA = @ID_FACTURA)
    WHERE ID_FACTURA = @ID_FACTURA;

    -- Actualizar la cantidad en PRODUCTOS
    UPDATE PRODUCTOS
    SET CANTIDAD = CANTIDAD + @CANTIDAD_PRODUCTO
    WHERE ID_PRODUCTO = @ID_PRODUCTO;
END;
GO

--Procedimiento almacenado para eliminar un detalle de factura y se reste del total a pagar en la factura y se actualice el total del producto
CREATE OR ALTER PROCEDURE EliminarDetalleFacturaCompra
    @ID_DETALLE INT
AS
BEGIN
    DECLARE @ID_FACTURA INT;
    DECLARE @ID_PRODUCTO INT;
    DECLARE @CANTIDAD_PRODUCTO INT;

    -- Obtener la información del detalle a eliminar
    SELECT @ID_FACTURA = ID_FACTURA,
           @ID_PRODUCTO = ID_PRODUCTO,
           @CANTIDAD_PRODUCTO = CANTIDAD_PRODUCTO
    FROM DETALLE_FACTURA_COMPRA
    WHERE ID_DETALLE_FACTURA_COMPRA = @ID_DETALLE;

    -- Eliminar el detalle de factura
    DELETE FROM DETALLE_FACTURA_COMPRA
    WHERE ID_DETALLE_FACTURA_COMPRA = @ID_DETALLE;

    -- Actualizar el TOTAL_PAGO en FACTURA_COMPRA
    UPDATE FACTURA_COMPRA
    SET TOTAL_PAGO = (SELECT ISNULL(SUM(P.PRECIO_COMPRA * DF.CANTIDAD_PRODUCTO), 0)
                      FROM DETALLE_FACTURA_COMPRA DF
                      INNER JOIN PRODUCTOS P ON DF.ID_PRODUCTO = P.ID_PRODUCTO
                      WHERE DF.ID_FACTURA = @ID_FACTURA)
    WHERE ID_FACTURA = @ID_FACTURA;

    -- Sumar la cantidad en PRODUCTOS
    UPDATE PRODUCTOS
    SET CANTIDAD = CANTIDAD - @CANTIDAD_PRODUCTO
    WHERE ID_PRODUCTO = @ID_PRODUCTO;
END;
GO

--******************************************************************************************************
--FACTURA_VENTA
--Agregar factura de venta nueva
CREATE OR ALTER PROCEDURE CrearFacturaVenta
    @ID_CLIENTE INT,
    @NuevaFacturaID INT OUTPUT
AS
BEGIN
    --DECLARE @NuevaFacturaID INT; -- Declarar la variable para el ID generado
    DECLARE @TOTAL_PAGO DECIMAL(10, 2) = 0.0; -- Inicializar el total de pago
    
    INSERT INTO FACTURA_VENTA (ID_CLIENTE, TOTAL_PAGO)
    VALUES (@ID_CLIENTE, @TOTAL_PAGO);
    
    -- Obtener el ID generado para la factura recién insertada
    SET @NuevaFacturaID = SCOPE_IDENTITY();
    
    RETURN 1;
END;
GO
--******************************************************************************************************
--DETALLE_FACTURA_VENTA
--Agregar detalle factura de venta nueva
CREATE OR ALTER PROCEDURE InsertarDetalleFacturaVenta
    @ID_FACTURA INT,
    @ID_PRODUCTO INT,
    @CANTIDAD_PRODUCTO INT
AS
BEGIN
    DECLARE @PRECIO_PRODUCTO DECIMAL(10, 2);
    
    -- Obtener el precio del producto
    SELECT @PRECIO_PRODUCTO = PRECIO_VENTA
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = @ID_PRODUCTO;

    -- Validar existencia suficiente
    DECLARE @EXISTENCIA_ACTUAL INT;
    SELECT @EXISTENCIA_ACTUAL = CANTIDAD
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = @ID_PRODUCTO;

    IF @CANTIDAD_PRODUCTO <= @EXISTENCIA_ACTUAL
    BEGIN
        -- Insertar en DETALLE_FACTURA_VENTA
        INSERT INTO DETALLE_FACTURA_VENTA (ID_FACTURA, ID_PRODUCTO, CANTIDAD_PRODUCTO)
        VALUES (@ID_FACTURA, @ID_PRODUCTO, @CANTIDAD_PRODUCTO);

        -- Actualizar el TOTAL_PAGO en FACTURA_VENTA
        UPDATE FACTURA_VENTA
        SET TOTAL_PAGO = TOTAL_PAGO + (@PRECIO_PRODUCTO * @CANTIDAD_PRODUCTO)
        WHERE ID_FACTURA = @ID_FACTURA;

        -- Actualizar la cantidad en PRODUCTOS
        UPDATE PRODUCTOS
        SET CANTIDAD = CANTIDAD - @CANTIDAD_PRODUCTO
        WHERE ID_PRODUCTO = @ID_PRODUCTO;

  
    END
       
END;
GO

--Eliminar detalle factura de venta nueva
CREATE OR ALTER PROCEDURE EliminarDetalleFacturaVenta
    @ID_DETALLE INT
AS
BEGIN
    DECLARE @ID_FACTURA INT;
    DECLARE @ID_PRODUCTO INT;
    DECLARE @CANTIDAD_PRODUCTO INT;

    -- Obtener la información del detalle a eliminar
    SELECT @ID_FACTURA = ID_FACTURA,
           @ID_PRODUCTO = ID_PRODUCTO,
           @CANTIDAD_PRODUCTO = CANTIDAD_PRODUCTO
    FROM DETALLE_FACTURA_VENTA
    WHERE ID_DETALLE_FACTURA_VENTA = @ID_DETALLE;

    -- Eliminar el detalle de factura
    DELETE FROM DETALLE_FACTURA_VENTA
    WHERE ID_DETALLE_FACTURA_VENTA = @ID_DETALLE;

    UPDATE FACTURA_VENTA
    SET TOTAL_PAGO = (SELECT ISNULL(SUM(P.PRECIO_VENTA * DF.CANTIDAD_PRODUCTO), 0)
                      FROM DETALLE_FACTURA_VENTA DF
                      INNER JOIN PRODUCTOS P ON DF.ID_PRODUCTO = P.ID_PRODUCTO
                      WHERE DF.ID_FACTURA = @ID_FACTURA)
    WHERE ID_FACTURA = @ID_FACTURA;

    -- Sumar la cantidad en PRODUCTOS
    UPDATE PRODUCTOS
    SET CANTIDAD = CANTIDAD + @CANTIDAD_PRODUCTO
    WHERE ID_PRODUCTO = @ID_PRODUCTO;
END;
GO





