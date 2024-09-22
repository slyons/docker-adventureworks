#!/bin/bash

YEAR=2019

docker push slyons/adventureworks:latest-${YEAR}
docker push slyons/adventureworks:oltp-${YEAR}
docker push slyons/adventureworks:datawarehouse-${YEAR}
docker push slyons/adventureworks:light-${YEAR}