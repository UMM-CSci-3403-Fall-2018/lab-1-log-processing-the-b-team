Directory=$1
cat $1/*/failed_login_data.txt | awk '{print $4}'
