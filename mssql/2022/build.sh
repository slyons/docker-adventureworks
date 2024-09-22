#!/bin/bash

YEAR=2022

if [ ! -f adventureworks.bak ]; then
    echo "Downloading AdventureWorks OLTP backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks${YEAR}.bak -O adventureworks.bak -q
    echo "Download complete."
else
    echo "AdventureWorks OLTP backup file already downloaded. Skipping."
fi
if [ ! -f adventureworks-dw.bak ]; then
    echo "Downloading AdventureWorks data warehouse backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW${YEAR}.bak -O adventureworks-dw.bak -q
    echo "Download complete."
else
    echo "AdventureWorks data warehouse backup file already downloaded. Skipping."
fi
if [ ! -f adventureworks-light.bak ]; then
    echo "Downloading AdventureWorks light backup file from Microsoft..."
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks${YEAR}.bak -O adventureworks-light.bak -q
    echo "Download complete."
else
    echo "AdventureWorks light backup file already downloaded. Skipping."
fi
echo "Building OLTP docker image."
docker buildx build --platform=linux/amd64,linux/arm64 . -t slyons/adventureworks:latest-${YEAR} --build-arg BAK_FILE=./adventureworks.bak
docker tag slyons/adventureworks:latest-${YEAR} slyons/adventureworks:oltp-${YEAR}

echo "Building data warehouse docker image."
docker buildx build --platform=linux/amd64,linux/arm64 . -t slyons/adventureworks:datawarehouse-${YEAR} --build-arg BAK_FILE=./adventureworks-dw.bak
echo "Building light docker image."
docker buildx build --platform=linux/amd64,linux/arm64 . -t slyons/adventureworks:light-${YEAR} --build-arg BAK_FILE=./adventureworks-light.bak