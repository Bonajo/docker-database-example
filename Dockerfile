FROM postgres:15.2

# Set the superuser name and password
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Copy the init.sql into the docker container
# All files inside '/docker-entrypoint-initdb.d/' are executed by default
COPY init.sql /docker-entrypoint-initdb.d/