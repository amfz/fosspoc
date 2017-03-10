ALTER TABLE lion17a ADD COLUMN source integer;
ALTER TABLE lion17a ADD COLUMN target integer;

SELECT pgr_createTopology('lion17a', 1, 'wkb_geometry', 'objectid');
SELECT pgr_analyzeGraph('lion17a', 1, 'wkb_geometry', 'objectid');
SELECT * from lion17a;
