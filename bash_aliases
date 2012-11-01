alias refresh-term="clear;source ~/.bashrc"

alias display-busy-term="toilet -f future --metal ' B  U  S  Y '"

alias weinre_open="node /home/dev/node_modules/weinre/weinre --httpPort 8081 --boundHost -all- "

alias makedatedir="mkdir `date +%d_%m_%Y`"

alias show-log-pianobar="cat ~/logs/pianobar-fifo.log"
alias show-log-homebackup="cat ~/logs/homebackup.log"
alias show-logs="ls ~/logs"
alias show-apache-log="cat /var/log/apache2/access.log"
alias clear-ff-offline-cache="rm -rf /home/dev/.mozilla/firefox/hnssk6cj.default/OfflineCache/*"
alias cd-to-wwwroot="cd /home/dev/digitalassent/prod-health/development/modules/com.digitalassent.patientpad/wwwroot/"
alias cd-to-autobuild="cd /home/dev/digitalassent/prod-build/scripts/autobuild/"
alias funny-fortune="fortune disclaimer"

alias lh="ls -lhS"

alias pwd="pwd -P" #force full path



# Colors

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

# Underline
UBlack='\[\e[4;30m\]'       # Black
URed='\[\e[4;31m\]'         # Red
UGreen='\[\e[4;32m\]'       # Green
UYellow='\[\e[4;33m\]'      # Yellow
UBlue='\[\e[4;34m\]'        # Blue
UPurple='\[\e[4;35m\]'      # Purple
UCyan='\[\e[4;36m\]'        # Cyan
UWhite='\[\e[4;37m\]'       # White

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White

# High Intensty
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensty
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# High Intensty backgrounds
On_IBlack='\[\e[0;100m\]'   # Black
On_IRed='\[\e[0;101m\]'     # Red
On_IGreen='\[\e[0;102m\]'   # Green
On_IYellow='\[\e[0;103m\]'  # Yellow
On_IBlue='\[\e[0;104m\]'    # Blue
On_IPurple='\[\e[10;95m\]'  # Purple
On_ICyan='\[\e[0;106m\]'    # Cyan
On_IWhite='\[\e[0;107m\]'   # White



# Actual Aliases


alias showmyinuse='mysql -uroot -pamesbery56 -e "show open tables where in_use"'
alias showmyprocess='mysql -uroot -pamesbery56 -e "show processlist"'
alias localmytop='mytop -uroot -pamesbery56'
alias localmysql='mysql -uroot -pamesbery56'

alias adserver='localmysql adserver '
alias patientpad='localmysql patientpad '

alias omnibot.on.dev='ssh -p 712 omnibot@dev.patient-pad.com'
alias dev.connect='ssh -p 712 devraj@dev.patient-pad.com'
alias nprompt_old="PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '"
alias red="PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[01;31m\] '"
alias noclose="PS1='                             Don'\''t close this terminal.\n\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '"

alias checkp='c=0;for i in $(jobs);do c=$[$c+1];done;if [ $c -ne 0 ];then noclose;else nprompt;fi'
alias playpausepianobar="echo -n 'p' > ~/.config/pianobar/ctl"
alias likecurrentpianobar="echo -n '+' > ~/.config/pianobar/ctl"

alias nprompt="PS1='${Color_Off}${BGreen}\u${Blue}@${BGreen}`hostname -I` ${BBlue}\w \n\$ ${Color_Off}'"


alias searchforhosts="nmap -sP 192.168.1.0-255"
alias searchforsshhosts="nmap -sV -p22 192.168.1.0-255 --open"
