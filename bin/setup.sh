#!/bin/bash
GRN='\033[0;32m'
RST='\033[0m'

sudo apt update && sudo apt -y full-upgrade -y

sudo apt install tmux htop p7zip wget -y

echo "${GRN}Installing cuda...${RST}"

sudo apt install ocl-icd-libopencl1 nvidia-cuda-toolkit -y

nvidia-smi

sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt-get update

sudo apt-get install mesa-common-dev freeglut3-dev -y


echo "${GRN}Installing hashcat...${RST}"

wget https://hashcat.net/files/hashcat-5.1.0.7z
p7zip -d hashcat-5.1.0.7z

ls /usr/bin/ | grep -i hash
sudo cp hashcat-5.1.0/hashcat64.bin /usr/bin/
sudo ln -s /usr/bin/hashcat64.bin /usr/bin/hashcat
sudo cp -Rv hashcat-5.1.0/OpenCL/ /usr/bin/
sudo cp hashcat-5.1.0/hashcat.hcstat2 /usr/bin/
sudo cp hashcat-5.1.0/hashcat.hctune /usr/bin/


echo "${GRN}Getting wordlists...${RST}"

git clone https://github.com/praetorian-inc/Hob0Rules

wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

echo "${GRN}Done!${RST}"

echo "${GRN}Testing hashcat...Press ctrl+c to cancel${RST}"

sudo hashcat --benchmark