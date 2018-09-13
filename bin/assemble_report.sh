Directory=$1

#Takes content of all distrubution files and pipes them into wrap_contents
cat $Directory/country_dist.html $Directory/hours_dist.html $Directory/username_dist.html | \
       	bin/wrap_contents.sh - html_components/summary_plots failed_login_summary.html

#Moves summary into the directory assemble_report was called with
mv failed_login_summary.html $Directory/
