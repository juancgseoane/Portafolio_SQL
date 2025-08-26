-- Desafío - Consultas en Múltiples Tablas

-- 1.- Crea y agrega al entregable las consultas para completar el setup de acuerdo a lo pedido

-- Creamos la tabla usuarios


CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    rol VARCHAR(20)
);

INSERT INTO usuarios (email, nombre, apellido, rol) VALUES
('martin.espinoza@mail.com', 'Martín', 'Espinoza', 'administrador'),
('natalia.diaz@mail.com', 'Natalia', 'Díaz', 'usuario'),
('mateo.fuentes@mail.com', 'Mateo', 'Fuentes', 'usuario'),
('benjamin.castro@mail.com', 'Benjamín', 'Castro', 'usuario'),
('camila.vera@mail.com', 'Camila', 'Vera', 'administrador')
;

-- Creamos la tabla post


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    contenido TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    destacado BOOLEAN,
    usuario_id BIGINT REFERENCES usuarios(id)
);

INSERT INTO posts (titulo, contenido, destacado, usuario_id) VALUES

('Los mejores juegos de mundo abierto', 'Un recorrido por títulos como Zelda, GTA V y No Man’s Sky.', true, 1),
('Cómo armar tu primera base en No Man’s Sky', 'Tips para construir en planetas seguros y aprovechar los recursos.', false, 5),
('Errores comunes al empezar en Dark Souls', 'Rodar tarde, gastar almas y pelear sin escudo. Todos lo hicimos.', false, 2),
('¿Vale la pena suscribirse a Game Pass?', 'Una revisión honesta de los juegos, el precio y la experiencia.', true, 3),
('Post sin autor', 'Tal vez algún día sabremos quién lo escribió...', false, NULL);


-- Creamos la tabla comentarios

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    contenido TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id BIGINT REFERENCES usuarios(id),
    post_id BIGINT REFERENCES posts(id)
);

INSERT INTO comentarios (contenido, usuario_id, post_id) VALUES
('Buen análisis, me gustó el enfoque.', 1, 1),
('Gracias por las recomendaciones, me sirven.', 2, 1),
('¡Zelda es una joya! Totalmente de acuerdo.', 3, 1),
('Justo estoy empezando a construir mi base, me sirvió.', 1, 2),
('Buen dato sobre los recursos, gracias!', 2, 2);


-- 2.- Cruza los datos de la tabla usuarios y posts, mostrando las siguientes columnas: nombre y email del usuario junto al título y contenido del post

SELECT 
    usuarios.nombre,
    usuarios.email,
    posts.titulo,
    posts.contenido
FROM posts
LEFT JOIN usuarios ON posts.usuario_id = usuarios.id;

-- 3.- Muestra el id, título y contenido de los posts de los administradores (El administrador puede ser cualquier id)

SELECT 
    posts.id,
    posts.titulo,
    posts.contenido
FROM posts
JOIN usuarios ON posts.usuario_id = usuarios.id
WHERE usuarios.rol = 'administrador';

-- 4.- Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario.

SELECT 
    usuarios.id,
    usuarios.email,
    COUNT(posts.id) AS cantidad_posts
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
GROUP BY usuarios.id, usuarios.email;

-- 5.- Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email

SELECT 
    usuarios.email
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
GROUP BY usuarios.id, usuarios.email
ORDER BY COUNT(posts.id) DESC
LIMIT 1;


-- 6.- Muestra la fecha del último post de cada usuario

SELECT 
    usuarios.id,
    usuarios.email,
    MAX(posts.fecha_creacion) AS fecha_ultimo_post
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
GROUP BY usuarios.id, usuarios.email;


-- 7.- Muestra el título y contenido del post (artículo) con más comentarios

SELECT 
    p.titulo AS titulo_post, 
    p.contenido AS contenido_post
FROM posts p
JOIN comentarios c ON p.id = c.post_id
GROUP BY p.id, p.titulo, p.contenido
ORDER BY COUNT(c.id) DESC
LIMIT 1;

-- 8.- Muestra en una tabla el título de cada post, el contenido de cada post y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió

SELECT 
    p.titulo AS titulo_post,
    p.contenido AS contenido_post,
    c.contenido AS contenido_comentario,
    u.email AS email_usuario
FROM posts p
JOIN comentarios c ON p.id = c.post_id
JOIN usuarios u ON c.usuario_id = u.id
ORDER BY p.id, c.id;

-- 9.- Muestra el contenido del último comentario de cada usuario


SELECT DISTINCT ON (c.usuario_id)
    u.email AS email_usuario,
    c.contenido AS contenido_comentario,
    c.fecha_creacion
FROM comentarios c
JOIN usuarios u ON c.usuario_id = u.id
ORDER BY c.usuario_id, c.fecha_creacion DESC;

-- 10.- Muestra los emails de los usuarios que no han escrito ningún comentario

SELECT 
    u.email AS email_usuario
FROM usuarios AS u
LEFT JOIN comentarios AS c ON u.id = c.usuario_id
WHERE c.id IS NULL;


