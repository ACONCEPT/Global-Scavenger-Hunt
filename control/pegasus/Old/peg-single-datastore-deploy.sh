#!/bin/bash

# Copyright 2015 Insight Data Science
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Slightly edited by Steven Jin for Insight Project - Global Scavenger Hunt

# PURPOSE OF THIS SCRIPT
# call pegasus commands on the user-defined *.yml files to deploy instances

printf '\ndeploying single datastore instance\n'

BASEDIR=$(dirname "$0")

CLUSTER_NAME=datastore-single

peg validate ${BASEDIR}/single-datastore.yml

read -p "Are you sure to deploy the instance? Y/n" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
peg up ${BASEDIR}/single-datastore.yml &

wait

printf '\ncreated the instance. fetching data...\n'

peg fetch ${CLUSTER_NAME}

fi