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


if [ "$dir_file" == "/usr/share/jd_openwrt_script/Checkjs" ];then
	SCKEY=$(grep "let SCKEY" /usr/share/jd_openwrt_script/script_config/sendNotify.js  | awk -F "'" '{print $2}')
	if [ ! $SCKEY ];then
		SCKEY=$(cat $dir_file/Checkjs_Sckey.txt)
	fi
else
	SCKEY=$(cat $dir_file/Checkjs_Sckey.txt)
fi


ListJs_add="ListJs_add.txt"
ListJs_drop="ListJs_drop.txt"

wrap="%0D%0A%0D%0A" #Server酱换行
wrap_tab="     "
current_time=$(date +"%Y-%m-%d")
by="#### 脚本仓库地址:https://github.com/ITdesk01/Checkjs"

#推送log日志到server酱的时间
push_server_time="22"


red="\033[31m"
green="\033[32m"
yellow="\033[33m"
white="\033[0m"


jd_scripts_gitee() {
	cd $dir_file
	Script_name="jd_scripts_gitee"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	#url_test="https://gitee.com/lxk0301/jd_scripts/raw/master/README.md"
	if [ -d "$Script_name" ]; then
		#tongyong_config
		cd $File_path
		git_pull
		init_data
		diff_cron
		sendMessage
		That_day
	else
		git clone -b master git@gitee.com:lxk0301/jd_scripts.git jd_scripts_gitee
		#tongyong_config
	fi
}

curtinlv_script() {
	cd $dir_file
	Script_name="curtinlv_script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="1"
	url_test="https://raw.githubusercontent.com/curtinlv/JD-Script/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/curtinlv/JD-Script.git curtinlv_script
		tongyong_config
	fi
}

ZCY01_Script() {
	cd $dir_file
	Script_name="ZCY01_Script"
	File_path="$dir_file/$Script_name/jd"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/ZCY01/daily_scripts/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/ZCY01/daily_scripts.git ZCY01_Script
		tongyong_config
	fi
}

JDHelloWorld() {
	cd $dir_file
	Script_name="JDHelloWorld"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="1"
	url_test="https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/JDHelloWorld/jd_scripts.git JDHelloWorld
		tongyong_config
	fi

}

nianyuguai() {
	cd $dir_file
	Script_name="nianyuguai"
	File_path="$dir_file/$Script_name/qx"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/longzhuzhu/nianyu/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/longzhuzhu/nianyu.git nianyuguai
		tongyong_config
	fi
}

passerby() {
	cd $dir_file
	Script_name="passerby"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/passerby-b/JDDJ/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/passerby-b/JDDJ.git passerby
		tongyong_config
	fi
}

Wenmoux() {
	cd $dir_file
	Script_name="Wenmoux"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="wen"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/Wenmoux/scripts/wen/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/Wenmoux/scripts.git Wenmoux
		tongyong_config
	fi
}

zooPanda() {
	cd $dir_file
	Script_name="zooPanda"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="dev"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/zooPanda/zoo/dev/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/zooPanda/zoo.git zooPanda
		tongyong_config
	fi
}

panghu999() {
	cd $dir_file
	Script_name="panghu999"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://github.com/panghu999/panghu/blob/master/jdCookie.js"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/panghu999/panghu.git panghu999
		tongyong_config
	fi
}

panghu999_jd() {
	cd $dir_file
	Script_name="panghu999_jd"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/panghu999/jd_scripts/master/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/panghu999/jd_scripts.git panghu999_jd
		tongyong_config
	fi
}

fangpidedongsun() {
	cd $dir_file
	Script_name="fangpidedongsun"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/fangpidedongsun/jd_scripts2/master/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/fangpidedongsun/jd_scripts2.git fangpidedongsun
		tongyong_config
	fi
}

yangtingxiao() {
	cd $dir_file
	Script_name="yangtingxiao"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/yangtingxiao/QuantumultX.git yangtingxiao
		tongyong_config
	fi
}

Quantumult_X() {
	cd $dir_file
	Script_name="Quantumult-X"
	File_path="$dir_file/$Script_name/script/JD"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/799953468/Quantumult-X/master/script/JD/jd_bean_change.js"
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
	for_diff="0"
	url_test="https://raw.githubusercontent.com/whyour/hundun/master/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/whyour/hundun.git
		tongyong_config
	fi
}

