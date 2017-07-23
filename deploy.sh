#!/bin/bash
TIMEZONE="Europe/London"      
sudo sh -c "echo '$TIMEZONE' > /etc/timezone"                    
sudo cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
CURRENT_HOSTNAME='cat /etc/hostname | tr -d " \t\n\r"'
NEW_HOSTNAME=$1
if [ $!=="" ]; then;
 echo "Provide new hostname as a parameter when running this script";
fi;
sudo sh -c "echo '$NEW_HOSTNAME' > /etc/hostname"
sudo sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
sudo sh -c "echo 'start_x=1
gpu_mem=128
disable_camera_led=1' >> /boot/config.txt"
sudo sh -c "echo 'bcm2835-v4l2' >> /etc/modules"
sudo dpkg -i ffmpeg_3.1.1-1_armhf.deb
sudo apt-get install python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5 -y
sudo dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb
sudo pip install motioneye
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
sudo mkdir -p /var/lib/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye
