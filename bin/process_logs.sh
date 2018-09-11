tempDirectory=$(mktemp -d)
for var in "$@"
do
	Directory="$(var%_.*)"
	mkdir $Directory
	tar -C $Directory -xzvf log_files/$var
	mv $Directory $tempDirectory
done
