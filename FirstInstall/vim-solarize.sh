#!/bin/sh
cd /tmp
git clone git://github.com/altercation/vim-colors-solarized.git
cd vim-colors-solarized/colors
mkdir -pv $HOME/.vim/colors
mv solarized.vim $HOME/.vim/colors/
cd /tmp
rm -rfv vim-colors-solarized
echo "colorscheme solarized"
