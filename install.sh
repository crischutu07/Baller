#!/data/data/com.termux/files/usr/bin/bash
echo "[*] Upgrading Packages"
apt update -y 1> /dev/null
apt upgrade -y 1> /dev/null
echo "[*] Installing wget, curl, git, ruby"
apt install wget curl git ruby -y 1> /dev/null
echo "[*] Forking repository"
git clone https://github.com/crischutu07/Baller ./Baller/
rm ./Baller/install.sh
chmod +x ./Baller/start.sh
rm ./Baller/LICENSE
rm ./Baller/README.md
echo "[*] Done! Run ./start.sh to use."
exit 0
