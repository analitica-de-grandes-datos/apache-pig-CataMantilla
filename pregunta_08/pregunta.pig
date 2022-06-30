/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

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
specific_columns = FOREACH table_1 GENERATE flatten(bag_letter) AS letter, flatten(map_data) AS triple_letter;
joined_data = FOREACH specific_columns GENERATE(letter, triple_letter) AS tuple_data;
grouped = GROUP joined_data BY tuple_data;
count_letter = FOREACH grouped GENERATE group, COUNT(joined_data);
STORE count_letter INTO 'output' USING PigStorage(',');