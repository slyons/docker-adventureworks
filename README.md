# Docker AdventureWorks
This project is available on docker-hub under the [`chriseaton/adventureworks`](https://hub.docker.com/r/chriseaton/adventureworks) repository.

## Tags & Support
Currently this docker image is available in two supported database engines: Microsoft SQL Server & Postgres

To ensure parity and cross-compatibility, we use a slightly older version of each.
- Microsoft SQL 2016
- Postgres 13

### Microsoft SQL Server
There are three versions tagged for Microsoft SQL Server:

| Tag | Description |
|-----|-------------|
| `latest` or `oltp` | This image contains the standard OLTP version of the AdventureWorks database on Microsoft SQL 2016. |
| `datawarehouse` | This image utilizes the data warehouse version of the AdventureWorks database on Microsoft SQL 2016. |
| `light` | This image utilizes the "light" version of the AdventureWorks database on Microsoft SQL 2016. |

### Postgres
At this time, only the tables and data are fully implemented but should be accurately converted to postgres data types (including geography).
Some views (specifically, the ones using XML and `CROSS APPLY`) have been omitted.

No functions, custom types, or stored procedures are included.

| Tag | Description |
|-----|-------------|
| `postgres` | This image adapts the "light" version of the AdventureWorks database to Postgres 13.  |

## Building
Run the `build.sh` script to download the AdventureWorks [backup file from Microsoft](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure), and to build and tag the docker image.

## Running
### Microsoft SQL Server
This docker image uses the same environmental variables defined on the [Microsoft SQL Server docker image](https://hub.docker.com/_/microsoft-mssql-server).
```
docker run -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=my_password' -d chriseaton/adventureworks:latest
```

### Postgres
```
docker run -p 5432:5432 -e 'POSTGRES_PASSWORD=my_password' -d chriseaton/adventureworks:postgres
```

## Publishing
If you are a maintainer, you can publish the image to docker hub [chriseaton/adventureworks](https://hub.docker.com/repository/docker/chriseaton/adventureworks).

```sh
docker push chriseaton/adventureworks
```

