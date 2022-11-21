#!/data/data/com.termux/files/usr/bin/bash
source ./src/color.sh
cmdHelp (){
echo -e """LIST OF COMMANDS:
${Green}- ${Yellow}help ${Reset}(Print this command)
${Green}- ${Yellow}shell ${Reset}(Open exist shell)
${Green}- ${Yellow}editor ${Reset}(Open text editor)
${Green}- ${Yellow}license ${Reset}(Print License)
${Green}- ${Yellow}version ${Reset}(Print version of this bash files)
${Green}- ${Yellow}battery ${Reset}(Print battery)
${Green}- ${Yellow}history ${Reset}(Read history files)
${Green}- ${Yellow}update ${Reset}(Update package)
${Green}- ${Yellow}momjoke ${Reset}(Tell me mom joke)"""
}
cmdLicense (){
  echo -e """The AGPLv3 License (AGPLv3)
Copyright (c) 2022 ${Yellow}crischutu07${Reset}

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>."""
}
cmdBattery (){
  battery=$(termux-battery-status)
  if [[ $(echo $battery | jq -r ".percentage") -lt "20" ]]; then
    echo -e "Your battery is on ${Yellow}$(echo $battery | jq -r ".percentage")%\n${Red}Make sure you're charge your phone${Reset}"
  else
    echo -e "Your battery is on ${Yellow}$(echo $battery | jq -r ".percentage")%.${Reset}"
fi
}
cmdShell() {
  if [[ ! -z "$(command -v zsh)" ]]; then
    zsh 2>> err.log
  else
    bash 2>> err.log
  fi
}
cmdEditor (){
  nvim $HOME/../
}
cmdVersion (){
  echo -e "Baller Shell ${Green}v1.0.0"
}
cmdHistory (){
  echo "zombie q" > .screenrc
  screen "cat $(pwd)/.history"
  echo "" > .screenrc
}
cmdUpdatePackage (){
  pkg upd -y 1> /dev/null
  pkg upg -y 1> /dev/null
  echo "Done!"
}
cmdMomJoke (){
  curl https://api.yomomma.info/ | jq -r ".joke"
}
