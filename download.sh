#!/bin/bash
input="./sound-effects.csv" # This holds reference to all the files we're about to download
remote="http://bbcsfx.acropolis.org.uk/assets" # This is the server where they all exist
downloadLoc="./BBC_Sound_Effects" # This is the folder we're going to put them in

mkdir $downloadLoc # Create the download folder

# Read CSV
sed 's/","/"|"/g' $input | # Replace comma delimiter in the CSV file with '|' so we don't get confused by commas later on
  while IFS='|' read -r f1 f2 f3 f4 f5 f6 f7 # Loop each line, save variables using '|' as the delimiter
  do # For every line in the CSV, do the following
    folder=$(echo $f6 | tr -d \")
    file=$(echo $f1 | tr -d \") # Trim quotations from file name
    description=$(echo $f2 | tr -d \") # Trim quotations from description
    trimmedFolder=$(echo $folder | sed -e 's/ /_/g' | sed 's/[,.]//g' | tr -cd '[[:alnum:]]._-') # Trim & replace some problematic chars from Description names
    trimmedDesc=$(echo $description | sed -e 's/ /_/g' | sed 's/[,.]//g' | tr -cd '[[:alnum:]]._-') # Trim & replace some problematic chars from Description names

    if [ ! -d $downloadLoc/$trimmedFolder ] # If the folder doesn't exist
      then # Make it
        cd $downloadLoc
        mkdir $trimmedFolder
        cd ..
    fi

    # Backwards compatibility (move already downloaded file in to appropriate folder)
    if [ -e "$downloadLoc/$trimmedDesc.wav" ] # Check if the file exists
      then #If so, move it
        echo "$f1 already exists, moving in to appropriate folder..."
        echo "============================="
        mv "$downloadLoc/$trimmedDesc.wav" "$downloadLoc/$trimmedFolder"
    fi

    if [ -e "$downloadLoc/$trimmedFolder/$trimmedDesc.wav" ] # Check if the file exists
      then # If so, don't do anything
        echo "$f1 already exists, moving on..."
        echo "============================="
      else # Otherwise, download it
        cd $downloadLoc # Change directory (in to BBC_Sound_Effects)
        echo "Downloading $remote/$file > $trimmedFolder/$trimmedDesc.wav"
        curl "$remote/$file" -o "$trimmedFolder/$trimmedDesc.wav" --fail # Download the file or fail silently (and move on to the next recursion)
        echo "============================="
        cd ..
    fi
  done

# Enjoy, Ridds xx