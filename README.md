# docker-database-example

Example repository to set up a Postgresql database image with a default database.

The project consists of three parts, the `Dockerfile` to create the Docker image and the `init.sql` to set up the database and a `release.yml` to publish the Docker image to Docker Hub.

## Dockerfile

Conveniently the official postgres image has support for [initialization scripts](https://github.com/docker-library/docs/blob/master/postgres/README.md#initialization-scripts). That means we only have to copy the `*.sql` scripts that we want to the correct directory and this will automatically be called on first run.

We set the default user/password for the superuser using environment variables. These can be overwritten by passing the environment variables on first run, e.g. `docker run -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password`.

## Initialization script

The initialization script (`init.sql`) is called on the first run of the image. Here we can create users/databases/tables and insert dummy data. It is recommended to create a different user here that, is not a superuser.

## Workflow

The `release.yml` workflow, is triggered by either creating a [release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) or by pushing a version tag to GitHub, e.g. 
```bash
git tag v0.1.0 -m "Initial version"
git push origin v0.1.0
```

The workflow will then get a copy of this repository and set up the Docker environment to build the image for multiple platforms (`arm64` and `amd64`). It will then build the images and push these to Docker Hub using the credentials stored in the [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).