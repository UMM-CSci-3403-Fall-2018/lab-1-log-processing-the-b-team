tempDirectory=$(mktemp -d)
startingDirectory=$(pwd)
for var in "$@"
do
	Directory="$(basename $var '_secure.tgz')"
	mkdir log_files/$Directory
	tar -C log_files/$Directory -xzf $var
	bin/process_client_logs.sh $Directory
	mv log_files/$Directory $tempDirectory
done
bin/create_username_dist.sh $tempDirectory
bin/create_hours_dist.sh $tempDirectory
bin/create_country_dist.sh $tempDirectory
bin/assemble_report.sh $tempDirectory
mv $tempDirectory/failed_login_summary.html $startingDirectory/failed_login_summary.html
rm -rf $tempDirectory
