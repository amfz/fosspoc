/*Create an approximation of the TED pedestrian network from lion17a
assumes source, target columns already created*/
DROP TABLE IF EXISTS lionped;

CREATE TABLE lionped AS
	SELECT * from lion17a WHERE 
    featuretyp IN ('0', '6', 'A', 'C', 'W') AND
    nodelevelf NOT IN ('*', '$') AND
    nodelevelt NOT IN ('*', '$') AND
    rw_type NOT IN('4', '14') AND
    row_type = ' ' AND
    nonped NOT IN ('V', 'D');
    
SELECT pgr_createTopology('lionped', 1, 'wkb_geometry', 'objectid');
SELECT pgr_analyzeGraph('lionped', 1, 'wkb_geometry', 'objectid');
/*SELECT * from lionped;*/