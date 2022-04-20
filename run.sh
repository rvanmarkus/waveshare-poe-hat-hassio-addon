#!/usr/bin/with-contenv bashio

echo "Starting POE_HAT application..."
PYTHON=`which python3 |head -n1`
${PYTHON} /.poe-hat/examples/main.py