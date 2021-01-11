#!/bin/sh

#set -x
#set -u

version="1.1"
Script_file="/usr/share/Checkjs"
ListJs_add="ListJs_add.txt"
ListJs_drop="ListJs_drop.txt"
Wrap="%0D%0A%0D%0A%0D%0A%0D%0A" #Server酱换行

red="\033[31m"
green="\033[32m"
yellow="\033[33m"
white="\033[0m"

jd_scripts() {
	cd $Script_file
	Script_name="jd_scripts"
	File_path="$Script_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone -b master https://github.com/lxk0301/jd_scripts.git
		tongyong_config
	fi
}


Quantumult_X() {
	cd $Script_file	
	Script_name="Quantumult-X"
	File_path="$Script_file/$Script_name/Scripts/JD"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/799953468/Quantumult-X.git
		tongyong_config
	fi
}

hundun() {
	cd $Script_file
	Script_name="hundun"
	File_path="$Script_file/$Script_name/quanx"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/whyour/hundun.git
		tongyong_config
	fi
}

MoPoQAQ_Script() {
	cd $Script_file
	Script_name="MoPoQAQ_Script"
	File_path="$Script_file/$Script_name/Me"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/MoPoQAQ/Script.git MoPoQAQ_Script
		tongyong_config
	fi
}

tongyong_config() {
	echo ""
	cd $File_path
	git_pull
	init_data
	diff_cron
	sendMessage
}


git_pull() {
	git fetch --all
	git reset --hard origin/$branch
}

init_data() {
	echo > $ListJs_add
	echo > $ListJs_drop
}

diff_cron() {
	#首次运行需要创建oldfile
	if [ -f "$File_path/$Oldfile" ]; then
		echo ""
	else 
		ls ./ | grep -E "^j" | sort > $Oldfile
	fi

	#新文件与旧文件对比
	ls ./ | grep -E "^j" | sort > $Newfile
	grep -vwf $Oldfile $Newfile > $ListJs_add
	
	if [ $(cat $ListJs_add | wc -l) = "0" ]; then
		Add_if="0"
	else
		sed -i "s/js/js$Wrap/g" $ListJs_add
		Add=$(sed ':t;N;s/\n//;b t' $ListJs_add)
		Add_if="1"
	fi 
	

	#用旧文件与新文件对比
	grep -vwf $Newfile $Oldfile > $ListJs_drop
	ls ./ | grep -E "^j" | sort > $Oldfile
	if [ $(cat $ListJs_drop | wc -l) = "0" ]; then
		Delete_if="0"
	else
		sed -i "s/js/js$Wrap/g" $ListJs_drop
		Delete=$(sed ':t;N;s/\n//;b t' $ListJs_drop)
		Delete_if="1"
	fi 
}

sendMessage() {
	#检查有没有脚本新增
	cat_add=$(cat $ListJs_add | wc -l)
	cat_delete=$(cat $ListJs_drop | wc -l )
	if [ $Add_if = "1" ] && [ $Delete_if = "1" ]; then
		num="新增$cat_add脚本删除$cat_delete脚本"
		content="新增脚本有:$Wrap$Add删除脚本有:$Wrap$Delete"
	elif [ $Add_if = "1" ]; then 
		num="新增$cat_add脚本"
		content="新增脚本有:$Wrap$Add"
	elif [ $Delete_if = "1" ]; then 
		num="删除$cat_delete脚本"
		content="删除脚本有:$Wrap$Delete"
	else
		content="no_update"
	fi
	
	#如果没有新增或者删除就不推送
	if [ $content = "no_update" ]; then
		echo -e "$green[$Script_name] $white$yellow没有新增也没有删除脚本，一切风平浪静$white"
		echo "**********************************************"
	else
		echo -e "$green[$Script_name] 新增$cat_add脚本,删除$cat_delete脚本，已推送到你的接收设备$white"
		echo "**********************************************"
		curl "http://sc.ftqq.com/$SCKEY.send?text=$Script_name$num&desp=$content" >/dev/null 2>&1 &
	fi 
	
}

update_script() {
	echo -e "$green 开始更新checkjs，当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	cd $Script_file
	branch="main"
	git_pull
	chmod 755 checkjs.sh
}


description_if() {
	if [ -f $Script_file/SCKEY.txt ]; then
		SCKEY=$(cat $Script_file/SCKEY.txt)
		if [ ! $SCKEY ]; then
			echo ""
			echo -e "$red Server酱的key为空$white，脚本停止运行，$green获取key办法：http://sc.ftqq.com/3.version，$white将获取到的key填入$green$Script_file/SCKEY.txt，$white重新运行脚本"
			echo ""
			exit
		fi
	else
		echo > $Script_file/SCKEY.txt
	fi

	system_variable

	clear
}

system_variable() {
	#添加系统变量
	checkjs_path=$(cat /etc/profile | grep -o checkjs.sh | wc -l)
	if [ "$checkjs_path" == "0" ]; then
		echo "export checkjs_file=/usr/share/Checkjs" |  tee -a /etc/profile
		echo "export checkjs=/usr/share/Checkjs/checkjs.sh" |  tee -a /etc/profile
		echo "-----------------------------------------------------------------------"
		echo ""
		echo -e "$green添加checkjs变量成功,重启系统以后无论在那个目录输入 sh \$checkjs 都可以运行脚本$white"
		echo ""
		echo ""
		echo -e "          $green重启以后就可以看到效果了$white"
		echo "-----------------------------------------------------------------------"
	else
		echo ""
	fi
}


menu() {
	description_if
	echo "----------------------------------------------"
	echo -e "$green Checkjs $version开始检查脚本新增或删除情况$white"
	echo "----------------------------------------------"
	echo -e "$green 当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	jd_scripts
	Quantumult_X
	hundun
	MoPoQAQ_Script
}


action1="$1"
if [ -z $action1 ]; then
	menu
else
	case "$action1" in
			update_script|system_variable|menu)
			$action1
			;;
			*)
			echo "请不要乱输，我是不会执行的。。。"
			exit
			;;
esac
fi



