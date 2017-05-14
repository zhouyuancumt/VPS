#! /bin/bash
ifconfig
read -p "input your IP : " IP
read -p "install shadowsocks ? (n or enter " TMP
if [ $TMP=="" ]
then apt install python python-pip
pip install shadowsocks
read -p "input your passworld : " PASSWD
echo "{
	    \"server\":\"$IP\",
	    \"server_port\":8388,
	    \"local_address\": \"127.0.0.1\",
	    \"local_port\":1080,
	    \"password\":\"$PASSWD\",
	    \"timeout\":300,
	    \"method\":\"aes-256-cfb\"
	}
	" > /etc/ss-config.json
ssserver -c /etc/ss-config.json -d start
echo "your ss config is : "
cat /etc/ss-config.json
fi
read -p "enter to continue "

read -p "use the aria2 webui ? (n or enter " TMP
if [ $TMP=="" ]
then apt install git aria2
git clone https://github.com/ziahamza/webui-aria2.git
cp -rf webui-aria2/* /var/www/html/
read -p "input user name : " USER
read -p "input passwd : " PASSWD
aria2c --enable-rpc --rpc-listen-all --rpc-user=$USER --rpc-passwd=$PASSWD -D
fi
read -p "enter to continue "

read -p "install ftp ? (n or enter" TMP
if [ $TMP=="" ]
then apt install vsftpd
service vsftpd start
fi
echo "Done ! thanks fo using !"
