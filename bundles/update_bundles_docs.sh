#!/bin/bash
mkdir -p ~/.vim/doc
for d in `find ~/.vim/bundle | grep .txt | grep /doc/`;
do
    echo $d
    # 2015/09/13 20:31:50, AA: Copy Update, only if source newer
    cp -u $d ~/.vim/doc
done
echo 'You now should run :helptags ~/.vim/doc'
