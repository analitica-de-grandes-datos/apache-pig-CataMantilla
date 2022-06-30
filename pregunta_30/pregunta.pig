/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

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
table_3 = FOREACH table_2 GENERATE ToString(fecha, 'yyyy-MM-dd') AS fecha_1,
                                   ToString(fecha, 'dd') AS day,
                                   ToString(fecha, 'd') AS day_1,
                                   LOWER(ToString(fecha, 'EEEE')) AS dia,
                                   LOWER(ToString(fecha, 'E')) AS small_day;

table_4 = FOREACH table_3 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'thu', 'jue') AS small_day, REPLACE(dia, 'thursday', 'jueves') AS dia;
table_4 = FOREACH table_4 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'sun', 'dom') AS small_day, REPLACE(dia, 'sunday', 'domingo') AS dia;
table_4 = FOREACH table_4 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'fri', 'vie') AS small_day, REPLACE(dia, 'friday', 'viernes') AS dia;
table_4 = FOREACH table_4 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'mon', 'lun') AS small_day, REPLACE(dia, 'monday', 'lunes') AS dia;
table_4 = FOREACH table_4 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'tue', 'mar') AS small_day, REPLACE(dia, 'tuesday', 'martes') AS dia;
table_4 = FOREACH table_4 GENERATE fecha_1, day, day_1, REPLACE(small_day, 'wed', 'mie') AS small_day, REPLACE(dia, 'wednesday', 'miercoles') AS dia;
STORE table_4 INTO 'output' USING PigStorage(',');
