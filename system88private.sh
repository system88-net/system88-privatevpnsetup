#--------------------------------------------------
#Login with root permission or use sudo su
#Moded by system88
#--------------------------------------------------
#Updates and Essential Packages
cd /root
apt-get update -y
apt-get install build-essential -y
#Downloading Server Daemon
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.29-9680-rtm/softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
cd vpnserver
#Installing Server Daemon
clear
make
cd /root
mv vpnserver /usr/local
sudo useradd -p server4 server4
echo -e "text1\ntext1" | passwd server4
rm -rf softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz
cd /usr/local/vpnserver
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver
#Installing Server Auto Run Script
wget https://raw.githubusercontent.com/AlexaOVH/SoftetherAutoInstallMultiPlatform/master/Debian%20and%20Ubuntu/vpn-server.sh --no-check-certificate
mv vpn-server.sh /etc/init.d/vpnserver
cd /etc/init.d/
chmod 755 vpnserver
update-rc.d vpnserver defaults
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
echo -------------------------------------------------------
echo  -e "ENCRYPTED SERVER TUNNEL INSTALLED(VPN)"
echo "Server is in /usr/local/vpnserver"
echo ---------------Softether Services----------------------
echo /etc/init.d/vpnserver start - to start
echo /etc/init.d/vpnserver restart - to restart
echo /etc/init.d/vpnserver stop - to stop
echo -------------------------------------------------------
/etc/init.d/vpnserver start
cd /root
