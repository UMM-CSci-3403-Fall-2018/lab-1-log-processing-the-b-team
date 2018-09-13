Directory=$1

#Collects all failed_login_data files, pulls out the hours from said output, sorts and counts occurences of
#the hours, prints the hours and counts into lines useable by javascript, and  pipes output into wrap_contents
cat $Directory/*/failed_login_data.txt | awk '{print $3}' | sort | uniq -c | \
       	awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | \
       	bin/wrap_contents.sh - html_components/hours_dist hours_dist.html

#Moves hours_dist.html into the directory create_hours_dist was called with
mv hours_dist.html $Directory                             
