--Consulta 1: Listado de stock (Piernas derechas)
--Traer numero de serie, material y color de todas las piernas derechas.

SELECT 
    P.id_pieza AS 'Número de Serie', 
    P.material AS 'Material', 
    P.color AS 'Color'
FROM Pieza P
JOIN Catalogo_Pieza Cat ON P.id_catalogo = Cat.id_catalogo
JOIN Categoria_Pieza C ON Cat.id_categoria = C.id_categoria
WHERE C.nombre_categoria = 'Pierna Derecha';

--Consulta 2: Cabezas por fechas
--Traer todas las cabezas fabricadas despues de fecha especifica (2026-01-01)

SELECT 
    P.id_pieza AS 'DNI de la Pieza',
    C.nombre_categoria AS 'Categoría',
    P.material AS 'Material',
    P.color AS 'Color',
    P.fecha_fabricacion AS 'Fecha de Fabricación'
FROM Pieza P
JOIN Catalogo_Pieza Cat ON P.id_catalogo = Cat.id_catalogo
JOIN Categoria_Pieza C ON Cat.id_categoria = C.id_categoria
WHERE C.nombre_categoria = 'Cabeza' 
  AND P.fecha_fabricacion > '2026-01-01';

--Consulta 3: Modelos por talla (adaptado linea de producto)
--Listar todos los torsos de la linea "Adulto" e "Infantil",
-- ordenados por material alfabeticamente

SELECT 
    P.id_pieza AS 'ID Pieza',
    M.nombre_modelo AS 'Modelo',
    M.linea_producto AS 'Línea',
    P.material AS 'Material'
FROM Pieza P
JOIN Catalogo_Pieza Cat ON P.id_catalogo = Cat.id_catalogo
JOIN Categoria_Pieza C ON Cat.id_categoria = C.id_categoria
JOIN Modelo M ON Cat.id_modelo = M.id_modelo
WHERE C.nombre_categoria = 'Torso' 
    AND M.linea_producto IN ('Adulto', 'Infantil')
ORDER BY P.material ASC;

--Consulta 4: Conteo de materiales
--Contar cuantas piezas totales hay agrupadas por material

SELECT 
    material AS 'Material', 
    COUNT(id_pieza) AS 'Total de Piezas'
FROM Pieza
GROUP BY material;

--Consulta 5: Consulta de ensamble
--Mostrar el codigo del maniqui, fecha de armado, 
--y el ID exacto de la cabeza que tiene puesta.

SELECT 
    Man.id_maniqui AS 'Código Maniquí',
    Man.fecha_ensamblaje AS 'Fecha de Ensamblaje',
    P.id_pieza AS 'ID Cabeza Asignada'
FROM Maniqui Man
JOIN Pieza P ON Man.id_maniqui = P.id_maniqui
JOIN Catalogo_Pieza Cat ON P.id_catalogo = Cat.id_catalogo
JOIN Categoria_Pieza C ON Cat.id_categoria = C.id_categoria
WHERE C.nombre_categoria = 'Cabeza'
  AND Man.estado_ensamblaje = 'Ensamblado';

--Consulta 6: Disponibilidad personalizada
--Buscar todas las piezas que sean de un color especifico (por ej., "Negro")
SELECT 
    P.id_pieza AS 'ID Pieza',
    C.nombre_categoria AS 'Categoría',
    P.material AS 'Material',
    P.color AS 'Color',
    P.estado_calidad AS 'Estado'
FROM Pieza P
JOIN Catalogo_Pieza Cat ON P.id_catalogo = Cat.id_catalogo
JOIN Categoria_Pieza C ON Cat.id_categoria = C.id_categoria
WHERE P.color = 'Negro';
