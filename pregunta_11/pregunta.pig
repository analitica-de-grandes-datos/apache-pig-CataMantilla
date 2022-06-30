/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table_1 = LOAD 'data.csv' USING PigStorage(',')
        AS (
                id:INT,
                name:CHARARRAY,
                lastname:CHARARRAY,
                date:CHARARRAY,
                color:CHARARRAY,
                number:INT
        );

table_2 = FOREACH table_1 GENERATE lastname;
table_3 = FOREACH table_2 GENERATE lastname, UPPER(lastname), LOWER(lastname);
table_4 = ORDER table_3 BY lastname;

STORE table_4 INTO 'output' USING PigStorage(',');
