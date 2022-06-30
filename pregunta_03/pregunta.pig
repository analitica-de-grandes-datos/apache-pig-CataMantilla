/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table_1 = LOAD 'data.tsv' USING PigStorage('\t')
        AS (
                col_1:CHARARRAY,
                col_2:DATETIME,
                col_3:INT
        );
numbers = FOREACH table_1 GENERATE col_3 AS number;
order_numbers = ORDER numbers BY number ASC;
limit_numbers = LIMIT order_numbers 5;

STORE limit_numbers INTO 'output' USING PigStorage(',');