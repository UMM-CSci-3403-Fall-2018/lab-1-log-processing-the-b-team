Directory=$1
cat $1/*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username.txt
bin/wrap_contents.sh username.txt html_components/username_dist username_dist.html
rm username.txt
mv username_dist.html $1
