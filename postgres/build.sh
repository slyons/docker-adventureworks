#!/bin/bash

echo "Building postgres docker image."
docker build . -t chriseaton/adventureworks:postgres