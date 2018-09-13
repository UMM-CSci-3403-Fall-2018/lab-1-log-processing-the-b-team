Directory=$1

#Collects all failed_login_data files, collects the ip addresses from the outputed lines, sorts them,
#joins the ip addresses with the correct country codes from country_IP_map, collects the country codes,
#sorts and counts the collected codes, formats the codes and counts lines that are useable by javascript,
#and finally pipes output into wrap_contents
cat $Directory/*/failed_login_data.txt | awk '{print $5}' | sort | join -1 1 -2 1 - etc/country_IP_map.txt | \
       	awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | \
	bin/wrap_contents.sh - html_components/country_dist country_dist.html

#Moves country_dist.html into the directory create_country_dist was called with
mv country_dist.html $Directory                             
