function update_it {
    if [ -d .git ]; then
        # echo 'GIT'
        # git config --get remote.origin.url
        git pull
    else
        if [ -d .hg ]; then
            # echo 'HG'
            # hg paths default
            hg pull
        # else
            # echo 'NO SOURCE CONTROL'
        fi
    fi
}

for d in `find . -maxdepth 1 -type d`;
do
    echo $d
    ( cd $d && update_it )
done
