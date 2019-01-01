# zshrc file for wsl
# update 2019.1.1
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="fino-time"

plugins=(autojump sudo)

source $ZSH/oh-my-zsh.sh

##在命令前插入 sudo {{{
#定义功能
sudo-command-line() {
[[ -z $BUFFER ]] && zle up-history
[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

# for rm {{
# mkdir ~/.delete, when rm somethings ,mv them to here
if [ ! -d $HOME/.delete ]
then
    mkdir $HOME/.delete
fi
unDoRm() {
    echo '---------------->>' >> ~/.delete/delete.log
    echo 'UnDoRmFromThere:' $dir_name To $last_do_backup_dir >> ~/.delete/delete.log
    mv -i $HOME/.delete/$dir_name/* $last_do_backup_dir
    /bin/rm -rf $HOME/.delete/$dir_name
    echo '<<----------------' >> ~/.delete/delete.log
}
movetowhere() {
    echo $dir_name
}
toBackup()
{
    dir_name=`date`
    mkdir -p $HOME/.delete/$dir_name
    last=$@
    last_do_backup_dir=`pwd`
    echo '----------------->>' >> ~/.delete/delete.log
    echo BackupToThere: $dir_name >> ~/.delete/delete.log
    for thing in $@
    do
        echo $thing | grep '^-' > /dev/null
        if [ ! $? = 0 ]
        then
            mv $thing $HOME/.delete/$dir_name
            echo mv $thing to ~/.delete/$dir_name, you can backup them
            echo '' >> ~/.delete/delete.log
            echo Name: $thing >> ~/.delete/delete.log
            echo FromWhere: `pwd`/$thing >> ~/.delete/delete.log
            echo MoveTo: $dir_name >> ~/.delete/delete.log
        fi
    done
    echo '<<------------------' >> $HOME/.delete/delete.log

}
cleanDelete()
{
    echo 'clear backup files?[y/N]'
    read confirm
    [ $confirm = 'y' ] || [ $confirm = 'Y' ]  && /bin/rm -rf $HOME/.delete/*
}
# rm somethings
alias rm=toBackup

# see what in~/.delete now
alias lsdel='ls $HOME/.delete'
# undo
alias unrm=unDoRm
alias lastrmtowhere=movetowhere
# clean ~/.delete
alias cleandel=cleanDelete
# }}

# for cpp {{
alias buildcpp='clang++ -std=c++11'
alias runcpp='./a.out'
#}}

alias 'opencv'='g++ `pkg-config --cflags --libs opencv`'

alias 'Anaconda'='source /home/z/anaconda3/bin/activate root'
alias 'Anaconda-close'='source /home/z/anaconda3/bin/deactivate root'
alias 'vps'='ssh -p 28173 root@176.122.129.89'

# windows X server
export DIAPLAY=localhost:0.0

# java jdk {{
export JAVA_HOME=/usr/lib/jvm/java8
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
# }}

# cuda for ubuntu {{
# export PATH="/usr/local/cuda-9.2/bin:$PATH"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-9.2/lib64"
# }}
