# Sanity checking
if ! which vim > /dev/null ; then echo "'vim' not available. Please install." && exit 1 ; fi
if ! which git > /dev/null ; then echo "'git' not available. Please install." && exit 1 ; fi

# Backup existing vim config
for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done

# Checkout viceroy from git into .vim
# git clone http://github.com/csexton/viceroy.git ~/.vim
git clone http://github.com/csexton/viceroy.git ~/.vim

# Symlink the config files
for i in vimrc gvimrc; do echo "Link $i" && ln -sf ~/.vim/$i ~/.$i; done

# Checkout vundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Create an example .vimrc.local
[ ! -e ~/.vimrc.local ] && cat << VIMRC >> ~/.vimrc.local
" Add your customizations for vim to this file
"colorscheme solarized
"set guifont=Monaco:h14
VIMRC

# Print the welcome message
cat ~/.vim/viceroy/welcome.txt
