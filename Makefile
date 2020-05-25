setup:
	python3 -m venv ~/.docker-flask-app
	
env:
	#Show information about environment
	which python3
	python3 --version
	which pytest
	which pylint
	
install:
	pip install --upgrade pip && \
	pip install -r requirements.txt
	
lint:
	pylint --load-plugins pylint_flask --disable=R,C flask_app/*.py nlib csvcli

lint-circleci:
	hadolint Dockerfile
	pylint --output-format=parseable --load-plugins pylint_flask --disable=R,C flask_app/*.py nlib csvcli > $$CIRCLE_ARTIFACTS/pylint.html  

test-circleci:
	@cd tests; python3 -m pytest -vv --cov-report html:$$CIRCLE_ARTIFACTS --cov=web --cov=nlib test_*.py  

test:
	@cd tests; pytest -vv --cov-report term-missing --cov=web --cov=nlib test_*.py
	#python3 -m pytest --nbval notebook.ipynb

start-api:
	#sets PYTHONPATH to directory above, would do differently in production
	cd flask_app && PYTHONPATH=".." python web.py
	

	
all: install test lint	