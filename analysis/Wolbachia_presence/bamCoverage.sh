#!/usr/bin/env bash

for f in sorted*.bam
do
	echo $f
	bamCoverage --bam $f --binSize 10 --normalizeUsing CPM --outFileFormat bedgraph --outFileName ${f}.cov
done
