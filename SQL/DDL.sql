-- BLOQUE 1: SENTENCIAS DDL (CREATE, ALTER, DROP)

-- 1. Creación de una Tabla Base con Atributos y Restricciones
-- MySQL requiere definir el tipo de dato y la admisión de nulos (NOT NULL).
-- Un valor nulo representa un dato desconocido, no un cero o un espacio en blanco.
CREATE TABLE empleado (
    num_emp INTEGER NOT NULL,
    nombre CHAR(20) NOT NULL,
    apellidos CHAR(30) NOT NULL,
    numero_seguro_soc CHAR(11),
    -- CONSTRAINT define el nombre de la llave primaria para control del sistema
    CONSTRAINT pk_num_emp PRIMARY KEY (num_emp)
);

-- 2. Creación de Tabla Relacionada (Llaves Foráneas)
CREATE TABLE factura (
    num_factura INTEGER NOT NULL,
    num_cliente INTEGER NOT NULL,
    fecha_factura DATE,
    CONSTRAINT pk_num_factura PRIMARY KEY (num_factura)
);

-- 3. Alteración de Tablas (ALTER TABLE)
-- Proceso para modificar la estructura física sin destruir la tabla.
-- Agregar una nueva columna a una tabla existente:
ALTER TABLE factura ADD num_emp INTEGER;

-- Modificar la definición completa de una columna (Cambia a NOT NULL):
ALTER TABLE factura MODIFY num_cliente INTEGER NOT NULL;

-- Eliminar una columna permanentemente de la estructura:
ALTER TABLE factura DROP COLUMN fecha_factura;

-- Agregar una Llave Foránea (FK) para conectar con la tabla empleado:
-- ON UPDATE CASCADE: Si la PK cambia, el cambio se propaga automáticamente.
-- ON DELETE RESTRICT: Impide borrar el empleado si tiene facturas asociadas.
ALTER TABLE factura 
ADD CONSTRAINT fk_empleado 
FOREIGN KEY (num_emp) 
REFERENCES empleado(num_emp)
ON DELETE RESTRICT 
ON UPDATE CASCADE;