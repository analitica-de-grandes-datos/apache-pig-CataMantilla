/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP 'blue|green';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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

table_2 = FOREACH table_1 GENERATE firstname, color;
table_3 = FILTER table_2 BY (color matches '.*green.*') OR (color matches '.*blue.*');
STORE table_3 INTO 'output' USING PigStorage(',');