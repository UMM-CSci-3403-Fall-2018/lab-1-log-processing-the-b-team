Directory=$1

#Collects all log files with secure in their name, collects all lines from those files that refrence 
#a failed login and prints out month, date, time, username, and ip address from those lines, and removes
#the minutes and seconds from the times and outputs the lines into failed_login_data.txt
cat log_files/$Directory/var/log/secure* | \
       	awk '/Failed password/ {if ($9 == "invalid") {print $1,$2,$3,$11,$13} else {print $1,$2,$3,$9,$11}} ' | \
       	sed -r 's/:[[:digit:]]+:[[:digit:]]+//' > failed_login_data.txt

#Moves failed_login_data into the directory process_client_logs was called with
mv failed_login_data.txt log_files/$Directory
