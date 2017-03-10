/*Create a half-mile walkshed around a given school*/
drop table if exists ddtest;
create table ddtest as
	select * from pgr_drivingDistance(
        'select objectid as id, source, target, shape_length as cost from lionped',
        (WITH pointa AS (SELECT opt_code, school_name, wkb_geometry FROM schools WHERE opt_code = '02519') 
		   SELECT source from pointa, lionped order by ST_Distance(pointa.wkb_geometry, lionped.wkb_geometry) limit 1),
        2640,
        false
    ) as di
    left join lionped on (di.edge = lionped.objectid);