#!/data/data/com.termux/files/usr/bin/bash
# This type of file must be required
source ./src/cmd.sh 2>> err.log
if [[ $(command -v unzip) == "" ]]; then
  apt install unzip -y 1> /dev/null
fi
if [[ $(command -v git) == "" ]]; then
  apt install git -y 1> /dev/null
fi
if [[ $(command -v wget) == "" ]]; then
  apt install wget -y 1> /dev/null
fi
if [[ $(command -v lolcat) == "" ]]; then
  gem install lolcat 1> /dev/null
fi
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
until [[ $cmd == "#!" ]]; do (
  printf "${Reset}> "
read cmd > /dev/null
history -r .history
case "$cmd" in
  "shell"|"Shell") cmdShell 2>> err.log;;
  "exit"|"quit"|"Exit"|"Quit") exit 0 2>> err.log;;
  "help"|"Help") cmdHelp 2>> err.log;;
  "license"|"License") cmdLicense 2>> err.log;;
  "reload"|"Reload") cmdReload 2>> err.log;;
  "battery"|"Battery") cmdBattery 2>> err.log;;
  "") :;;
  "version") cmdVersion 2>> err.log;;
  "editor") cmdEditor 2>> err.log;;
  "history") cmdHistory 2>> err.log;;
  "update") cmdUpdatePackage 2>> err.log;;
  "momjoke") cmdMomJoke 2>> err.log;;
  *) echo -e "${Red}${cmd}${Reset} Not Found";;
esac
history -s "$cmd"
history -w .history
) done
