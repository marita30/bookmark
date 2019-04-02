
/* crear base de dato */
CREATE DATABASE bookmark_manager;

/* Creando una tabla */
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

/*seleccionar todo los datos de las tablas*/
SELECT * FROM bookmarks;

/* Introducir valores a las tablas*/

INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');