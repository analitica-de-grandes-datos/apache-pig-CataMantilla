/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
table_1 = LOAD 'data.csv' USING PigStorage(',')
        AS (
                id:INT,
                firstname:CHARARRAY,
                lastname:CHARARRAY,
                date:CHARARRAY,
                color:CHARARRAY,
                number:INT
        );

table_2 = FOREACH table_1 GENERATE color;
table_3 = FILTER table_2 BY NOT(color matches '.*^b.*');
STORE table_3 INTO 'output' USING PigStorage(',');

