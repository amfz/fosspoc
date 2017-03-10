/*route from one edge to another, then join geom back in*/
DROP TABLE IF EXISTS samplejoin;

CREATE TABLE samplejoin AS
	SELECT * FROM pgr_dijkstra(
    	'SELECT objectid as id, source, target, shape_length as cost FROM lion17a',
    	90722,
    	90731,
    	directed := FALSE) as di
    LEFT JOIN lion17a ON (di.edge = lion17a.objectid);
