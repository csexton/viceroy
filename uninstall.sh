# Safety checks
[ ! -e ~/.vimrc.old ] && echo "No old vim config to restore! (~/.vimrc.old)" && exit 1
for i in ~/.vimrc ~/.gvimrc ; do
[ -e $i ] && [ ! -h $i ] && echo "$i is not a symlink. Something is wrong!" && exit 1

i=~/.vim
[ -e $i ] && echo "Backing up $i to $i.viceroy" && mv $i $i.viceroy && [ -e $i.old ] && mv $i.old $i && echo "$i.old restored"
done
for i in ~/.vimrc ~/.gvimrc ; do
[ -h $i ] && echo "Removing viceroy symlink $i" && rm $i && [ -e $i.old ] && mv $i.old $i && echo "$i.old restored"
done

echo "Viceroy uninstalled."
echo "Test that vim works correctly before deleting viceroy backups"

