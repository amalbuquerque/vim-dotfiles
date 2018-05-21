#! /bin/bash
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-rubyinterp=dynamic \
  --enable-pythoninterp=dynamic \
  --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
  --enable-gui=auto \
  --enable-cscope \
  --with-x \
  --enable-fontset \
  --enable-largefile \
  --disable-netbeans \
  --with-compiledby="aa-lx" \
  --enable-fail-if-missing \
  --prefix=/usr/local
