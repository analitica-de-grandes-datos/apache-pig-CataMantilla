/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

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
table_2 = FOREACH table_1 GENERATE ToDate(birth, 'yyyy-MM-dd') AS fecha;
table_3 = FOREACH table_2 GENERATE ToString(fecha, 'yyyy-MM-dd') AS fecha1,
                                   LOWER(ToString(fecha, 'MMM')) AS month_1,
                                   ToString(fecha, 'MM') AS month_2,
                                   ToString(fecha, 'M') AS month_3;
table_4 = FOREACH table_3 GENERATE fecha1, REPLACE(month_1, 'jan', 'ene') AS month_1, month_2, month_3;
table_4 = FOREACH table_4 GENERATE fecha1, REPLACE(month_1, 'apr', 'abr') AS month_1, month_2, month_3;
table_4 = FOREACH table_4 GENERATE fecha1, REPLACE(month_1, 'aug', 'ago') AS month_1, month_2, month_3;
table_4 = FOREACH table_4 GENERATE fecha1, REPLACE(month_1, 'dec', 'dic') AS month_1, month_2, month_3;
STORE table_4 INTO 'output' USING PigStorage(',');
