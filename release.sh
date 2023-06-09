#!/usr/bin/env zsh

python3 -m twine --version 1>/dev/null 2>&1 || python3 -m pip install twine
python3 -m wheel version 1>/dev/null 2>&1 || python3 -m pip install wheel

echo -n 'Did you increment the version number (y/n)? '
read -q
echo

if [[ "$REPLY" == 'y' ]]; then
  rm -rf dist &&
    python3 setup.py sdist bdist_wheel &&
    twine upload dist/*
else
  echo 'Update the version number first'
  echo "Checking setup.py for version number"
  echo "|- $(cat setup.py | grep version)"
fi
