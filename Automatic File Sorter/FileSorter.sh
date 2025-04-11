#!/usr/bin/bash

#Get directory as an input
echo "What is the directory path?"

read MY_DIR

#Check if the directory exists
if [[  ! $MY_DIR ]]; then
        echo >2& "$MY_DIR does not exist or is not a directory"
        exit 1
fi

#Go to the given directory
cd "$MY_DIR"

#Create folders with files which extensions must be placed inside
echo "Folder name: "

read FOLDER_NAME

while [ ! -z "$FOLDER_NAME" -a "$FOLDER_NAME" != " " ]
do
   mkdir "$FOLDER_NAME"

   echo "Which kinds of files (based on extension) do you want to store in $FOLDER_NAME folder (e.g. .txt or .png) ?: "

   read FILE_EXTENSION

   while [ ! -z "$FILE_EXTENSION" ]
   do
       echo "Files with $FILE_EXTENSION extension were putted in $FOLDER_NAME folder."

       for file in "$MY_DIR"/*
       do
          if [[ $file == *$FILE_EXTENSION  ]]; then
              mv $file "$MY_DIR"/"$FOLDER_NAME"
          fi
       done

       echo "Which kinds of files (based on extension) do you want to store here $FOLDER_NAME folder (e.g. .txt or .png) ?: "
   
       read FILE_EXTENSION
done;

   echo "Folder name: "
   read FOLDER_NAME
done;
