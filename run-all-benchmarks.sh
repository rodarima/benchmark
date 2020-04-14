#!/bin/sh

echo -n "" > results.txt

for APP in apps/* ; do
	for PM in $APP/* ; do
		make -C $PM bench.txt
		echo -n "$PM " >> results.txt
		cat $PM/bench.txt >> results.txt
	done
done
