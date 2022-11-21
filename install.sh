#!/data/data/com.termux/files/usr/bin/bash
echo "[*] Upgrading Packages"
apt update -y 1> /dev/null
apt upgrade -y 1> /dev/null
echo "[*] Installing wget, curl, git, ruby"
apt install wget curl git ruby -y
echo "[*] Forking repository"
fork https://github.com/crischutu07/Baller ./Baller/
rm ./Baller/install.sh
echo Done! Run ./start.sh to use.
exit 0
