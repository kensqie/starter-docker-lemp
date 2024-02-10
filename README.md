# Starter, LEMP in Docker

LEMP stack starter kit

## Technologies

- Docker
- Nginx
- PHP
- MariaDB
- phpMyAdmin

## Usage

### Set variables in `.env`

```bash
cp .env.example .env
```

```ini
PROJECT=starter
DB_DATABASE=${PROJECT}
DB_USERNAME=user
DB_PASSWORD=0112
DB_ROOT_PASSWORD=011235
```

### Build `app` service

```bash
docker compose build app
```

### Up all services

```bash
docker compose up
```

### Check pages

- `127.0.0.1:9000` — index.php from `app`
- `127.0.0.1:9001` — phpMyAdmin

### Open bash in app container

```bash
docker exec -it <APP_CONTAINER_NAME> bash
```

### Save data from db

If you don't want to lose data from the database, then uncomment this line in the `docker-compose.yml` file

```yml
./data/mariadb:/var/lib/mysql
```
