#!/bin/bash

if [ ! -f adventureworks.bak ]; then
    echo "Downloading AdventureWorks backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak -O adventureworks.bak -q
    echo "Download complete."
else
    echo "Backup file already downloaded. Skipping."
fi
echo "Building docker image."
docker build . -t chriseaton/adventureworks:latest
docker tag chriseaton/adventureworks:latest chriseaton/adventureworks:2019-latest