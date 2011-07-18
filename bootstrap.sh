for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
git clone http://github.com/csexton/viceroy.git ~/.vim
cd ~/.vim
for i in vimrc gvimrc; do [ -e $i ] && ln -s ~/.vim/$i ~/.$i; done
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
touch ~/.vimrc.local
cat ~/.vim/viceroy/welcome.txt
