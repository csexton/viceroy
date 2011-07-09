for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
git clone git://github.com/csexton/viceroy.git ~/.vim
for i in vimrc gvimrc; do [ -e $i ] && ln -s ~/.vim/$i ~/.$i; done
