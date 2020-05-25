setup:
	
	python3 -m venv ~/.docker-flask-app
	
install:
	
	pip install --upgrade pip && \
	pip install -r requirements.txt
	
test:

	python3 -m pytest -vv --cov=myrepolib tests/*.py
	#python3 -m pytest --nbval notebook.ipynb

lint:

	pylint --disable=R,C app.py flask_app/web.py
	
all: install test lint	