# Safety checks
[ ! -e ~/.vimrc.old ] && echo "No old vim config to restore! (~/.vimrc.old)" && exit 1
for i in ~/.vimrc ~/.gvimrc ; do
[ -e $i ] && [ ! -h $i ] && echo "$i is not a symlink. Something is wrong!" && exit 1
done

i=~/.vim
[ -e $i ] && echo "Backing up $i to $i.viceroy" && mv $i $i.viceroy && [ -e $i.old ] && echo "Restoring $i.old to $i" && mv $i.old $i
for i in ~/.vimrc ~/.gvimrc ; do
[ -h $i ] && echo "Removing viceroy symlink $i" && rm $i && [ -e $i.old ] && echo "Restoring $i.old to $i" && mv $i.old $i
done

echo "Viceroy uninstalled."
i=~/.vimrc.local ; [ -e $i ] && echo "$i left in place"
echo "Test that vim works correctly before deleting viceroy backup in ~/.vim.viceroy"
