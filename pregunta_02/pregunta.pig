/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
table_1 = LOAD 'data.tsv' USING PigStorage('\t')
        AS (
                col_1:CHARARRAY,
                col_2:CHARARRAY,
                col_3:INT
        );
table_11 = ORDER table_1 BY col_1, col_3;
STORE table_11 INTO 'output' USING PigStorage(',');