#!/bin/bash

SAVEIF=$IFS
IFS=$(echo -en "\n\b")

for file in $(find . -name '*.wav')
do
  name=${file%%.wav}
  ##  lame -V4 -h -b 64 --vbr-new $name.wav $name.mp3
  lame $name.wav $name.mp3
  chown asterisk:asterisk $name.mp3
  touch $name.mp3 -r $name.wav
  rm -f $name.wav
done


IFS=$SAVEIFS
