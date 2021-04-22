mkdir -p ~/.config/nvim

install_file(){
    FILE_NAME=$1
    FILE_PATH=~/.config/nvim/$FILE_NAME
    if [[ -f $FILE_PATH ]];then
        mv $FILE_PATH $FILE_PATH.$(date +%s).bak
    fi

    if [[ -d .git ]];then
        cp $FILE_NAME $FILE_PATH
    else
        curl -o $FILE_PATH https://raw.githubusercontent.com/all3n/myvim/master/$FILE_NAME
    fi
}


install_file init.vim
install_file coc-settings.json

nvim +PlugInstall +quitall

