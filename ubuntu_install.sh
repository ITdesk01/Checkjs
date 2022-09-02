#!/bin/sh

#set -x
#set -u

version="1.1"
cron_file="/etc/crontabs/root"
#获取当前脚本目录copy脚本之家
Source="$0"
while [ -h "$Source"  ]; do
    dir_file="$( cd -P "$( dirname "$Source"  )" && pwd  )"
    Source="$(readlink "$Source")"
    [[ $Source != /*  ]] && Source="$dir_file/$Source"
done
dir_file="$( cd -P "$( dirname "$Source"  )" && pwd  )"

ListJs_add="ListJs_add.txt"
ListJs_drop="ListJs_drop.txt"

menu() {
	sys_if
	sys_install
}
sys_if() {
	#检测系统版本
	if [ ! `cat /etc/issue | grep -o "Ubuntu 18.04" | wc -l` == "1" ];then
		echo　"检测到系统不属于Ubuntu 18.04，不做其他处理"
		exit 0
	fi
	#检测空间大小
	df_size_remaining=$(df -hl | grep overlay | awk '{print $4}')
	df_size_remaining_num=$(echo "$df_size_remaining"| sed "s/G//g" -e "s/M//g" -e "s/K//g")
	if [ `echo $df_size_remaining | grep -o "G"` == "G"  ];then
		echo ""
	elif [ `echo $df_size_remaining | grep -o "M"` == "M" ];then
		if [ "$df_size_remaining_num" -gt "900" ];then
			echo ""
		else
			echo "你的空间只剩下：$df_size_remaining，根本不够装依赖，扩容一下的空间先,起码大于１Ｇ"
		fi
	elif [ `echo $df_size_remaining | grep -o "K"` == "K" ];then
		echo "你的空间只剩下：$df_size_remaining，根本不够装依赖，扩容一下的空间先"
		exit 0	
	else
		echo "未知的代码：$df_size_remaining"
		exit 0
	fi
	
	#检测网络
	network_if=$(curl -I -m 2 -s -w "%{http_code}\n" -o /dev/null   www.google.com)
	if [ "$network_if" == "200"];then
		echo "你docker可以连接google，欢迎使用"
	else
		echo "你docker无法连接google"
	fi


}
sys_install() {
	echo "开始更新系统"
	apt update
	apt install python3 python3-pip
	pip3 install telethon
	cd /root
	wget https://raw.githubusercontent.com/ITdesk01/Checkjs/main/tg.py
	python3 tg.py
}



action1="$1"
if [ -z $action1 ]; then
	menu
else
	case "$action1" in
			update_script|system_variable|menu|that_day_push|help|task_delete|ds_setup)
			$action1
			;;
			*)
			help
			;;
esac
fi




