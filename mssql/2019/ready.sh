#!/bin/bash
/opt/mssql-tools18/bin/sqlcmd -C -S localhost -U sa -P "$SA_PASSWORD" -d master -Q "SET NOCOUNT ON; SELECT COUNT(Name) FROM sys.Databases WHERE Name LIKE 'AdventureWorks'" -h -1 -W | grep 1
exit $?