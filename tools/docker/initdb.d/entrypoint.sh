#!/bin/bash

# SQL Serverをフォアグラウンドで実行
echo "##### process: Waiting for SQL Server to start..."
/opt/mssql/bin/sqlservr &
MSSQL_PID=$!

# SQL Serverの起動を待機
while ! /opt/mssql-tools18/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -C -Q "SELECT 1"; do
  echo "##### process: Waiting for SQL Server to start..."
  sleep 5
done
echo "##### process: SQL Server started."

# 初期化用SQLを実行
echo "##### process: Initializing database..."
/opt/mssql-tools18/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -C -i /docker-initdb.d/init.sql
echo "##### process: Database initialized."

# バックグラウンドで実行中のSQL Serverのプロセスを待機
wait $MSSQL_PID
