#!/bin/bash

source /etc/profile
cd `dirname $0`
shell_path=`pwd`
para_path=`dirname $PWD`
base_path=`dirname $para_path`
cd -
source $shell_path/config.sh



template ${mysql_path}/zhunbei1.sql > ${temp_path}/zhunbei1.sql
sed -n  '/drop table if exists/p' ${temp_path}/zhunbei1.sql >${temp_path}/zhunbei1.sql.clean
cat ${temp_path}/zhunbei1.sql.clean >>${temp_path}/zhunbei1.sql
mysql -u${mysql_user} -p${mysql_passwd} -h${mysql_ip} < ${temp_path}/zhunbei1.sql





