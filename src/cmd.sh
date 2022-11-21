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
${Green}- ${Yellow}momjoke ${Reset}(Tell me mom joke)
${Green}- ${Yellow}dadjoke ${Reset}(Tell me dad joke)"""
}
cmdLicense (){
  echo -e """MIT License
  Copyright (c) 2022 ${Yellow}crischutu07${Reset}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."""
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
cmdDadJoke (){
  shuf -n 1 dad.txt
}
