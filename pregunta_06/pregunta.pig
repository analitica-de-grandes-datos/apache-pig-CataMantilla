/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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
specific_column = FOREACH table_1 GENERATE flatten(map_data) AS letter;
grouped = GROUP specific_column BY letter;
count_key = FOREACH grouped GENERATE group, COUNT(specific_column);
STORE count_key INTO 'output' USING PigStorage(',');
