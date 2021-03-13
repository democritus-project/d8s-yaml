#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_yaml/ tests/

black democritus_yaml/ tests/

mypy democritus_yaml/ tests/

pylint --fail-under 9 democritus_yaml/*.py

flake8 democritus_yaml/ tests/

bandit -r democritus_yaml/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_yaml/ tests/
