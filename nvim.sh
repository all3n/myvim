mkdir -p ~/.config/nvim

install_file(){
    FILE_NAME=$1
    FILE_PATH=~/.config/nvim/$FILE_NAME
    if [[ -f $FILE_PATH ]];then
        mv $FILE_PATH $FILE_PATH.$(date +%s).bak
    fi
    curl -o $FILE_PATH https://raw.githubusercontent.com/all3n/myvim/master/$FILE_NAME
}


install_file init.vim
install_file coc-settings.json

nvim +PlugInstall +quitall

