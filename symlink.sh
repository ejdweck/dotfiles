# Creates symlinks from desired dotfiles to main dotfiles in home directory

# directory where dotfiles reside
dir=~/Dropbox/dotfiles

# list of files/folders to symlink in homedir
files="bash_profile bashrc vimrc osx"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
