/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
table_1 = LOAD 'data.csv' USING PigStorage(',')
        AS (
          driverId:INT,
          truckId:INT,
          eventTime:CHARARRAY,
          eventType:CHARARRAY,
          longitude:DOUBLE,
          latitude:DOUBLE,
          eventKey:CHARARRAY,
          correlationId:CHARARRAY,
          driverName:CHARARRAY,
          routeId:BIGINTEGER,
          routeName:CHARARRAY,
          eventDate:CHARARRAY
                );
specific_columns = FOREACH table_1 GENERATE driverId, truckId, eventTime;
limit_columns = LIMIT specific_columns 10;
order_columns = ORDER limit_columns BY driverId, truckId, eventTime;

STORE limit_columns INTO 'output' USING PigStorage(',');