#!/bin/bash
red="\e[31;40;1m"
green="\e[32;40;1m"
blue="\e[0;36;1m"
white="\e[0m"
home_path="/data/data/com.termux/files/home/"
bin_path="/data/data/com.termux/files/usr/bin/"
storage_path="/data/data/com.termux/files/home/storage/shared/"

termux-setup-storage
echo -e "\n\n$red当更新过程停下来，且出现如下选择时：$white"
sleep 1
echo -e "\n$green*** motd (Y/I/N/O/D/Z) [default=N] ? $white"
sleep 1
echo -e "\n\n$red请手动输入Y，并按回车确认，即可继续安装$white"
sleep 1
echo -e "\n\n$red记住了吗？$white"
sleep 1
echo -e "\n\n$blue准备15s后开始！，请保持网络流畅，需要一些流量(10-20M)来更新，(下载不动的建议挂VPN)$white"
sleep 1
echo -e "\n\n$blue开始！$white\n\n"
pkg install git -y
if [ "$?" != "0" ];then
	echo -e "\n\n$red配置出错！请重试$white"
	exit
fi
apt update 
apt upgrade -y
if [ "$?" != "0" ];then
	echo -e "\n\n$red配置出错！请重试$white"
	exit
fi
Path=$(dirname $0)
cp "$Path"hzt $bin_path
chmod 776 "$bin_path"hzt
unzip -d "$storage_path"Code "$Path"Code.zip
echo "##Java代码文件所在的目录" > "$home_path"config.ini
echo 'JavaCode_path="/data/data/com.termux/files/home/storage/shared/Code/JavaCode/"' >> "$home_path"config.ini
echo "\n\n"  >> "$home_path"config.ini
echo '##Python代码文件所在的目录' >> "$home_path"config.ini
echo 'PythonCode_path="/data/data/com.termux/files/home/storage/shared/Code/PythonCode/"' >> "$home_path"config.ini
echo "\n\n"  >> "$home_path"config.ini
echo '##C语言代码文件所在的目录' >> "$home_path"config.ini
echo 'CCode_path="/data/data/com.termux/files/home/storage/shared/Code/CCode/"' >> "$home_path"config.ini
echo "\n\n"  >> "$home_path"config.ini
echo '##C++代码文件所在的目录' >> "$home_path"config.ini
echo 'CPlusPlusCode_path="/data/data/com.termux/files/home/storage/shared/Code/CPlusPlusCode/"' >> "$home_path"config.ini
echo "\n\n"  >> "$home_path"config.ini
echo '##JavaScript(node.js)代码文件所在的目录' >> "$home_path"config.ini
echo 'NodeJsCode_path="/data/data/com.termux/files/home/storage/shared/Code/NodeJsCode/"' >> "$home_path"config.ini
echo "\n\n"  >> "$home_path"config.ini
echo '##Java，Python，C，C++，JavaScript编译器的目录' >> "$home_path"config.ini
echo 'bin_path="/data/data/com.termux/files/usr/bin/"' >> "$home_path"config.ini
find $home_path"config.ini" >/dev/null 2>&1
if [ "$?" != "0" ];then
	echo -e "\n\n$red配置出错！请重试$white"
	exit
fi
find $bin_path"hzt" >/dev/null 2>&1
if [ "$?" != "0" ];then
	echo -e "\n\n$red配置出错！请重试$white"
	exit
fi
echo -e "\n\n$red配置完成！$white"
sleep 1
echo -e "\n\n$green 10s后脚本会自动清除屏幕and退出，请耐心等待……"
sleep 1
clear
history -w 
echo "Helper1" >"$home_path".bash_history
echo -e "\n\n\n\n\n\n\n$red请按下回车，告别吧！\n$white" & rm -rf $(dirname $0)
kill -9 $(ps -ef | grep "/data/data/com.termux/files/usr/bin/bash" |grep -v grep |awk -F " " '{print $2}') 
