#!/bin/sh
for i in *"title 0.caf"
do
    copy=1;
    for j in ./mp3/*.mp3
    do
	mp3="${j#./mp3/}"
	if [ "${i%-*}" = "${mp3%-*}" ]; then
	    copy=0;
	    break
	fi
    done
    if [ "${copy}" = 1 ]; then
	cp "$i" ./new/
    fi
done

for i in *"t.caf"
do
    copy=1;
    for j in ./mp3/*.mp3
    do
	mp3="${j#./mp3/}"
	if [ "${i%-*}" = "${mp3%-*}" ]; then
	    copy=0;
	    break
	fi
    done
    if [ "${copy}" = 1 ]; then
	cp "$i" ./new/
    fi
done

for i in ./new/*"title 0.caf"
do
    title="${i#./new/}"
    title="${title%-*}"
    for j in "${title}"*.caf
    do
        cp "$j" ./new/
    done
done

for i in ./new/*"t.caf"
do
    title="${i#./new/}"
    title="${title%-*}"
    for j in "${title}"*.caf
    do
        cp "$j" ./new/
    done
done


#!/bin/sh
find ./new -name "A*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "B*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "C*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "D*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "E*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "F*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "G*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "H*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "I*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "J*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "K*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "L*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "M*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "N*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "O*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "P*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "Q*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "R*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "S*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "T*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "U*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "V*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "W*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "X*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "Y*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./new -name "Z*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
for i in ./new/*.mp4
do
    echo $i
    tmp=${i%.mp4}.mp3
    echo tmp
    echo "./mp3/${tmp#./new/}"
    mv "$i" "./mp3/${tmp#./new/}"

done
