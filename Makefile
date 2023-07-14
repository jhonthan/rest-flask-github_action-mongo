APP = restapi-flask

test:
	@bandit -r . -x '/.venv','/tests'
	@black .
	@flake8 . --exclude .venv
	@pytest -v --disable-warnings

compose:
	@docker-compose build
	@docker-compose up

setup-dev:
	@kind create cluster --config kubernetes/config/config.yaml
	@kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	@kubectl wait --namespace ingress-nginx \
		--for=condition=read pod \
		--selector=app.kubernetes.io/component=controller \
		--timeout=270s
	@helm upgrade --install \
		--set auth.rootPassword="root" \
		--set image.tag=5.0.8 \
		mongodb kubernetes/charts/mongodb
	@kubectl wait \
		--for=condition=ready pod \
		--selector=app.kubernetes.io/component=mongodb \
		--timeout=270s
	@kubectl expose deploy restapi-flask \
		--port 5000 \
		--target-port 5000 \
		--dry-run -oyaml | kubectl neat > 30-service.yaml

deploy-dev:
	@docker build -t $(APP):latest .
	@kind load docker-image $(APP):latest
	@kubectl apply -f kubernetes/manifests
	@kubectl rollout restart deploy restapi-flask

dev: setup-dev deploy-dev

teardown-dev:
	@kind delete clusters kind

heroku:
	@heroku container:login
	@heroku container:push -a $(APP) web
	@heroku container:release -a $(APP) web