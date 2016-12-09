


# take current dir name
echo ${PWD##*/}
STR=${PWD##*/}
echo "${STR/FLAC/MP3}"

# construct mp3 folder name
# if it contains "FLAC" then substitute for "MP3[320]"
# else append "MP3[320]"
if [[ $STR == *"FLAC"* ]]
then
 	echo "It's there!";
 	MPMAP=${STR/FLAC/MP3[320]};
else
	echo "Itsnotdere";
	MPMAP=$STR"- MP3[320]"
fi


# make the folder
echo $MPMAP;
mkdir "$MPMAP";

# recode in folder:
for f in *.flac; do flac -cd "$f" | lame -b 320 - "$MPMAP"/"${f%.*}".mp3; done
