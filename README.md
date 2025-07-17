# [NOSQL (Not Only SQL)](https://jonmircha.com/nosql)

## Bases de llave-valor

### Redis

Redis es una base de datos en memoria, orientada a estructuras de datos clave-valor, que se utiliza como base de datos, caché y agente de mensajes. Es conocida por su alto rendimiento, flexibilidad y facilidad de uso.

Para acceder a su documentación oficial, puedes visitar: [Redis Documentation](https://redis.io/documentation).

Para el uso de redis en windows se está usando WSL. Con el siguiente comando accedemos a ubuntu:

```terminal
wsl -d ubuntu
```

Para instalar redis en WSL, puedes seguir los siguientes pasos:

```bash
sudo apt update
sudo apt install redis-server
```

Para iniciar el servidor de Redis, utiliza el siguiente comando:

```bash
redis-server
```

Los comandos de redis se pueden consultar en: https://redis.io/commands/

#### Upstash

Upstash es un servicio que ofrece bases de datos en la nube, incluyendo Redis. Permite crear bases de datos Redis sin necesidad de configurar un servidor propio, lo que facilita el uso y la escalabilidad.
Para crear una base de datos en Upstash, puedes visitar: [Upstash Redis](https://upstash.com/redis).

Ahora conectamos a nuestra database mediante redis-cli en la consola de upstash: https://console.upstash.com/redis/df02fa6e-f8b9-4c0b-bf70-870c643fb88e

Existe una página que explica los comandos de una manera más amigable: https://try.redis.io/

El archivo que tiene ejercicios CRUD es `Redis.sh`

## Bases orientadas a columnas

### Apache Cassandra

Haremos uso de datastax para usar su servicio de luna que está enfocado en cassandra: https://www.datastax.com/products/luna

Si bien la sintaxis es muy similar a SQL, en CQL hay algunas diferencias como `SHOW` que es `DESC` al igual que al crear DB, ya que aqui son nombradas como KEYSPACES

En el siguiente ejemplo al crear una tabla podemos asignar valores `UUID` en los indices primarios en lugar de `INT`. También podemos declarar multiples llaves primarias que nos permiten el filtrado y el uso de funciones. También indican una relación no obligatoria.

```CQL
CREATE TABLE user_posts (
  user_id UUID,
  post_id UUID,
  post_content TEXT,
  created_at TIMESTAMP,
  PRIMARY KEY (user_id, post_id)
);
```

Filtrado de datos de un campo que es `PRIMARY_KEY`

```CQL
SELECT
  *
FROM
  users
WHERE
  user_id = 0feda1aa-4e53-4242-b523-ae16567b2dbe;
```

Filtrado de datos de un campo que no es `PRIMARY_KEY`. Se debe agregar un `LIMIT` asi como `ALLOW FILTERING`, esto compromete la velocidad de la query al no ser una llave primaria.

```CQL
SELECT
  *
FROM
  users
WHERE
  username = 'john_doe'
LIMIT
  200 ALLOW FILTERING;
```

## Bases orientadas a grafos

### Neo4j
