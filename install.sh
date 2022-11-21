#!/data/data/com.termux/files/usr/bin/bash
echo "[*] Upgrading Packages"
pkg update -y 1> /dev/null
pkg upgrade -y 1> /dev/null
echo "[*] Installing wget, curl, git, ruby"
apt install wget curl git ruby -y 1> /dev/null
echo "[*] Forking repository"
git clone https://github.com/crischutu07/Baller ./Baller/
rm ./Baller/install.sh
chmod +x ./Baller/start.sh
rm ./Baller/LICENSE
rm ./Baller/README.md
echo "[*] Done! Access to Baller/ then run ./start.sh to use the script."
exit 0
