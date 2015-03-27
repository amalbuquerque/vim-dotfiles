for d in `find . -maxdepth 1 -type d`;
do
    echo $d
    ( cd $d && chmod -R +x .git )
done
