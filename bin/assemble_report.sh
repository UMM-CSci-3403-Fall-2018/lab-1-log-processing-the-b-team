Directory=$1
cat $Directory/country_dist.html $Directory/hours_dist.html $Directory/username_dist.html > temp.txt
bin/wrap_contents.sh temp.txt html_components/summary_plots failed_login_summary.html
rm temp.txt
mv failed_login_summary.html $Directory/
