#!/bin/bash

cwd=$(pwd)
pprint() {
	count=${#1}
	printf "%${count}s" |tr " " "="
	printf "\n"
	echo $1
	printf "%${count}s" |tr " " "="
	printf "\n"
}


echo "-----------------------------------------------------"
echo "Installing the required software for your dotfiles..."
echo "-----------------------------------------------------"


pprint "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


pprint "Installing pathogen packages..."
cd ~/.vim/bundle && rm -rf ./*; 
declare -a packages=('https://github.com/NLKNguyen/papercolor-theme'
		     'https://github.com/tpope/vim-sensible'
		     'https://github.com/vim-airline/vim-airline'
             'https://github.com/dense-analysis/ale.git')
for val in ${packages[@]}; do
   git clone -q $val ;
done


pprint "Installing COC completers..."
git clone 'https://github.com/neoclide/coc.nvim'
cd ~/.vim/bundle/coc.nvim && yarn install --silent & 
vim -c 'CocInstall -sync coc-json coc-html coc-marketplace|q'


pprint "Overwriting .vimrc, coc.vim, coc-settings.json..."
cd $cwd
cp .vimrc ~
cp coc-settings.json ~
cp coc.vim ~/.vim/


pprint "Installing oh-my-tmux..."
cd ~ && rm -rf .tmux
git clone -q https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

pprint "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

