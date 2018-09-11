Directory=$1
cat $1/*/failed_login_data.txt | awk '{print $3}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hours.txt
bin/wrap_contents.sh hours.txt html_components/hours_dist hours_dist.html
rm hours.txt
mv hours_dist.html $1                             
