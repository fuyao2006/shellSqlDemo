#!/bin/bash
source /etc/profile

begin_date="20180708"
end_date="20190831"


while [ "$begin_date" -le "$end_date" ];
do

./hivesql.sh ${begin_date}

begin_date=$(date -d "${begin_date}+1days" +%Y%m%d)


done
