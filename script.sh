#!/bin/bash

mongoexport --db activity-server --collection registros --type=csv --fields dia,mes,anio,hora,Servidor,Equipo,Lectura,Escritura,Actividad,Contador,Tipo --out ./pisis.csv

sleep 10

mongoexport --db activity-server --collection registrosvisis --type=csv --fields dia,mes,anio,hora,Servidor,Equipo,Lectura,Escritura,Actividad,Contador,Tipo --out ./visis.csv

sleep 10

bq load --location=US --project_id=ing-analisis-operaciones --null_marker=NULL --skip_leading_rows=1 --source_format=CSV actividad_servidores.registros pisis.csv

sleep 10

bq load --location=US --project_id=ing-analisis-operaciones --null_marker=NULL --skip_leading_rows=1 --noreplace --source_format=CSV actividad_servidores.registros visis.csv

echo 'ARCHIVO OK'
echo "$(date)"

