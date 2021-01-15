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
Wrap="%0D%0A%0D%0A%0D%0A%0D%0A" #Server酱换行

red="\033[31m"
green="\033[32m"
yellow="\033[33m"
white="\033[0m"

jd_scripts() {
	cd $dir_file
	Script_name="jd_scripts"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		#git clone -b master https://github.com/lxk0301/jd_scripts.git
		git clone -b master https://gitee.com/lxk0301/jd_scripts.git
		tongyong_config
	fi
}


Quantumult_X() {
	cd $dir_file
	Script_name="Quantumult-X"
	File_path="$dir_file/$Script_name/Scripts/JD"
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
	cd $dir_file
	Script_name="hundun"
	File_path="$dir_file/$Script_name/quanx"
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
	cd $dir_file
	Script_name="MoPoQAQ_Script"
	File_path="$dir_file/$Script_name/Me"
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

shylocks_Script() {
	cd $dir_file
	Script_name="shylocks_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/shylocks/Loon.git shylocks_Script
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
	cd $dir_file
	branch="main"
	git_pull
}


description_if() {
	if [ -f $dir_file/SCKEY.txt ]; then
		SCKEY=$(cat $dir_file/SCKEY.txt)
		if [ ! $SCKEY ]; then
			echo ""
			echo -e "$red Server酱的key为空$white，脚本停止运行，$green获取key办法：http://sc.ftqq.com/3.version，$white将获取到的key填入$green$dir_file/SCKEY.txt，$white重新运行脚本"
			echo ""
			exit
		fi
	else
		echo > $dir_file/SCKEY.txt
	fi

	task
	system_variable
	clear
}

task() {
	cron_version="1.4"
	if [ `grep -o "checkjs的定时任务$cron_version" $cron_file |wc -l` == "0" ]; then
		echo "不存在计划任务开始设置"
		task_delete
		task_add
		echo "计划任务设置完成"
	elif [ `grep -o "checkjs的定时任务$cron_version" $cron_file |wc -l` == "1" ]; then
			echo "计划任务与设定一致，不做改变"
	fi

}
task_add() {
cat >>/etc/crontabs/root <<EOF
#**********这里是checkjs的定时任务$cron_version版本**********#
15 */4 * * * $dir_file/checkjs.sh >/tmp/checkjs.log 2>&1
45 21 * * * $dir_file/checkjs.sh update_script  >/tmp/checkjs_update_script.log 2>&1
###########102##########请将其他定时任务放到底下###############
EOF
/etc/init.d/cron restart
}
task_delete() {
	sed -i '/checkjs/d' /etc/crontabs/root >/dev/null 2>&1
	sed -i '/#102#/d' /etc/crontabs/root >/dev/null 2>&1
}

ds_setup() {
	echo "checkjs删除定时任务设置"
	task_delete
	echo "checkjs删除全局变量"
	sed -i '/checkjs/d' /etc/profile >/dev/null 2>&1
	. /etc/profile
	echo "checkjs定时任务和全局变量删除完成，脚本不会自动运行了"
}


system_variable() {
	#添加系统变量
	checkjs_path=$(cat /etc/profile | grep -o checkjs.sh | wc -l)
	if [ "$checkjs_path" == "0" ]; then
		echo "export checkjs_file=$dir_file" |  tee -a /etc/profile
		echo "export checkjs=$dir_file/checkjs.sh" |  tee -a /etc/profile
		. /etc/profile
	fi
}


menu() {
	description_if
	echo "----------------------------------------------"
	echo -e "$green Checkjs $version开始检查脚本新增或删除情况$white"
	echo "----------------------------------------------"
	echo -e "$green 当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	if [ ! -x $dir_file/checkjs.sh ];then
		echo "添加权限"
		chmod 755 $dir_file/checkjs.sh
		sh $dir_file/checkjs.sh
	fi
	jd_scripts
	Quantumult_X
	hundun
	#MoPoQAQ_Script
	shylocks_Script
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



