Directory=$1

#Collects all failed_login_data files in the directory given into one output, collects all usernames from
#the output, sorts and then counts the occurences of those usernames, prints out the usernames and counts
#into a form that javascript can use, and pipes output into wrap_contents
cat $Directory/*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | \
       	awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | \
       	bin/wrap_contents.sh - html_components/username_dist username_dist.html

#Moves new username_dist into the directory create_username_dist was called with
mv username_dist.html $Directory
