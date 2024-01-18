start:
	docker compose up -d --build
start-prod:
	docker compose -f docker-compose.prod.yml -d
stop:
	docker compose down
stop-prod:
	docker compose -f docker-compose.prod.yml down
restart:
	docker compose restart