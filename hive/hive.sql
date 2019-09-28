drop table if exists ${hivetmp}.${tableprefix}021500;
create table ${hivetmp}.${tableprefix}021500 as
SELECT * 
省略


insert overwrite table smart.metricdatabaseminite_v2 partition(statisdate=${int_date})
SELECT *from
省略






insert overwrite local directory "${temp_path}/metricdatabaseminitegrp"
row format delimited
fields terminated by '\t'
SELECT *
省略

