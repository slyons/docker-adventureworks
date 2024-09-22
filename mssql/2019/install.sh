#!/bin/bash

echo "Running installation script..."

#wait for the SQL Server to come up
until /opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P "$SA_PASSWORD" -d master -Q "SELECT 1" &> /dev/null
do
    echo "Waiting for SQL Server to come up..."
    sleep 1
done
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P "$SA_PASSWORD" -d master -Q 'RESTORE FILELISTONLY FROM DISK = "/adventureworks.bak"'
/opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P "$SA_PASSWORD" -d master -Q 'RESTORE DATABASE AdventureWorks FROM DISK = "/adventureworks.bak" WITH MOVE "AdventureWorks2019" TO "/var/opt/mssql/data/AdventureWorks.mdf", MOVE "AdventureWorks2019_log" TO "/var/opt/mssql/data/AdventureWorks_log.ldf"'
echo
echo "Done installing database."
echo "Server is ready."
sleep infinity