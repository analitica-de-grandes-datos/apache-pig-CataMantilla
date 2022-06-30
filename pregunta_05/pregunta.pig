/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
 table_1= LOAD 'data.tsv' AS (
        letter:chararray, 
        bag_letter:BAG{A:tuple(B:chararray)}, 
        map_data:chararray
    );
specific_column = FOREACH table_1 GENERATE flatten(bag_letter) as letter; 
grouped = GROUP specific_column BY letter;
count_letter = FOREACH grouped GENERATE group, COUNT(specific_column);
STORE count_letter INTO 'output' USING PigStorage(',');