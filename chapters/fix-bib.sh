#!/bin/bash

set -e

DUPLICATES=$(cat bib-duplicates.txt)

for duplicate in $DUPLICATES
do
    src=$(echo $duplicate | cut -d "," -f 1)
    dst=$(echo $duplicate | cut -d "," -f 2)

    find . -type f -name "*.tex" -exec sed -i "s/cite{$src}/cite{$dst}/g" {} +
    find . -type f -name "*.tex" -exec sed -i "s/cite{$src,/cite{$dst,/g" {} +
    find . -type f -name "*.tex" -exec sed -i "s/,$src,/,$dst,/g" {} +
    find . -type f -name "*.tex" -exec sed -i "s/,$src}/,$dst}/g" {} +
done