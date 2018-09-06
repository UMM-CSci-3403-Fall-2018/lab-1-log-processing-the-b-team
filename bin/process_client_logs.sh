Directory=$1
cd $1/var/log
cat secure* | awk '/Failed password/ {if ($9 == "Invalid") {print $1,$2,$3,$11,$13} else {print $1,$2,$3,$9,$11}' | sed -r 's/:[[:digit:]]+//' > failed_login_data.txt
