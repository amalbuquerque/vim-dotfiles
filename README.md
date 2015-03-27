vim-dotfiles
============

my vim dotfiles

Howto, 2015-03-27 17:07:58:
---------------------------

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp ./bundles/bundle_list.txt ~/.vim/bundle
cp ./bundles/clone_bundles.sh ~/.vim/bundle
~/.vim/bundle/clone_bundles.sh
