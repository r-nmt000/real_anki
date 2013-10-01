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
	cp "$i" ./alone/
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
	cp "$i" ./alone/
    fi
done

for i in ./alone/*"title 0.caf"
do
    title="${i#./alone/}"
    title="${title%-*}"
    for j in "${title}"*.caf
    do
        cp "$j" ./alone/
    done
done

for i in ./alone/*"t.caf"
do
    title="${i#./alone/}"
    title="${title%-*}"
    for j in "${title}"*.caf
    do
        cp "$j" ./alone/
    done
done


#!/bin/sh
find ./alone -name "A*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "B*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "C*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "D*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "E*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "F*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "G*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "H*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "I*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "J*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "K*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "L*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "M*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "N*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "O*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "P*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "Q*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "R*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "S*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "T*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "U*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "V*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "W*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "X*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "Y*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
find ./alone -name "Z*.caf" -mtime -1 -exec afconvert -f mp4f -d aac -b 128000 {} \;
for i in ./alone/*.mp4
do
    echo $i
    tmp=${i%.mp4}.mp3
    echo tmp
    echo "./mp3/${tmp#./alone/}"
    mv "$i" "./mp3/${tmp#./alone/}"

done
