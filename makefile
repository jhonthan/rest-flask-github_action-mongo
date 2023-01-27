APP = restapi

test:
	@flake8 . --exclude .venv
	@pytest -v --disable-warnings

compose:
	@docker-compose build
	@docker-compose up

heroku:
	@heroku container:push -a comunidade-app-restapi web
	@heroku container:release -a comunidade-app-restapi web
	@heroku ps:scale -a comunidade-app-restapi web