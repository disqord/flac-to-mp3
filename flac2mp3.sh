#!/usr/bin/env bash


# take current dir name
STR=${PWD##*/}

# construct mp3 folder name
# if it contains "FLAC" then substitute for "MP3[320]"
# else append "MP3[320]"
if [[ $STR == *"FLAC"* ]]
then
 	MPMAP=${STR/FLAC/MP3[320]};
else
	MPMAP=$STR"- MP3[320]";
fi


# make the folder
mkdir "$MPMAP";

# recode in folder:
for f in *.flac; do flac -cd "$f" | lame -b 320 - "$MPMAP"/"${f%.*}".mp3; done
