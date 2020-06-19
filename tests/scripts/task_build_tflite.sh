#!/bin/bash
# Script to generate TFLite wheel.  Run from one directory above TFLite installation.

mkdir ~/tflite_configuration  && export PYTHON_MODULE_INSTALL_DIR=~/tflite_configuration
cd tflite \
&& python3.6 setup.py bdist_wheel \
&& cd dist && TVM_DIST=$(ls *.whl | head -1) \
&& python3.6 -m pip install --no-compile --no-deps --upgrade "$TVM_DIST" --prefix "$PYTHON_MODULE_INSTALL_DIR" \
&& cd ../..
