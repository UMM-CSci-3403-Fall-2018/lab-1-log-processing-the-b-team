Directory=$1
cat log_files/$Directory/var/log/secure* | awk '/Failed password/ {if ($9 == "invalid") {print $1,$2,$3,$11,$13} else {print $1,$2,$3,$9,$11}} ' | sed -r 's/:[[:digit:]]+:[[:digit:]]+//' > failed_login_data.txt
mv failed_login_data.txt log_files/$Directory
