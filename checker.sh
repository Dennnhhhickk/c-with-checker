#!/bin/bash

if ! [ -f './a.out' ]
then
    bash build.sh
else
    _cacrl=`date +%s -r a.out`
    _oldcrl=`date +%s -r main.cpp`

    if (( $_cacrl - $_oldcrl < 0 ))
    then 
        bash build.sh
    fi
fi

cd tests/in

for filename in *
do
    ../../a.out <$filename >../out/$filename

    if test -f ../ans/$filename
    then
        diff ../out/$filename ../ans/$filename || echo Error: Wrong answer on test $filename
    else
        echo Warning: No correct answer on test $filename
    fi
done