
/* crear base de dato */
CREATE DATABASE bookmark_manager;


/* Creando una tabla */
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

/* create a new column in the table bookmarks*/
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);





/*seleccionar todo los datos de las tablas*/
SELECT * FROM bookmarks;
/*limitar el numero de registros  a los dos principales*/
SELECT * FROM bookmarks LIMIT 2;
/*consulta con algo especifico de datos*/
SELECT * FROM bookmarks WHERE url = 'http://www.makersacademy.com';


/* Introducir valores a las tablas*/
INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');
INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com');
INSERT INTO bookmarks (url) VALUES ('http://www.twitter.com');
INSERT INTO bookmarks (url) VALUES ('http://www.google.com');

/* Eliminando valores en la tabla*/
DELETE FROM bookmarks WHERE url = 'http://www.twitter.com';

/* Actualizando datos de la tabla*/
UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' WHERE url = 'http://www.askjeeves.com';

/*creando other table for the relation many of one */

CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));

/* create other table for the relation many of many*/
CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));
CREATE TABLE bookmarks_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));
  
  /* create other table where guarda la informacion de los usuarios*/

  CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
