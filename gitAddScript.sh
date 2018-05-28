find . -maxdepth 1 -type f -iname '.*' | sed 's/.\///' | xargs git add
echo .config/fish/ .config/ranger/ .config/polybar/ .config/zathura/ .config/rofi/ .config/ristretto/ .config/terminator/| xargs git add
git add InsertInMakeFile.sh
git add gitAddScript.sh
