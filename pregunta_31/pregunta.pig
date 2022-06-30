/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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
                birth:CHARARRAY,
                color:CHARARRAY,
                number:INT
        );
table_2 = FOREACH table_1 GENERATE SUBSTRING(birth,0,4) AS anho;
table_3 = GROUP table_2 BY anho;
table_4 = FOREACH table_3 GENERATE group, COUNT($1);
STORE table_4 INTO 'output' USING PigStorage(',');
