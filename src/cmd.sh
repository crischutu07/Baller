#!/data/data/com.termux/files/usr/bin/bash
# THIS IS CONFIG, FUNCTION FILES
# PLEASE DDN'T TOUCH!
# RUN THIS BY TYPING -> bash src/cmd.sh IF YOU'RE ON MAIN FOLDER
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
${Green}- ${Yellow}joke ${Reset}(Tell me dad or mom joke)"""
}
cmdLicense (){
  echo -e """MIT License
Copyright (c) 2022 ${Yellow}crischutu07${Reset}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""
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
    if [[ $(command -v zsh ) == "" ]]; then
        bash
    else
        zsh
    fi
}
cmdEditor (){
  eval $EDITOR $HOME/../
}
cmdVersion (){
  echo -e "Baller Shell ${Green}v1.0.0 (Termux ${Yellow}v${TERMUX_VERSION})${Reset}"
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
cmdJoke (){
  echo "Select Joke:"
  echo -e "[${Green}1${Reset}]${Yellow} Dad Joke${Reset}"
  printf "[${Green}2${Reset}]${Yellow} Mom Joke${Reset}\n→ " && read joke
  case $joke in
    "1") curl https://api.yomomma.info/ | jq -r ".joke";;
    "2") shuf -n 1 src/dad.txt;;
    *) echo -e "${Red}Number is required${Reset}";;
  esac
}
