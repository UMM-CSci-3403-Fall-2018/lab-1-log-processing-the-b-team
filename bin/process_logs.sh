tempDirectory=$(mktemp -d)
startingDirectory=$(pwd)
for var in "$@"
do
	#Pulls out first part of tar archive to set name for directory
	Directory="$(basename $var '_secure.tgz')"
	
	#Makes new directory to store unarchived log files
	mkdir log_files/$Directory
	
	#Uncompresses the tar archive into the new directory
	tar -C log_files/$Directory -xzf $var
	
	#Runs process_client_logs to create failed_login_data for all 
	#new directories
	bin/process_client_logs.sh $Directory
	
	#Moves new directory into the temp directory
	mv log_files/$Directory $tempDirectory
done
#Creates username, hour, and country distributions and combines them into the
#summary html file
bin/create_username_dist.sh $tempDirectory
bin/create_hours_dist.sh $tempDirectory
bin/create_country_dist.sh $tempDirectory
bin/assemble_report.sh $tempDirectory

#Moves new summary file into the directory process_logs was called from
mv $tempDirectory/failed_login_summary.html $startingDirectory/failed_login_summary.html

#Us cleaning up after ourselves
rm -rf $tempDirectory
