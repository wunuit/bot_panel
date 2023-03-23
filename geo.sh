#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://wunuit.github.io/bot_panel.git
unzip bot_panel/geo.zip
pip3 install -r geo/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/geo/var.txt
echo -e ADMIN='"'$admin'"' >> /root/geo/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/geo/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo "Api Key        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/geo.service << END
[Unit]
Description=Simple geo - @geo
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m geo
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start geo 
systemctl enable geo

clear

echo " Installations complete, type /menu on your bot"
