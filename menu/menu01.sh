#!/bin/bash 
 # ========================================= 
 vlx=$(grep -c -E "^#& " "/etc/xray/config.json") 
 let vla=$vlx/2
 vmc=$(grep -c -E "^### " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
 trx=$(grep -c -E "^#! " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^## " "/etc/xray/config.json") 
 let ssa=$ssx/2 
 COLOR1='\033[0;35m' 
 COLOR2='\033[0;39m' 
 clear

BURIQ () {
    curl -sS https://raw.githubusercontent.com/SETANTAZVPN/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/SETANTAZVPN/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/SETANTAZVPN/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/SETANTAZVPN/permission/main/ipmini | grep $MYIP | awk '{print $3}')
fi

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Clear
clear

MYIP=$(curl -sS ipv4.icanhazip.com)
#########################

# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}ON${NC}"
else
    status_ws_epro="${red}OFF${NC}"
fi
# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}ON${NC}"
else
    status_ss="${red}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${red}OFF${NC}"
fi
if [ "$Isadmin" = "Pro" ]; then
uis="${GREEN}Premium User$NC"
else
uis="${red}Free Version$NC"
fi
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################

# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
RED='\033[0;31m'
NC='\033[0m'
yl='\e[32;1m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}ON${NC}"
else
    status_ws_epro="${red}OFF${NC}"
fi
# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}ON${NC}"
else
    status_ss="${red}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${red}OFF${NC}"
    fi
clear
echo -e "╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕${NC}" | lolcat
echo -e "║ \E[37;1;36m          ★ SETAN 𝐓𝐔𝐍𝐍𝐄𝐋 ★            \E[0m"
echo -e "╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛${NC}" | lolcat
echo -e "║ [ SSH : $status_ws_epro ] [ X-RAY : $status_ss ] [ NGINX : $status_nginx ]" | lolcat
echo -e "║\e[1;33m╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m"
echo -e "║\e[1;37m IP VPS        \e[0m★ \033[1;33m $IPVPS ${NC}"
echo -e "║\e[1;37m DOMAIN        \e[0m★ \033[1;33m $domain ${NC}"
echo -e "║\e[1;37m NS DOMAIN     \e[0m★ \033[1;33m $(cat /root/nsdomain) ${NC}"
echo -e "║\e[1;37m RAM           \e[0m★ \033[1;33m $tram MB ${NC}"
echo -e "║\e[1;37m CPU           \e[0m★ \033[1;36m $cpu_usage"
echo -e "║\e[1;37m CPU CORES     \e[0m★ \033[1;36m $cores"
echo -e "║\e[1;33m╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m" 
echo -e "║${GREEN}  \033[0m ${BOLD}${GREEN}SSH      VMESS       VLESS      TROJAN$NC  $COLOR1" 
echo -e "║${GREEN}  \033[0m ${Blue} $ssh1        $vma           $vla          $tra                  $NC" 
echo -e "╠════════════════════════════════════════════╣" | lolcat
echo -e "║           ┌────────────────────────┐" | lolcat
echo -e "║           │Client :$NC\033[1;35m$Name${NC}"
echo -e "║           │Xpired :$NC\033[1;35m$Exp hari ${NC}"
echo -e "║           └────────────────────────┘" | lolcat
echo -e "╠════════════════════════════════════════════╣" | lolcat
echo -e "║\e[1;37m[•1]\e[0m║ \e[1;33mSSH OVPN\033[0m        ""║\e[1;37m[•7]\e[0m║ \e[1;36mCheck Running\033[0m"
echo -e "║\e[1;37m[•2]\e[0m║ \e[1;33mVmess\033[0m      ""║\e[1;37m[•8]\e[0m║ \e[1;36mSetup SLDNS$NC\033[0m"  
echo -e "║\e[1;37m[•3]\e[0m║ \e[1;33mVless\033[0m      ""║\e[1;37m[•9]\e[0m║ \e[1;36mClear Chace$NC\033[0m"
echo -e "║\e[1;37m[•4]\e[0m║ \e[1;33mTrojan\033[0m  ""║\e[1;37m[•10]\e[0m║ \e[1;36mSetup Bot$NC\033[0m"
echo -e "║\e[1;37m[•5]\e[0m║ \e[1;33mShadowsocks\033[0m  ""║\e[1;37m[11]\e[0m║ \e[1;36mSet Reboot${NC}\033[0m"
echo -e "║\e[1;37m[•6]\e[0m║ \e[1;33mSetting Menu\033[0m  ""║\e[1;37m[12]\e[0m║ \e[1;36mSet PW${NC}\033[0m"
echo -e "╠════════════════════════════════════════════╣" | lolcat     
echo -e "║                 \e[1;37mPREMIUM SCRIPT SETAN VPN ${NC}\033[0m"
echo -e "╠════════════════════════════════════════════╣" | lolcat
echo -e   ""
read -p " >>>  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-system;;
7) clear ; running ;;
8) clear ; wget -y && wget -qO- -O udp.sh "https://raw.githubusercontent.com/SETANTAZVPN/AutoScriptXray/master/udp-custom/udp.sh" && chmod +x udp.sh && ./udp.sh ;;
9) clear ; clearcache ;;
10) clear ; wget https://raw.githubusercontent.com/SETANTAZVPN/AutoScriptXray/master/bot%20telegram%20panel/xolpanel.sh && chmod +x xolpanel.sh && ./xolpanel.sh ;;
11) clear ; reboot ; /sbin/reboot ;;
12) clear ; passwd
x) exit ;;
esac
