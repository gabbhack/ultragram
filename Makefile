# install only in venv, please.

TEST_PATH=./tests
SRC_PATH=./ultragram

install:
	pip install poetry
	poetry install
	pre-commit install

black:
	black $(SRC_PATH)

reorder-imports:
	reorder-python-imports --application-directories=$(SRC_PATH)

docs:
	mkdocs serve

docs-deploy:
	mkdocs gh-deploy

test:
	py.test --verbose --color=yes $(TEST_PATH)