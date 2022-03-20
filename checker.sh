#!/bin/bash

bash build.sh

cd tests/in

for filename in *
do
    ../../a.out <$filename >../out/$filename

    if test -f ../ans/$filename; then
        diff ../out/$filename ../ans/$filename || echo Error: Wrong answer on test $filename
    else
        echo Warning: No correct answer on test $filename
    fi
done