/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table_1 = LOAD 'data.tsv' USING PigStorage('\t')
        AS (
                col_1: CHARARRAY,
                col_2: DATETIME,
                col_3: INT
        );

letters = FOREACH table_1 GENERATE col_1 AS letter;
grouped = GROUP letters BY letter;
lettercount = FOREACH grouped GENERATE group, COUNT(letters);
STORE lettercount INTO 'output' USING PigStorage (',');
