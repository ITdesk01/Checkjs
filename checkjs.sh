#!/bin/sh

#set -x
#set -u

version="1.0"
Script_file="/usr/share/Checkjs"
ListJs_add="ListJs_add.txt"
ListJs_drop="ListJs_drop.txt"
SCKEY=$(cat SCKEY.txt)
Wrap="%0D%0A%0D%0A%0D%0A%0D%0A" #Server酱换行

jd_scripts() {
	cd $Script_file
	Script_name="jd_scripts"
	File_path="$Script_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	if [ -d "$Script_name" ]; then
		cd $File_path
		git_pull
		init_data
		diff_cron
		sendMessage
	else
		git clone -b master https://github.com/lxk0301/jd_scripts.git
	fi
}


Quantumult_X() {
	cd $Script_file	
	Script_name="Quantumult-X"
	File_path="$Script_file/$Script_name/Scripts/JD"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	if [ -d "$Script_name" ]; then
		cd $File_path
		git_pull
		init_data
		diff_cron
		sendMessage
	else
		git clone https://github.com/799953468/Quantumult-X.git
	fi
}

hundun() {
	cd $Script_file
	Script_name="hundun"
	File_path="$Script_file/$Script_name/quanx"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	if [ -d "$Script_name" ]; then
		cd $File_path
		git_pull
		init_data
		diff_cron
		sendMessage
	else
		git clone https://github.com/whyour/hundun.git
	fi


}

MoPoQAQ_Script() {
	cd $Script_file
	Script_name="MoPoQAQ_Script"
	File_path="$Script_file/$Script_name/Me"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	if [ -d "$Script_name" ]; then
		cd $File_path
		git_pull
		init_data
		diff_cron
		sendMessage
	else
		git clone https://github.com/MoPoQAQ/Script.git MoPoQAQ_Script
	fi
}



git_pull() {
	git fetch --all
	git reset --hard origin/master	
}

init_data() {
	echo > $ListJs_add
	echo > $ListJs_drop
}

diff_cron() {
	#首次次运行需要创建oldfile
	if [ -f "$File_path/$Oldfile" ]; then
		echo ""
	else 
		ls ./ | grep -E "^j[dr]_.+\.js" | sort > $Oldfile
	fi

	#新文件与旧文件对比
	ls ./ | grep -E "^j[dr]_.+\.js" | sort > $Newfile
	grep -vwf $Newfile $Oldfile > $ListJs_add
	
	if [ $(cat $ListJs_add | wc -l) = "0" ]; then
		Add_if="0"
	else
		sed -i "s/js/js$Wrap/g" $ListJs_add
		Add=$(sed ':t;N;s/\n//;b t' $ListJs_add)
		Add_if="1"
	fi 
	

	#用旧文件与新文件对比
	grep -vwf $Oldfile $Newfile > $ListJs_drop
	ls ./ | grep -E "^j[dr]_.+\.js" | sort > $Oldfile
	if [ $(cat $ListJs_drop | wc -l) = "0" ]; then
		Delete_if="0"
	else
		sed -i "s/js/js$Wrap/g" $ListJs_drop
		Delete=$(sed ':t;N;s/\n//;b t' $ListJs_drop)
		Delete_if="1"
	fi 
}

sendMessage() {
	#检查有没有脚本更新
	if [ $Add_if = "1" ] || [ $Delete = "1" ]; then
		content="更新脚本有:$Wrap$Add删除脚本有:$Wrap$Delete"
	elif [ $Add_if = "1" ]; then 
		content="更新脚本有:$Wrap$Add"
	elif [ $Delete_if = "1" ]; then 
		content="删除脚本有:$Wrap$Delete"
	else
		content="no_update"
	fi
	
	#如果没有更新或者删除就不推送
	if [ $content = "no_update" ]; then
		echo "$Script_name没有更新也没有删除，一切风平浪静"
	else
		if [ $SCKEY = "" ]; then
			echo "Server酱的key为空，脚本停止运行，获取key办法：http://sc.ftqq.com/3.version，将获取到的key填入SCKEY.txt，重新运行脚本"
		else
			curl "http://sc.ftqq.com/$SCKEY.send?text=$Script_name&desp=$content" >/dev/null 2>&1 & 
		fi
		
	fi 
	
}

description_if() {
	if [ -f $Script_file/SCKEY.txt ]; then
		echo ""
	else
		echo > $Script_file/SCKEY.txt
	fi

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
		echo -e "          $green直接回车会重启你的系统!!!，如果不需要马上重启ctrl+c取消$white"
		echo "-----------------------------------------------------------------------"
		read a
		reboot	
	else
		

}


menu() {
	description_if
	jd_scripts
	Quantumult_X
	hundun
	MoPoQAQ_Script
}

menu

