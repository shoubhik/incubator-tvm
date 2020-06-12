#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
cd $1 && cmake .. && make $2 && cd ..

mkdir /workspace/configuration  && export PYTHON_MODULE_INSTALL_DIR=/workspace/configuration
cd /workspace/python \
&& python3.6 setup.py bdist_wheel \
&& cd dist && TVM_DIST=$(ls *.whl | head -1) \
&& python3.6 -m pip install --no-compile --no-deps --upgrade "$TVM_DIST" --prefix "$PYTHON_MODULE_INSTALL_DIR" \
&& cd ../..

cd /workspace/topi/python \
&& python3.6 setup.py bdist_wheel \
&& cd dist && TOPI_DIST=$(ls *.whl | head -1) \
&& python3.6 -m pip install --no-compile --no-deps --upgrade "$TOPI_DIST" --prefix "$PYTHON_MODULE_INSTALL_DIR"
