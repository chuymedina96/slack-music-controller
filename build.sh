#!/bin/bash

pushd sam-app

# Pip is broken on the mac and -t does not work
# So we need to use this workaround
echo "[install]
prefix=" > ~/.pydistutils.cfg

# HeyDJ function
pushd heydj
mkdir -p build
cp *.py build
pip install -r requirements.txt -t ./build
popd

# Controller function
pushd controller
mkdir -p build
cp *.py build
pip install -r requirements.txt -t ./build
popd


# All done, return back to where we were
rm -f ~/.pydistutils.cfg
popd
