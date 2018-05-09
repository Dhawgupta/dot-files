find . -maxdepth 1 -type f -iname '.*' | sed 's/.\///' | xargs git add
echo .config/fish/ .config/ranger/ .config/polybar/ .config/zathura/ .config/rofi/ .config/ristretto/ | xargs git add
