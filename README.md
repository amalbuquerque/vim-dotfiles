vim-dotfiles
============

my vim dotfiles

Howto, 2015-03-27 17:07:58:
---------------------------

* mkdir -p ~/.vim/autoload ~/.vim/bundle
* curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
* cd ~/vim-dotfiles
* cp ./bundles/bundle_list.txt ~/.vim/bundle
* cp ./bundles/clone_bundles.sh ~/.vim/bundle
* cd ~/.vim/bundle
* clone_bundles.sh bundle_list.txt
* touch ~/.vimrc && echo 'source ˜/vim-dotfiles/_vimrc' >> ~/.vimrc
