# user es el nombre del hash (colección) seguido de : y su id, después sigue el objeto almacenar
HSET user:1 name "John Doe" age 30 location "New York"
HSET user:2 name "Jane Smith" age 25 location "London"

# Método para agregar valores al principio del objeto, también existe RPUSH, si la lista no existe, entonces, crea una antes de ejecutar la operación
LPUSH user:1:posts 1001
LPUSH user:1:posts 1002
LPUSH user:2:posts 2001

HSET post:1001 content "¡Hola a todos!" created_at "2023-05-10 10:00:00" likes 10
HSET post:1002 content "Feliz cumpleaños a mí" created_at "2023-05-09 15:30:00" likes 20
HSET post:2001 content "¡Gran día en la playa!" created_at "2023-05-08 12:45:00" likes 15



HSET user:3 name "Sarah Johnson" age 35 location "San Francisco"

# Es como un SELECT * FROM Objeto
HGETALL user:1
# Esto devuelve el valor de una llave en especifico
HGET user:1 name

# Actualizamos el valor de la llave age
HSET user:2 age 26
# Eliminamos el objeto dado el hash
DEL user:3

# Agregamos un nuevo post al usuario 1
LPUSH user:1:posts 1003
# Agregamos un nuevo post al usuario 2
HSET post:1003 content "un comentartio más" created_at "2023-05-09 15:30:00" likes 15

# Obtenemos el contenido del post 1001
HGETALL post:1001

# Agregamos 30 like al post 1002
HSET post:1002 likes 30
DEL post:1003