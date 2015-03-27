#!/bin/bash
exec 4<$1
echo Starting
while read -u4 bundle ; do
    if [[ $bundle == *"git"* ]]; then
        # echo $bundle
        git clone $bundle
    else
        # echo $bundle
        hg clone $bundle
    fi
done
