# Docker AdventureWorks
This project is available on docker-hub under the [`chriseaton/adventureworks`](https://hub.docker.com/r/chriseaton/adventureworks) repository.

There are three versions tagged:
| Tag | Description |
|-----|-------------|
| `latest` or `oltp` | This image contains the standard OLTP version of the AdventureWorks database. |
| `datawarehouse` | This image utilizes the data warehouse version of the AdventureWorks database. |
| `light` | This image utilizes the "light" version of the AdventureWorks database. |

## Building
Run the `build.sh` script to download the AdventureWorks [backup file from Microsoft](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure), and to build and tag the docker image.

## Running
This docker image can be run easily by setting the environmental variables defined on the [Microsoft SQL Server docker image](https://hub.docker.com/_/microsoft-mssql-server).
```
docker run -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=my_password' -d chriseaton/adventureworks:latest
```