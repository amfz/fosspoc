/*Creatre a half-mile walkshed around a given node*/

DROP TABLE IF EXISTS sampledd;

CREATE TABLE sampledd AS
	SELECT * FROM pgr_drivingDistance(
    	'SELECT objectid as id, source, target, shape_length as cost FROM lion17a',
    	60805, 
        2640,
        FALSE
    ) as di
    LEFT JOIN lion17a ON (di.edge = lion17a.objectid);
