#!/bin/sh

set -ex
cd sound/cdtracks
for F in *.ogg; do
	T=${F%.ogg} # for tracker files we still need the ext
	if ! grep "^cdtrack [1-9][0-9]* $T" ../../cdtracks.cfg >/dev/null; then
		n=`tail -n 1 ../../cdtracks.cfg | cut -d ' ' -f 2`
		n=$(($n+1))
		echo "_cdtrack $n $T" >> ../../cdtracks.cfg
	fi
done
