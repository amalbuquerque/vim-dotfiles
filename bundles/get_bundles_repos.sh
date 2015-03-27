function get_url {
    if [ -d .git ]; then
        # echo 'GIT'
        git config --get remote.origin.url
    else
        if [ -d .hg ]; then
            # echo 'HG'
            hg paths default
        else
            echo 'NO SOURCE CONTROL'
        fi
    fi
}

for d in `find . -maxdepth 1 -type d`;
do
    echo $d
    ( cd $d && get_url )
done