ZhiYi_Script() {
	cd $dir_file
	Script_name="ZhiYi_Script"
	File_path="$dir_file/$Script_name/Scripts"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	url_test="https://raw.githubusercontent.com/ZhiYi-N/Private-Script/master/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git clone https://github.com/ZhiYi-N/Private-Script.git ZhiYi_Script
		tongyong_config
	fi

}

tongyong_config() {
	echo ""
	wget --spider -nv  $url_test -o /tmp/wget_test.log
	wget_test=$( cat /tmp/wget_test.log | grep -o "200 OK")
	if [ "$wget_test" == "200 OK" ];then
		cd $File_path
		git_pull
		init_data
		if [ $for_diff == "1" ];then
			for_diff_cron
		else
			diff_cron
		fi
		sendMessage
		That_day
	else
		echo "#### 《$Script_name+$current_time》" >>$dir_file/git_log/${current_time}.log
		wget_error="$green[$Script_name]$red无法下载仓库文件，暂时不更新,可能是网络问题或者上游仓库被封，建议查看上游仓库是否正常，测试仓库是否正常：$url_test$white"
		echo -e "$wget_error"
		echo "$wget_error" | sed -e "s/\\\//g" -e "s/\[//g" -e "s/033//g" -e "s/0m//g" -e "s/31m//g" -e "s/32m//g" -e "s/可能/$wrap$wrap_tab可能/g" -e "s/建议/$wrap$wrap_tab建议/g"  >>$dir_file/git_log/${current_time}.log
		echo "**********************************************"
	fi
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
		ls ./ | grep -E "js$" | sort > $Oldfile
	fi
	#.*表示多个任意字符
	#新文件与旧文件对比
	ls ./ | grep -E "js$" | sort > $Newfile
	grep -vwf $Oldfile $Newfile > $ListJs_add
	
	if [ $(cat $ListJs_add | wc -l) = "0" ]; then
		Add_if="0"
	else
		Add=$(sed "s/$/$wrap$wrap_tab/" $ListJs_add | sed ':t;N;s/\n//;b t' )
		Add_if="1"
	fi 
	

	#用旧文件与新文件对比
	grep -vwf $Newfile $Oldfile > $ListJs_drop
	ls ./ | grep -E "js$" | sort > $Oldfile
	if [ $(cat $ListJs_drop | wc -l) = "0" ]; then
		Delete_if="0"
	else
		Delete=$(sed "s/$/$wrap$wrap_tab/" $ListJs_drop | sed ':t;N;s/\n//;b t' )
		Delete_if="1"
	fi 
}

for_diff_cron() {
	#首次运行需要创建oldfile
	if [ -f "$File_path/$Oldfile" ]; then
		echo ""
	else
		ls ./ | grep -E "js$" | sort > $File_path/$Oldfile
		for i in `ls | grep -v "backup"`
		do
			if [ -d $i ];then
				ls $i | grep -E "js$" | sort >> $File_path/$Oldfile
			else
				echo "" >/dev/null 2>&1
			fi
		done
	fi

	#.*表示多个任意字符
	#新文件与旧文件对比
	ls ./ | grep -E "js$" | sort > $File_path/$Newfile
	for i in `ls | grep -v "backup"`
	do
		if [ -d $i ];then
			ls $i | grep -E "js$" | sort >> $File_path/$Newfile
		else
			echo "" >/dev/null 2>&1
		fi
	done

	grep -vwf $Oldfile $Newfile > $ListJs_add

	if [ $(cat $ListJs_add | wc -l) = "0" ]; then
		Add_if="0"
	else
		Add=$(sed "s/$/$wrap$wrap_tab/" $ListJs_add | sed ':t;N;s/\n//;b t' )
		Add_if="1"
	fi

	#用旧文件与新文件对比
	grep -vwf $Newfile $Oldfile > $ListJs_drop
	ls ./ | grep -E "js$" | sort > $File_path/$Oldfile
	for i in `ls | grep -v "backup"`
	do
		if [ -d $i ];then
			ls $i | grep -E "js$" | sort >> $File_path/$Oldfile
		else
			echo "" >/dev/null 2>&1
		fi
	done

	if [ $(cat $ListJs_drop | wc -l) = "0" ]; then
		Delete_if="0"
	else
		Delete=$(sed "s/$/$wrap$wrap_tab/" $ListJs_drop | sed ':t;N;s/\n//;b t' )
		Delete_if="1"
	fi
}

