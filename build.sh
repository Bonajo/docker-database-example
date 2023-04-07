#!/usr/bin/env bash

# Remove old development version
docker rm -f prj2-db:dev
# Build the new development version
docker build --tag=prj2-db:dev .
# Run the newly build development version
docker run -p 5432:5432 --rm --name prj2-db prj2-db:dev