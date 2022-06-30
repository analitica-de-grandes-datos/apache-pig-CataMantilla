/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

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

table_2 = FOREACH table_1 GENERATE REGEX_EXTRACT(date, '(.*)-(.*)-(.*)', 1) AS year;
table_3 = FOREACH table_2 GENERATE year, SUBSTRING(year, 2, 4);
STORE table_3 INTO 'output' USING PigStorage(',');