sendMessage() {
	#检查有没有脚本新增
	cat_add=$(cat $ListJs_add | wc -l)
	cat_delete=$(cat $ListJs_drop | wc -l )
	if [ $Add_if = "1" ] && [ $Delete_if = "1" ]; then
		num="新增$cat_add脚本删除$cat_delete脚本"
		content=$(echo "#### 新增脚本有:$wrap$wrap_tab$Add#### 删除脚本有:$wrap$wrap_tab$Delete" | sed "s/$wrap_tab####/####/g")
	elif [ $Add_if = "1" ]; then 
		num="新增$cat_add脚本"
		content="#### 新增脚本有:$wrap$wrap_tab$Add"
	elif [ $Delete_if = "1" ]; then 
		num="删除$cat_delete脚本"
		content="#### 删除脚本有:$wrap$wrap_tab$Delete"
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
		curl -s "http://sc.ftqq.com/$SCKEY.send?text=$Script_name$num" -d "&desp=$content" >/dev/null 2>&1
	fi 
	
}

#检测当天更新情况并推送
That_day() {
	git_log=$(git log --format=format:"%ai %an %s" --since="$current_time 00:00:00" --before="$current_time 23:59:59" | sed "s/+0800//g" | sed "s/+0000/时区0000/g" | sed "s/$current_time //g" | sed "s/ /+/g")
	if [ ! $git_log  ];then
		echo "#### 《$Script_name+$current_time》" >>$dir_file/git_log/${current_time}.log
		echo "没有任何更新" >>$dir_file/git_log/${current_time}.log
	else
		echo "#### 《$Script_name+$current_time+更新日志》" >> $dir_file/git_log/${current_time}.log
		echo "  时间     +作者    +操作" >> $dir_file/git_log/${current_time}.log
		echo "$git_log" >> $dir_file/git_log/${current_time}.log
	fi

}

That_day_sendMessage() {
	log_sort=$(cat  $dir_file/git_log/${current_time}.log | sed "s/&/+/g" | sed "s/$/$wrap$wrap_tab/" | sed ':t;N;s/\n//;b t' | sed "s/$wrap_tab####/####/g")
	log_sort1=$(echo "${log_sort}${by}" | sed "s/$wrap_tab####/####/g" )
	if [ ! $SCKEY ];then
			echo "没找到Server酱key不做操作"
	else
		if [ ! $log_sort1 ];then
			echo -e "$red 推送失败$white，请检查 $dir_file/git_log/${current_time}.log是否存在"
		else
			echo -e "$green 开始推送Checkjs检测仓库状态$white"
			curl -s "http://sc.ftqq.com/$SCKEY.send?text=Checkjs检测仓库状态" -d "&desp=$log_sort1" >/dev/null 2>&1
			sleep 3
			echo -e "$green 推送完成$white"
		fi
	fi
}


that_day_push() {
	menu
	echo -e "$green无视时间规则开始推送$white"
	That_day_sendMessage
}



update_script() {
	echo -e "$green 开始更新checkjs，当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	cd $dir_file
	branch="main"
	git_pull
}


