#!/usr/bin/env bash

source /etc/profile

cd `dirname $0`
shell_path=`pwd`
para_path=`dirname $PWD`
base_path=`dirname $para_path`
cd -

source $base_path/dbbase.conf

for i in `ls $para_path/conf` ; 
do
source $para_path/conf/$i
done

#临时目录
temp_path=$para_path/temp/${tempdir}

mkdir -p ${temp_path}

#sql模板目录
mysql_path=$para_path/mysql
hive_path=$para_path/hive

mysql_data=mysql.sql
hive_data=hive.sql

if test -z "$1"
then
    str_date=$(date -d "yesterday" +%Y-%m-%d)
else
    str_date=${1:0:8}
fi


# 日期变量
int_date=`date -d "$str_date 0 days" "+%Y%m%d"`
int_pre1_date=`date -d "$str_date -1 days" "+%Y%m%d"`
int_pre2_date=`date -d "$str_date -2 days" "+%Y%m%d"`
int_pre3_date=`date -d "$str_date -3 days" "+%Y%m%d"`
int_pre4_date=`date -d "$str_date -4 days" "+%Y%m%d"`
int_pre5_date=`date -d "$str_date -5 days" "+%Y%m%d"`
int_pre6_date=`date -d "$str_date -6 days" "+%Y%m%d"`

let begin_minite=`date -d "${int_date}" +%s`/60
let begin_minite_pre=${begin_minite}-1








