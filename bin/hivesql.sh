#!/bin/bash

source /etc/profile
cd `dirname $0`
shell_path=`pwd`
para_path=`dirname $PWD`
base_path=`dirname $para_path`
cd -
source $shell_path/config.sh


#hive 语句执行
template ${hive_path}/${hive_data} > ${temp_path}/${hive_data}
sed -n  '/drop table if exists/p' ${temp_path}/${hive_data} >>${temp_path}/${hive_data}".clean"
cat ${temp_path}/${hive_data}".clean" >> ${temp_path}/${hive_data}
hive -f ${temp_path}/${hive_data}



echo "@@@@@@@11@@@@@@"
for i in {'metricdatabaseminite',};
do
a=`mysql -u${mysql_user} -p${mysql_passwd} -h${mysql_ip} -Ne "select count(1) from information_schema.partitions
where TABLE_SCHEMA=\"${mysqldb}\" and  TABLE_NAME=\"${i}\"
and PARTITION_NAME=\"p${int_date}\""`

if [[ $a -eq 0 ]];
then
mysql -u${mysql_user} -p${mysql_passwd} -h${mysql_ip} -e "alter table ${mysqldb}.${i} add PARTITION(PARTITION p${int_date} values in (${int_date}))"
else
mysql -u${mysql_user} -p${mysql_passwd} -h${mysql_ip} -e "alter table ${mysqldb}.${i} truncate PARTITION p${int_date}"

fi

done


#导入mysql
for i in {'metricmabc','metricminucde','metricdatabagrp'};
do

for j in `ls ${temp_path}/${i}/*` ;
do
cat $j >>${temp_path}/${i}/${i}.csv
rm $j
done

echo "@@@@@@@@@@@1@@@@@@@@@"
template ${mysql_path}/mysql.sql > ${temp_path}/mysql.sql
sed -n  '/drop table/Ip' ${temp_path}/mysql.sql >>${temp_path}/mysql.clean.sql
mysql -u${mysql_user} -p${mysql_passwd} -h${mysql_ip} < ${temp_path}/mysql.sql

done




rm ${temp_path} -rf
echo ${temp_path}