description_if() {
	install_script="/usr/share/Install_script"
	install_script_config="/usr/share/Install_script/script_config"
	if [ "$dir_file" == "$install_script/Checkjs" ];then
		if [ ! -f "$install_script_config/Checkjs_Sckey.txt" ]; then
			echo > $dir_file/Checkjs_Sckey.txt
			rm -rf $dir_file/Checkjs_Sckey.txt #用于删除旧的链接
			ln -s $install_script_config/Checkjs_Sckey.txt $dir_file/Checkjs_Sckey.txt
		fi

		#用于升级以后恢复链接
		if [ ! -f "$dir_file/Checkjs_Sckey.txt" ]; then
			ln -s $install_script_config/Checkjs_Sckey.txt $dir_file/Checkjs_Sckey.txt
		fi

	else
		if [ ! -f $dir_file/Checkjs_Sckey.txt ]; then
			echo > $dir_file/Checkjs_Sckey.txt
		fi
	fi

	if [ ! -d $dir_file/git_log ];then
		mkdir 	$dir_file/git_log
	fi

	if [ ! $SCKEY ]; then
		echo ""
		echo -e "$red Server酱的key为空$white，脚本无法推送，$green获取key办法：http://sc.ftqq.com/3.version，$white将获取到的key填入$green$dir_file/Checkjs_Sckey.txt，$white重新运行脚本"
		echo ""
		exit 0
	fi

	echo "稍等一下，正在取回远端脚本源码，用于比较现在脚本源码，速度看你网络"
	cd $dir_file
	git fetch
	if [[ $? -eq 0 ]]; then
		echo ""
	else
		echo -e "$red>> 取回分支没有成功，重新执行代码$white"
		description_if
	fi
	clear
	git_branch=$(git branch -v | grep -o behind )
	if [[ "$git_branch" == "behind" ]]; then
		echo -e "$green 检测到有更新，开始自动更新。。"
		update_script
		sleep 2
		sh $dir_file/checkjs.sh
	else
		Script_status="$green最新$white"
	fi

	if [ ! -x $dir_file/checkjs.sh ];then
		echo "添加权限"
		chmod 755 $dir_file/checkjs.sh
		sh $dir_file/checkjs.sh
	fi

	task
	system_variable
	clear
}

task() {
	cron_version="2.3"
	if [ `grep -o "Checkjs的定时任务$cron_version" $cron_file |wc -l` == "0" ]; then
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
#**********这里是Checkjs的定时任务$cron_version版本**********#102#
0 */2 * * * $dir_file/checkjs.sh >/tmp/checkjs.log 2>&1 #102#
45 21 * * * $dir_file/checkjs.sh update_script  >/tmp/checkjs_update_script.log 2>&1 #102#
###################请将其他定时任务放到底下#########102#
EOF
/etc/init.d/cron restart
}
task_delete() {
	echo "开始删除定时任务"
	sed -i '/Checkjs/d' /etc/crontabs/root >/dev/null 2>&1
	sed -i '/#102#/d' /etc/crontabs/root >/dev/null 2>&1
	sleep 5
	echo "删除完成，如果需要重新跑，执行sh \$checkjs"
}

ds_setup() {
	clear
	echo "十秒钟以后开始删除，ctrl+c停止"
	sleep 10
	echo "checkjs删除定时任务设置"
	task_delete
	sleep 5
	echo "checkjs删除全局变量"
	sed -i '/checkjs/d' /etc/profile >/dev/null 2>&1
	. /etc/profile
	sleep 5
	echo "删除整个脚本文件目录"
	rm -rf $dir_file
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
	echo ""
	echo -e "$yellow无视时间规则直接推送:$green sh \$checkjs that_day_push$white"
	echo "----------------------------------------------"
	echo -e "$green 当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	echo -e "$yellow 检测脚本是否最新:$white $Script_status "
	echo "**********************************************"
	echo > $dir_file/git_log/${current_time}.log
	jd_scripts_gitee
	curtinlv_script
	nianyuguai
	passerby
	JDHelloWorld
	zooPanda
	panghu999
	panghu999_jd
	fangpidedongsun
	Wenmoux
	yangtingxiao
	ZCY01_Script
	Quantumult_X
	hundun
	ZhiYi_Script
	rm -rf $dir_file/shylocks_Script_gitee

	if [ $(date +%H) == "12" ];then
		echo "12点开始推送今天的github更新记录"
		That_day_sendMessage
	elif [ $(date +%H) == "22" ];then
		echo "22点开始推送今天的github更新记录"
		That_day_sendMessage
	fi
}

help() {
	clear
	echo "----------------------------"
	echo "      Checkjs用法"
	echo "----------------------------"
	echo ""
	echo "1.更新脚本"
	echo " sh \$checkjs update_script"
	echo ""
	echo "2.无视当前时间规则推送"
	echo " sh \$checkjs that_day_push"
	echo ""
	echo "3.删除当前的定时任务，暂时停止脚本"
	echo " sh \$checkjs task_delete"
	echo ""
	echo "4.删除这个脚本所有创建的文件，包括脚本自己"
	echo "sh \$checkjs ds_setup"
	echo ""
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



