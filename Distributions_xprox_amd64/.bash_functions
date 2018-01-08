# Author: Surbhit Awasthi And Abhishek Kr. Singh
# 
######################################

function proxify()
{
	export http_proxy=""
	export https_proxy=""
	cd ~/Distributions_u910e_xprox_amd64/
	ip=`python3 GrepProxy.py`
	
	if [ $ip == "0" ] 
	then
		echo "Server not responding"
		cd
	else

		finalIpHTTP="http://edcguest:edcguest@$ip:3128/"
		finalIpHTTPS="http://edcguest:edcguest@$ip:3128/"
		echo -e "Proxy set to : $ip\nPlease manage manually if the proxy doesn't work in your area :P"
		gsettings set org.gnome.system.proxy.http host "$ip"
		gsettings set org.gnome.system.proxy.http port "3128"
		gsettings set org.gnome.system.proxy.https host "$ip"
		gsettings set org.gnome.system.proxy.https port "3128"
		gsettings set org.gnome.system.proxy.ftp host "$ip"
		gsettings set org.gnome.system.proxy.ftp port "3128"
		
		export http_proxy=$finalIpHTTP
		export https_proxy=$finalIpHTTPS
		
		cd
		
		`. .profile`
		`. .bashrc`
	fi
}
