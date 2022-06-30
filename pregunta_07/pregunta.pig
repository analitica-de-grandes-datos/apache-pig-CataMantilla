/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table_1= LOAD 'data.tsv' AS (
        letter:chararray, 
        bag_letter:BAG{A:tuple(B:chararray)}, 
        map_data:[]
        );
specific_columns = FOREACH table_1 GENERATE letter, COUNT(bag_letter.B) AS bag_l, SIZE(map_data) AS map_s;
ordered = ORDER specific_columns BY letter ASC,bag_l,map_s ASC;
STORE ordered INTO 'output' USING PigStorage(',');