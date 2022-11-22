#!/data/data/com.termux/files/usr/bin/bash
source ./src/cmd.sh
# This type of file must on Baller/ directories
dependencies=( unzip git wget lolcat jq nvim )
# removed and replace this one idk
for i in "${dependencies[@]}"; do
  [[ $i == 'lolcat' ]] && package_manager='gem install' || package_manager='apt install'
  [[ $(command -v "$i") == "" ]] && $package_manager "$i" 1> /dev/null
done
unset -v package_manager

if [[ $1 != "--no-ascii" ]]; then
echo """'########:::::'###::::'##:::::::'##:::::::'########:'########::
 ##.... ##:::'## ##::: ##::::::: ##::::::: ##.....:: ##.... ##:
 ##:::: ##::'##:. ##:: ##::::::: ##::::::: ##::::::: ##:::: ##:
 ########::'##:::. ##: ##::::::: ##::::::: ######::: ########::
 ##.... ##: #########: ##::::::: ##::::::: ##...:::: ##.. ##:::
 ##:::: ##: ##.... ##: ##::::::: ##::::::: ##::::::: ##::. ##::
 ########:: ##:::: ##: ########: ########: ########: ##:::. ##:
........:::..:::::..::........::........::........::..:::::..::

""" | lolcat 2> /dev/null
fi
printf "Use ${Yellow}'help'${Reset} for a list of commands.\n"
# random guy script
until [[ $cmd == "#!" ]]; do (
  printf "${Reset}> "
read cmd > /dev/null
history -r .history
case "$cmd" in
  [Ss]hell) cmdShell 2>> err.log;;
  [Ee]xit|[Qq]uit) exit 0 2>> err.log;;
  [Hh]elp) cmdHelp 2>> err.log;;
  [Ll]icense) cmdLicense 2>> err.log;;
  [Rr]eload) cmdReload 2>> err.log;;
  [Bb]attery) cmdBattery 2>> err.log;;
  "") :;;
  [Vv]ersion) cmdVersion 2>> err.log;;
  [Ee]ditor) cmdEditor 2>> err.log;;
  [Hh]istory) cmdHistory 2>> err.log;;
  [Uu]pdate) cmdUpdatePackage 2>> err.log;;
  [Jj]oke) cmdJoke 2>> err.log;;
  *) echo -e "${Red}${cmd}${Reset} Not Found";;
esac
history -s "$cmd"
history -w .history
) done
