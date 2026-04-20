# Fábrica de Maniquíes - Base de Datos

## Descripción del Proyecto
Este repositorio contiene el modelo físico e implementación técnica en SQL para una base de datos relacional de una fábrica de maniquíes. El sistema gestiona el catálogo de modelos, el inventario físico de piezas y las órdenes de ensamblaje.

## Estructura del Repositorio
Todos los scripts de bases de datos se encuentran dentro de la carpeta `/sentencias-sql`.

## Instrucciones de Ejecución
Para recrear esta base de datos localmente, los scripts deben ejecutarse estrictamente en el siguiente orden:

1. **`1_creates.sql`**: Crea la base de datos `fabrica_maniquies` y la estructura inicial de todas las tablas con sus respectivas Claves Primarias y Foráneas.
2. **`2_inserts.sql`**: Puebla la base de datos con información de prueba (modelos, catálogo, stock y órdenes).
3. **`3_modificaciones.sql`**: Contiene un `ALTER TABLE` y sentencias `UPDATE`. Este script demuestra la adaptabilidad del modelo, agregando la columna `fecha_fabricacion` necesaria para satisfacer los nuevos requisitos de negocio planteados en las consultas.
4. **`4_consultas.sql`**: Contiene las consultas de verificación solicitadas en el Trabajo Práctico.