Content=$1
Header="$2_header.html"
Footer="$2_footer.html"
Result=$3

#Combines the header, content, and footer and prints them into the result file
cat $Header $Content $Footer > $Result
