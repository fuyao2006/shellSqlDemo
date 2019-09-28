delete from BASEDATA.${i}
where statisdate=${int_date};

load data local infile '${temp_path}/${i}/${i}.csv' into table BASEDATA.${i}  fields terminated by '\t';
