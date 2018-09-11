Directory=$1
cat $Directory/*/failed_login_data.txt | awk '{print $5}' | sort > ipTemp.txt
#sort --o etc/country_IP_map.txt
join -1 1 -2 1 ipTemp.txt etc/country_IP_map.txt | awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > countries.txt
bin/wrap_contents.sh countries.txt html_components/country_dist country_dist.html
rm ipTemp.txt
rm countries.txt
mv country_dist.html $Directory                             
