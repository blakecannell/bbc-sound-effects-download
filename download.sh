#!/bin/bash
input="./sound-effects.csv" # This holds reference to all the files we're about to download
remote="http://bbcsfx.acropolis.org.uk/assets" # This is the server where they all exist
downloadLoc="./BBC_Sound_Effects" # This is the folder we're going to put them in

mkdir $downloadLoc # Create the download folder

# Read CSV
sed 's/","/"|"/g' $input | # Replace comma delimiter in the CSV file with '|' so we don't get confused by commas later on
  while IFS='|' read -r f1 f2 f3 f4 f5 f6 f7 # Loop each line, save variables using '|' as the delimiter
  do # For every line in the CSV, do the following
    file=$(echo $f1 | tr -d \") # Trim quotations from file name
    description=$(echo $f2 | tr -d \") # Trim quotations from description
    trimmedDesc=$(echo $description | sed -e 's/ /_/g' | sed 's/,//g' | sed 's/\.//g' | tr -cd '[[:alnum:]]._-') # Trim & replace some problematic chars from Description names
    if [ -e "$downloadLoc/$trimmedDesc.wav" ] # Check if the file exists
      then # If so, don't do anything
        echo "$f1 already exists, moving on..."
        echo "============================="
      else # Otherwise, download it
        echo "Downloading $remote/$file > $downloadLoc/$description.wav"
        curl "$remote/$file" -o "$downloadLoc/$trimmedDesc.wav" --fail # Download the file or fail silently (and move on to the next recursion)
        echo "============================="
    fi
  done

# Enjoy, Ridds xx