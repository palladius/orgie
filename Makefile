

# https://docs.docker.com/samples/rails/
docker-compose-up:
	docker-compose run --no-deps web rails new . --force --database=postgresql

docker-build:
	docker build -t ro7-orgie-makefile .

docker-run:
	docker run -it -p 8080:8080 ro7-orgie-makefile

docker-run-bash:
	docker run -it -p 8080:8080 ro7-orgie-makefile bash


install-on-mac:
	brew install sqlite3