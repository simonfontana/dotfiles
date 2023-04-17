docker-ip() {
    docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /'
}

# ex - archive extractor
# usage: ex <file>
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Satisfactory online is bugged
# Run this to play Satisfactory online
# Will disable other networks
function play_satisfactory()
{
    sudo ifconfig wlan0 down
    sudo ifconfig docker0 down
    sudo ifconfig br-a2fe5f48a75b down
}

# Run this when stopping to play Satisfactory online
# Will re-enable networks
function unplay_satisfactory()
{
    sudo ifconfig wlan0 up
    sudo ifconfig docker0 up
    sudo ifconfig br-a2fe5f48a75b up
}

function wttr()
{
    curl 'wttr.in/gothenburg?M&format=v2'
}

function wttr_repeat()
{
  interval=900
  if [ -n "$1" ]; then interval=$1; fi
  echo "$interval"
    while true; do
        clear
        wttr
        sleep $interval
    done;
}
