shopt -s extglob
inotifywait -m -r /home/codemantra/Documents/OAT/RD/PDFixSDKSample-java-master/sourcepdf -e close_write -e moved_to |
    while read path action file; do
        cd /home/codemantra/Documents/OAT/RD/PDFixSDKSample-java-master/
        echo "The file '$file' appeared in directory '$path' via '$action'"
        filename=$(basename -- "$file")
        name="${filename%.*}"
        extension="${filename##*.}"

        echo "$filename"
        
	if [[ -d $path/$file ]]; then
	    echo "$file is a directory";
    	else
	    echo "$file is a file";
	    if [[ "$file" =~ .*pdf$ ]]; then
	    	echo "file is pdf...";
		inputPath="$(cd "$(dirname "$path")"; pwd)/$(basename "$path")";
		outputPath=${inputPath/\/sourcepdf/\/inputpdf};

		mkdir -p "$outputPath"

		pdfix_app shahid@codemantra.in gaXz94Eomk512fev -pdf2xml "$inputPath"/"$filename" "$outputPath"/"$name".xml

		pdfix_app shahid@codemantra.in gaXz94Eomk512fev -addtags "$inputPath"/"$filename" "$outputPath"/"$filename"

		#shopt -s extglob
		cd "$outputPath"/
		rm -v !(*.xml|*.pdf)		
	    fi 
        fi
        echo "---------------";
    done
