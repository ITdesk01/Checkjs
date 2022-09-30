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

node="/usr/bin/node"
python3="/usr/bin/python3"

ListJs_add="ListJs_add.txt"
ListJs_drop="ListJs_drop.txt"

#检测当前位置
if [ "$dir_file" == "/usr/share/jd_openwrt_script/Checkjs" ];then
	openwrt_script="/usr/share/jd_openwrt_script"
	openwrt_script_config="/usr/share/jd_openwrt_script/script_config"
else
	echo ""
fi


if [ ! -f $openwrt_script_config/Checkjs_Sckey.txt ];then
	echo >$openwrt_script_config/Checkjs_Sckey.txt
else
	echo >$dir_file/Checkjs_Sckey.txt
fi

if [ "$dir_file" == "/usr/share/jd_openwrt_script/Checkjs" ];then
	SCKEY=$(grep "let SCKEY" $openwrt_script_config/sendNotify.js  | awk -F "'" '{print $2}')
	if [ ! $SCKEY ];then
		SCKEY=$(cat $openwrt_script_config/Checkjs_Sckey.txt)
	fi
	push_if=$(grep "push_if=" $openwrt_script_config/jd_openwrt_script_config.txt | awk -F "'" '{print $2}')
	weixin2=$(grep "weixin2=" $openwrt_script_config/jd_openwrt_script_config.txt | awk -F "'" '{print $2}')
else
	SCKEY=$(cat $dir_file/Checkjs_Sckey.txt)
fi

#企业微信
weixin_line="------------------------------------------------"

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

JDWXX_Script() {
	cd $dir_file
	Script_name="JDWXX_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	git_clone_url="https://github.com/JDWXX/jd_job.git"
	url_test="https://raw.githubusercontent.com/JDWXX/jd_job/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

Github_6dylan6_Script() {
	cd $dir_file
	Script_name="Github_6dylan6_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/6dylan6/jdpro.git"
	url_test="https://raw.githubusercontent.com/6dylan6/jdpro/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

KingRan_Script() {
	cd $dir_file
	Script_name="KingRan_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/KingRan/KR.git"
	url_test="https://raw.githubusercontent.com/KingRan/KR/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

Ariszy_Script() {
	cd $dir_file
	Script_name="Ariszy_Script"
	File_path="$dir_file/$Script_name/JD"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	git_clone_url="https://github.com/Ariszy/Private-Script.git"
	url_test="https://raw.githubusercontent.com/Ariszy/Private-Script/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

cdle_carry_Script() {
	cd $dir_file
	Script_name="cdle_carry_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/cdle/carry.git"
	url_test="https://raw.githubusercontent.com/cdle/carry/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

X1a0He() {
	cd $dir_file
	Script_name="X1a0He"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/X1a0He/jd_scripts_fixed.git"
	url_test="https://raw.githubusercontent.com/X1a0He/jd_scripts_fixed/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

ccwav() {
	cd $dir_file
	Script_name="ccwav"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/ccwav/QLScript2.git"
	url_test="https://raw.githubusercontent.com/ccwav/QLScript2/main/README.md"
	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

yuannian1112() {
	cd $dir_file
	Script_name="yuannian1112"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/yuannian1112/jd_scripts.git"
	url_test="https://raw.githubusercontent.com/yuannian1112/jd_scripts/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/curtinlv/JD-Script.git"
	url_test="https://raw.githubusercontent.com/curtinlv/JD-Script/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/ZCY01/daily_scripts.git"
	url_test="https://raw.githubusercontent.com/ZCY01/daily_scripts/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/JDHelloWorld/jd_scripts.git"
	url_test="https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/longzhuzhu/nianyu.git"
	url_test="https://raw.githubusercontent.com/longzhuzhu/nianyu/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/fangpidedongsun/jd_scripts2.git"
	url_test="https://raw.githubusercontent.com/fangpidedongsun/jd_scripts2/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/yangtingxiao/QuantumultX.git"
	url_test="https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/whyour/hundun.git"
	url_test="https://raw.githubusercontent.com/whyour/hundun/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
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
	git_clone_url="https://github.com/ZhiYi-N/Private-Script.git"
	url_test="https://raw.githubusercontent.com/ZhiYi-N/Private-Script/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

smiek2221_Script() {
	cd $dir_file
	Script_name="smiek2221_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	git_clone_url="https://github.com/smiek2221/scripts.git"
	url_test="https://raw.githubusercontent.com/smiek2221/scripts/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

zero205_Script() {
	cd $dir_file
	Script_name="zero205_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="main"
	for_diff="0"
	git_clone_url="https://github.com/zero205/JD_tencent_scf.git"
	url_test="https://raw.githubusercontent.com/zero205/JD_tencent_scf/main/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

Aaron_Script() {
	cd $dir_file
	Script_name="Aaron_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="jd_scripts"
	for_diff="0"
	git_clone_url="https://github.com/Aaron-lv/sync.git"
	url_test="https://raw.githubusercontent.com/Aaron-lv/sync/jd_scripts/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

yyds_Script() {
	cd $dir_file
	Script_name="yyds_Script"
	File_path="$dir_file/$Script_name"
	Newfile="new_${Script_name}.txt"
	Oldfile="old_${Script_name}.txt"
	branch="master"
	for_diff="0"
	git_clone_url="https://github.com/okyyds/yyds.git"
	url_test="https://raw.githubusercontent.com/okyyds/yyds/master/README.md"

	if [ -d "$Script_name" ]; then
		tongyong_config
	else
		git_if
	fi

}

git_if() {
	wget --spider -nv  $url_test -o /tmp/wget_test.log
	wget_test=$( cat /tmp/wget_test.log | grep -o "200 OK")
	if [ "$wget_test" == "200 OK" ];then
		git clone -b $branch $git_clone_url $Script_name
		tongyong_config
	else
		echo -e "${yellow}$Script_name库删除或者测试文件被移位，暂时不做下载操作${white}"
	fi
}

tongyong_config() {
	echo ""
	wget --spider -nv  $url_test -o /tmp/wget_test.log
	wget_test=$( cat /tmp/wget_test.log | grep -o "200 OK")
	if [ "$wget_test" == "200 OK" ];then
		cd $File_path
		git pull
		#这里不要强制更新，不利于测试，如果对方删库，强制更新也会删除
		#git fetch --all
		#git reset --hard origin/$branch
		init_data
		if [ $for_diff == "1" ];then
			for_diff_cron
		else
			diff_cron
		fi
		sendMessage
		That_day
	else
		num="1"
		eeror_num="1"
		while [[ ${num} -gt 0 ]]; do
			echo -e "$green>> $Script_name$yellow下载失败,开始尝试第$eeror_num次下载，3次下载失败就不再重试。$white"
			wget $url_test -O /tmp/wget_test.log
			if [ $? -eq 0 ]; then
				num=$(expr $num - 1)
			else
				if [ $eeror_num -ge 3 ];then
					echo -e "$green>> $Script_name$red下载$eeror_num次都失败，跳过这个下载$white"
					echo ""
					num=$(expr $num - 1)
					echo "#### 《$Script_name+$current_time》" >>$dir_file/git_log/${current_time}.log
					wget_error="$green[$Script_name]$red无法下载仓库文件，暂时不更新,可能是网络问题或者上游仓库被封，建议查看上游仓库是否正常，测试仓库是否正常：$url_test$white"
					echo -e "$wget_error"
					echo "$wget_error" | sed -e "s/\\\//g" -e "s/\[//g" -e "s/033//g" -e "s/0m//g" -e "s/31m//g" -e "s/32m//g" -e "s/可能/$wrap$wrap_tab可能/g" -e "s/建议/$wrap$wrap_tab建议/g"  >>$dir_file/git_log/${current_time}.log
					echo ""
					echo "**********************************************"
				else
						eeror_num=$(expr $eeror_num + 1)
				fi
			fi
		done
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
		ls ./ | grep -E 'js$|py$' | sort > $Oldfile
	fi
	#.*表示多个任意字符
	#新文件与旧文件对比
	ls ./ | grep -E 'js$|py$' | sort > $Newfile
	grep -vwf $Oldfile $Newfile > $ListJs_add
	
	if [ $(cat $ListJs_add | wc -l) = "0" ]; then
		Add_if="0"
	else
		Add=$(sed "s/$/$wrap$wrap_tab/" $ListJs_add | sed ':t;N;s/\n//;b t' )
		Add_if="1"
	fi 
	

	#用旧文件与新文件对比
	grep -vwf $Newfile $Oldfile > $ListJs_drop
	ls ./ | grep -E 'js$|py$' | sort > $Oldfile
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
		ls ./ | grep -E 'js$|py$' | sort > $File_path/$Oldfile
		for i in `ls | grep -v "backup"`
		do
			if [ -d $i ];then
				ls $i | grep -E 'js$|py$' | sort >> $File_path/$Oldfile
			else
				echo "" >/dev/null 2>&1
			fi
		done
	fi

	#.*表示多个任意字符
	#新文件与旧文件对比
	ls ./ | grep -E 'js$|py$' | sort > $File_path/$Newfile
	for i in `ls | grep -v "backup"`
	do
		if [ -d $i ];then
			ls $i | grep -E 'js$|py$' | sort >> $File_path/$Newfile
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
	ls ./ | grep -E 'js$|py$' | sort > $File_path/$Oldfile
	for i in `ls | grep -v "backup"`
	do
		if [ -d $i ];then
			ls $i | grep -E 'js$|py$' | sort >> $File_path/$Oldfile
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
	url=$(echo $url_test | sed "s/README.md//g" )
	rm -rf /tmp/down_url.txt
	if [ $Add_if = "1" ] && [ $Delete_if = "1" ]; then
		num="新增$cat_add脚本删除$cat_delete脚本"
		if [ "$cat_add" == "1" ];then
			content=$(echo "#### 新增脚本有:$wrap$wrap_tab$Add#### 下载链接:${url}$Add#### 删除脚本有:$wrap$wrap_tab$Delete" | sed "s/$wrap_tab####/####/g")
		else
			for i in `echo "$Add"| sed "s/$wrap$wrap_tab/ /g"`
			do
				echo "$wrap$wrap_tab${url}${i}$wrap$wrap_tab" >>/tmp/down_url.txt
			done

			new_add=$(cat /tmp/down_url.txt |sed ':t;N;s/\n//;b t')
			content=$(echo "#### 新增脚本有:$wrap$wrap_tab$Add#### 下载链接:$new_add#### 删除脚本有:$wrap$wrap_tab$Delete" | sed "s/$wrap_tab####/####/g")
		fi
	elif [ $Add_if = "1" ]; then 
		if [ "$tg_script_run" == "1" ];then
			num="tg频道新增１变量"
			content="#### 新增变量有:$wrap$wrap_tab$Add"
		else
			num="新增$cat_add脚本"
			if [ "$cat_add" == "1" ];then
				content="#### 新增脚本有:$wrap$wrap_tab$Add#### 下载链接:${url}$Add "
			else
				for i in `echo "$Add"| sed "s/$wrap$wrap_tab/ /g"`
				do
					echo "$wrap$wrap_tab${url}${i}$wrap$wrap_tab" >>/tmp/down_url.txt
				done

				new_add=$(cat /tmp/down_url.txt |sed ':t;N;s/\n//;b t')
				content="#### 新增脚本有:$wrap$wrap_tab$Add#### 下载链接:$new_add "
			fi
		fi
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
		if [ "$tg_script_run" == "1" ];then
			echo ""
		else
			run_script_if
		fi

		server_content=$(echo "$content${by}" | sed "s/$wrap_tab####/####/g" )
		weixin_content_sort=$(echo  "$content" |sed "s/####/<hr\/><b>/g" |sed "s/$wrap$wrap_tab/<br>/g" |sed "s/$wrap/<br>/g" |sed "s/:/:<hr\/><\/b>/g"  )
		weixin_content=$(echo "$weixin_content_sort<br><b>$by" | sed "s/https\:<hr\\/><\\/b>/https:/g" | sed "s/#### /<br><b>/g")
		weixin_desp=$(echo "$weixin_content" | sed "s/<hr\/><b>/$weixin_line\n/g" |sed "s/<hr\/><\/b>/\n$weixin_line\n/g"| sed "s/<b>/\n/g"| sed "s/<br>/\n/g" | sed "s/<br><br>/\n/g" | sed "s/#/\n/g" )
		title="${Script_name}${num}${auto_run}${ps_num}"
		push_menu
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
	server_content=$(echo "${log_sort}${by}" | sed "s/$wrap_tab####/####/g" )

	weixin_content_sort=$(echo  "$log_sort" |sed "s/$wrap####/<br><br><hr\/><b>/g" |sed "s/》$wrap/》<hr\/><\/b>/g" |sed "s/$wrap$wrap_tab/<br>/g"|sed "s/+/ /g" |sed "s/<br><br><hr\/><b> 《curtinlv/<hr\/><b> 《curtinlv/g")
	weixin_content=$(echo "$weixin_content_sort<br><b>$by")
	weixin_desp=$(echo "$weixin_content" | sed "s/<hr\/><b>/$weixin_line\n/g" |sed "s/<hr\/><\/b>/\n$weixin_line\n/g"| sed "s/<b>/\n/g"| sed "s/<br>/\n/g" | sed "s/<br><br>/\n/g" | sed "s/#/\n/g" )
	title="Checkjs检测仓库状态"
	push_menu
}


that_day_push() {
	menu
	echo -e "$green无视时间规则开始推送$white"
	That_day_sendMessage
}

push_menu() {
case "$push_if" in
		0)
			#server酱和微信同时推送
			server_push
			weixin_push
			push_if="3"
			weixin_push
		;;
		1)
			#server酱推送
			server_push
		;;
		2)
			#微信推送
			weixin_push
		;;
		3)
			#将shell模块检测推送到另外一个小程序上（举个例子，一个企业号，两个小程序，小程序１填到sendNotify.js,这样子js就会推送到哪里，小程序２填写到jd_openwrt_config这样jd.sh写的模块就会推送到小程序2
			weixin_push
		;;
		*)
			echo -e "$red填写错误，不进行推送$white"
		;;
	esac

}

server_push() {

if [ ! $SCKEY ];then
	echo "没找到Server酱key不做操作"
else
	echo -e "$green server酱开始推送$title$white"
	curl -s "http://sc.ftqq.com/$SCKEY.send?text=$title++`date +%Y-%m-%d`++`date +%H:%M`" -d "&desp=$server_content" >/dev/null 2>&1

	if [[ $? -eq 0 ]]; then
		echo -e "$green server酱推送完成$white"
	else
		echo -e "$red server酱推送失败。请检查报错代码$title$white"
	fi
fi

}

weixin_push() {
current_time=$(date +%s)
expireTime="7200"
if [ $push_if == "3" ];then
	weixinkey=$(grep "weixin2" $openwrt_script_config/jd_openwrt_script_config.txt | awk -F "'" '{print $2}')
else
	weixinkey=$(grep "let QYWX_AM" $openwrt_script_config/sendNotify.js | awk -F "'" '{print $2}')
fi

#企业名
corpid=$(echo $weixinkey | awk -F "," '{print $1}')
#自建应用，单独的secret
corpsecret=$(echo $weixinkey | awk -F "," '{print $2}')
# 接收者用户名,@all 全体成员
touser=$(echo $weixinkey | awk -F "," '{print $3}')
#应用ID
agentid=$(echo $weixinkey | awk -F "," '{print $4}')
#图片id
media_id=$(echo $weixinkey | awk -F "," '{print $5}')

weixin_file="$openwrt_script_config/weixin_token.txt"
time_before=$(cat $weixin_file |grep "$corpsecret" | awk '{print $4}')


if [ ! $time_before ];then
	#获取access_token
	access_token=$(curl "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=${corpid}&corpsecret=${corpsecret}" | sed "s/,/\n/g" | grep "access_token" | awk -F ":" '{print $2}' | sed "s/\"//g")
	sed -i "/$corpsecret/d" $weixin_file
	echo "$corpid $corpsecret $access_token `date +%s`" >> $weixin_file
	echo ">>>刷新access_token成功<<<"
else
	if [ $(($current_time - $time_before)) -gt "$expireTime" ];then
		#获取access_token
		access_token=$(curl "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=${corpid}&corpsecret=${corpsecret}" | sed "s/,/\n/g" | grep "access_token" | awk -F ":" '{print $2}' | sed "s/\"//g")
		sed -i "/$corpsecret/d" $weixin_file
		echo "$corpid $corpsecret $access_token `date +%s`" >>$weixin_file
		echo ">>>刷新access_token成功<<<"
	else
		echo "access_token 还没有过期，继续用旧的"
		access_token=$(cat $weixin_file |grep "$corpsecret" | awk '{print  $3}')
	fi
fi

if [ ! $media_id ];then
	msg_body="{\"touser\":\"$touser\",\"agentid\":$agentid,\"msgtype\":\"text\",\"text\":{\"content\":\"$title\n$weixin_desp\"}}"
else
	msg_body="{\"touser\":\"$touser\",\"agentid\":$agentid,\"msgtype\":\"mpnews\",\"mpnews\":{\"articles\":[{\"title\":\"$title\",\"thumb_media_id\":\"$media_id\",\"content\":\"$weixin_content\",\"digest\":\"$weixin_desp\"}]}}"
fi
	echo -e "$green 企业微信开始推送$title$white"
	curl -s "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$access_token" -d "$msg_body"

	if [[ $? -eq 0 ]]; then
		echo -e "$green 企业微信推送成功$title$white"
	else
		echo -e "$red 企业微信推送失败。请检查报错代码$title$white"
	fi

}

rm_log(){
	#删掉当天的日志文件
	for i in `ls /tmp/ | grep -E "log$|txt$" | grep -E "tg|checkjs"`
	do
		rm -rf /tmp/$i
	done

}

update_script() {
	echo -e "$green 开始更新checkjs，当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	cd $dir_file
	branch="main"
	git_pull
}


description_if() {
	wget https://raw.githubusercontent.com/ITdesk01/Checkjs/main/README.md -O /tmp/test_README.md
	if [[ $? -eq 0 ]]; then
		echo -e "$green网络正常，可以ping通github$white"
	else
		echo -e "$red请检查你的网络，ping github失败，建议科学上网$white"
		exit 0
	fi

	if [ ! -d $dir_file/git_log ];then
		mkdir 	$dir_file/git_log
	fi

	if [ "$dir_file" == "/usr/share/jd_openwrt_script/Checkjs" ];then
		SCKEY=$(grep "let SCKEY" /usr/share/jd_openwrt_script/script_config/sendNotify.js  | awk -F "'" '{print $2}')
		if [ ! $SCKEY ];then
			SCKEY=$(cat /usr/share/jd_openwrt_script/script_config/Checkjs_Sckey.txt)
		fi
	else
		SCKEY=$(cat $dir_file/Checkjs_Sckey.txt)
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
		sh $0
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
	cron_version="3.2"
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
*/5 * * * * source /etc/profile && $dir_file/checkjs.sh >/tmp/checkjs.log 2>&1 #102#
45 21 * * * $dir_file/checkjs.sh update_script  >/tmp/checkjs_update_script.log 2>&1 #102#
45 23 * * * $dir_file/checkjs.sh rm_log 2>&1 #102#
###################请将其他定时任务放到底下#########102#
EOF
/etc/init.d/cron restart
}
task_delete() {
	echo "开始删除定时任务"
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
	checkjs_config_if
	opencard_variable
	echo "----------------------------------------------"
	echo -e "$green Checkjs $version开始检查脚本新增或删除情况$white"
	echo ""
	echo -e "$yellow无视时间规则直接推送:$green sh \$checkjs that_day_push$white"
	echo "----------------------------------------------"
	echo -e "$green 当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	echo -e "$yellow 检测脚本是否最新:$white $Script_status "
	echo "**********************************************"
	echo > $dir_file/git_log/${current_time}.log
	smiek2221_Script
	KingRan_Script
	curtinlv_script
	ccwav
	yyds_Script
	JDWXX_Script
	Github_6dylan6_Script
	cdle_carry_Script
	X1a0He
	zero205_Script
	Ariszy_Script
	yuannian1112
	JDHelloWorld
	Aaron_Script
	nianyuguai
	fangpidedongsun
	yangtingxiao
	ZCY01_Script
	hundun
	ZhiYi_Script
	rm -rf $dir_file/shylocks_Script_gitee

	if [ $(date +%H%M) == "1200" ];then
		echo "12点开始推送今天的github更新记录"
		That_day_sendMessage
	elif [ $(date +%H%M) == "2200" ];then
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

#判断是否自动运行新增脚本
run_script_if() {
	if [ "$script_if" == "no" ];then
		echo ""
	else
		#判断当前时间
		current_time=$(date +%H)
		if [ "$script_date" == "" ];then
			echo -e "${yellow}script_date为空${white}"
		elif [ "$script_date" == "*" ];then
			run_script
		elif [ `echo "$script_date" | grep -o "-"` == "-" ];then
			script_date_min=$(echo "$script_date" | awk -F "-" '{print $1}')
			script_date_max=$(echo "$script_date" | awk -F "-" '{print $2}')
			seq_date=$(seq $script_date_min $script_date_max)
			echo "$seq_date" | grep -o "$current_time"
			if [[ $? -eq 0 ]]; then
				echo -e "${green}》》当前时间：$current_time点，符合你的设置${white}"
				run_script
			else
				echo -e "${yellow}》》当前时间：$current_time点，不符合你的设置，不自动运行脚本${white}"
				auto_run="(有合适脚本,但时间不符合不跑)"
			fi
		elif [ `echo "$script_date" | grep -o "," | sort -u` == "," ];then
			script_date_convert=$(echo "$script_date" | sed "s/,/ /g")
			echo "$script_date_convert" | grep -o "$current_time"
			if [[ $? -eq 0 ]]; then
				echo -e "${green}》》当前时间：$current_time点，可以自动跑${white}"
				run_script
			else
				echo -e "${yellow}》》当前时间：$current_time点，不符合你的设置，不自动运行脚本${white}"
				auto_run="(有合适脚本,但时间不符合不跑)"
			fi
		else
			echo -e "script_date的字符：$script_date,进入下级判断"
			run_script
		fi
	fi
}

run_script() {
		rm -rf /tmp/run_script_ps.log
		#复制依赖文件
		cp -r $checkjs_file/KingRan_Script/function $script_dir
		cp $checkjs_file/KingRan_Script/JS_USER_AGENTS.js $script_dir

		if [ "$script_ifname1" == "" ];then
			echo "script_ifname为空"
		elif [ "$script_ifname1" == "*" ];then
			auto_run="(全部自动运行)"
			for i in `echo $Add |sed "s/$wrap//g" | sed "s/$wrap_tab//g"`
			do
				cp ${File_path}/${i} ${script_dir}/${i}
				echo "${i}(全部自动运行),当前时间`date`" >>/tmp/run_script.log
				$node ${script_dir}/${i} >>/tmp/run_script.log &
				sleep 3 && ps -ww | grep "${i}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >>/tmp/run_script_ps.log
				run_script_ps_num=$(cat /tmp/run_script_ps.log |sed ':t;N;s/\n//;b t')
				if [ -z "$run_script_ps_num"];then
					ps_num="进程：没有发现，请手动跑测试"
				else
					ps_num="进程：$run_script_ps_num"
				fi
			done
		elif [ `echo ${script_ifname1} | grep -o "|" |sort -u | wc -l` == "1" ];then
			url=$(echo $url_test | sed "s/README.md//g")
			for i in `echo $Add |sed "s/$wrap//g" | sed "s/$wrap_tab//g"`
			do
				if [ `echo $i | grep -E "${script_ifname1}" |wc -l` == "1" ];then
					ps_gua=$(ps -ww | grep "gua_opencard" | grep -v grep | wc -l)
					ps_kr=$(ps -ww | grep "jd_opencard" | grep -v grep | wc -l)

					grep_gua=$(echo $i | grep -o "gua_opencard")
					grep_kr=$(echo $i | grep -o "jd_opencard")

					if [ "$ps_gua" -ge "1" ] && [ "$grep_kr" == "jd_opencard" ];then
						auto_run="(gua的脚本已经在跑，kr的$i先不跑)"
						echo "没有进程"　>/tmp/run_script_ps.log
					elif [ "$ps_kr" -ge "1" ] && [ "$grep_gua" == "gua_opencard" ];then
						auto_run="(kr的脚本已经在跑，gua的$i先不跑)"
						echo "没有进程"　>/tmp/run_script_ps.log
					else
						auto_run="(个别自动运行)"
						cp ${File_path}/${i} ${script_dir}/${i}
						echo "${i}(个别自动运行),当前时间`date`" >>/tmp/run_script.log
						$node ${script_dir}/${i} >>/tmp/run_script.log &
						sleep 3 && ps -ww | grep "${i}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >>/tmp/run_script_ps.log
						run_script_ps_num=$(cat /tmp/run_script_ps.log |sed ':t;N;s/\n//;b t')
						if [ -z "$run_script_ps_num"];then
							ps_num="进程：没有发现，请手动跑测试"
						else
							ps_num="进程：$run_script_ps_num"
						fi
					fi
				fi
			done
		else
			url=$(echo $url_test | sed "s/README.md//g")
			for i in `echo $Add |sed "s/$wrap//g" | sed "s/$wrap_tab//g"`
			do
				if [ `echo $i | grep -E "${script_ifname1}" |wc -l` == "1" ];then
					ps_gua=$(ps -ww | grep "gua_opencard" | grep -v grep | wc -l)
					ps_kr=$(ps -ww | grep "jd_opencard" | grep -v grep | wc -l)

					grep_gua=$(echo $i | grep -o "gua_opencard")
					grep_kr=$(echo $i | grep -o "jd_opencard")

					if [ "$ps_gua" -ge "1" ] && [ "$grep_kr" == "jd_opencard" ];then
						auto_run="(gua的脚本已经在跑，kr的$i先不跑)"
					elif [ "$ps_kr" -ge "1" ] && [ "$grep_gua" == "gua_opencard" ];then
						auto_run="(kr的脚本已经在跑，gua的$i先不跑)"
					else
						auto_run="(个别自动运行)"
						cp ${File_path}/${i} ${script_dir}/${i}
						echo "${i}(个别自动运行),当前时间`date`" >>/tmp/run_script.log
						$node ${script_dir}/${i} >>/tmp/run_script.log &
						sleep 3 && ps -ww | grep "${i}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >>/tmp/run_script_ps.log
						run_script_ps_num=$(cat /tmp/run_script_ps.log |sed ':t;N;s/\n//;b t')
						if [ -z "$run_script_ps_num"];then
							ps_num="进程：没有发现，请手动跑测试"
						else
							ps_num="进程：$run_script_ps_num"
						fi
					fi
				fi
			done
		fi

}

checkjs_config_if() {
	checkjs_config_version="1.3"
	if [ ! -f $dir_file/config.txt ];then
		checkjs_config
	fi

	if [ `grep -o "$checkjs_config_version" $dir_file/config.txt` == "$checkjs_config_version" ];then
		echo ""
	else
		date_num=$(date +%Y_%m_%d)
		cat $dir_file/config.txt >$dir_file/config_${date_num}.txt
		checkjs_config
	fi
}

checkjs_config() {
cat > $dir_file/config.txt <<EOF
++++++++++++++++++++++++++++Checkjs ${checkjs_config_version}配置+++++++++++++++++++++++++++++++++++++++++++++++++++++
#是否自动跑新增的脚本(默认no，跑yes)(也可以用export script_if="yes"写到全局变量)
script_if="no"

#脚本名判断(* 代表无论新增什么脚本都跑，你可以这里填关键字用，隔开，如填opencard,gua  这样脚本含有这两个字符的就会开始跑)
script_ifname="gua_opencard,jd_opencard"

#脚本下载到那个路径并执行
script_dir="/usr/share/jd_openwrt_script/JD_Script/js"

#脚本在那个时间自动跑(* 代表所有时间 7-18 代表7点到18点有符合的脚本更新就跑 7,9 代表7点 9点才会自己跑)
script_date="*"


#tg监控频道变量(也可以用export tg_if="yes"写到全局变量)
tg_if="no"

#tg_api(必填，不然无法启动监控，获取地址参考https://www.jianshu.com/p/3d047c7516cf')(也可以用export tg_api_id=""写到全局变量)
tg_api_id=""

#tg_hash(必填，不然无法启动监控，获取地址参考https://www.jianshu.com/p/3d047c7516cf')(也可以用export tg_api_hash=""写到全局变量)
tg_api_hash=""

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
}

opencard_variable() {
cat > /tmp/opencard_variable.txt <<EOF
#yyds
DY_OPENALL="true"

#gua
guaopencard_All="true"
guaopencard_addSku_All="true"
guaopencardRun_All="true"
guaopencard_draw="true"

#kr
opencard_addCart="true"
opencard_draw="10"
EOF

for i in `cat /tmp/opencard_variable.txt | grep -v "#"`
do
	opencard_variable_if=$(grep "$i" /etc/profile | wc -l )
	if [ "$opencard_variable_if" == "1" ];then
		echo ""
		#echo "开卡变量：$i，已经存在"
	elif [ "$opencard_variable_if" -gt "1" ];then
		echo "检测到开卡变量：$i，重复，先删除后添加"
		sed -i "/$i/d" /etc/profile
		echo "开始导入开卡变量：$i"
		echo "export $i" >>/etc/profile
	else
		echo "开始导入开卡变量：$i"
		echo "export $i" >>/etc/profile
	fi
done
source /etc/profile
clear

}

tg() {
cat > $dir_file/tg/variable_name.txt <<EOF
#yyds
M_WX_ADD_CART_URL			jd_wx_addCart.js
SHOP_VENDER_ID				jd_card.js
WXGAME_ACT_ID				jd_dadoudou.js
jd_cjhy_wxCollectionActivityId		jd_cjhy_wxCollectionActivity.js
ACTIVITY_ID				jd_wxCollectionActivity2.js
prodevactCode				jd_prodev.js

#KingRan
jd_wxKnowledgeActivity_activityUrl	jd_wxKnowledgeActivity.js
jd_daily_activityId			jd_daily.js
jd_cjdaily_activityId			jd_cjdaily.js
yhyauthorCode				jd_yqhy.py
jd_wxCollectionActivity_activityUrl	jd_wxCollectionActivity.js
jd_categoryUnion_activityId		jd_categoryUnion.js
jd_completeInfoActivity_activityId	jd_completeInfoActivity.js
jd_completeInfoActivity_venderId	jd_completeInfoActivity.js
jd_wxBuildActivity_activityId		jd_wxBuildActivity.js
jd_cjwxShopFollowActivity_activityId	jd_cjwxShopFollowActivity.js
jd_wxKnowledgeActivity_activityId	jd_wxKnowledgeActivity.js
jd_cjwxKnowledgeActivity_activityId	jd_cjwxKnowledgeActivity.js
M_WX_LUCK_DRAW_URL			jd_luck_draw.js
LUCK_DRAW_URL				jd_luck_draw.js
DPLHTY					jd_opencardDPLHTY.js
jd_cjhy_activityId			jd_cjzdgf.js
jd_zdjr_activityId			jd_zdjr.js
jd_wxShareActivity_activityId		jd_wxShareActivity.js
jd_wxgame_activityId			jd_wxgame.js
jd_drawCenter_activityId		jd_drawCenter.js
JD_Lottery				jd_lottery.js
PKC_TXGZYL				jd_txgzyl.js
VENDER_ID				jd_OpenCard_Force.js
M_FOLLOW_SHOP_ARGV			jd_follow.js
yhyactivityId				jd_yqhy.py
jd_wdz_activityId			jd_wdz.js
computer_activityId			jd_computer.js
comm_activityIDList			jd_joyjd_open.js
jd_mhurlList				jd_mhtask.js
wish_appIdArrList			jd_wish.js
VENDER_ID				jd_OpenCard_Force.js
jd_wxSecond_activityId			jd_wxSecond.js
SHARE_ACTIVITY_ID			jd_share.js
EOF

#常规变量
#jd_wxKnowledgeActivity.js
export jd_wxKnowledgeActivity_openCard="true" #是否开卡，默认不开卡
export jd_wxKnowledgeActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)  #运行账号数量，默认运行前7

#jd_wxCollectionActivity.js
export jd_wxCollectionActivity_openCard="true" #是否开卡，默认不开卡
export jd_wxCollectionActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)  #运行账号数量，默认运行前7

#jd_wxBuildActivity.js
export jd_wxBuildActivity_openCard="true" #自动入会

#jd_cjwxShopFollowActivity.js
export jd_cjwxShopFollowActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)  #运行账号数量，默认运行前7

#jd_wxKnowledgeActivity.js
export jd_wxKnowledgeActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)  #运行账号数量，默认运行前7

#jd_cjwxKnowledgeActivity.js
export jd_cjwxKnowledgeActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)

#jd_cjhy_wxCollectionActivity.js
export jd_cjhy_wxCollectionActivity_num=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)   #执行前多少个号  不设置则默认执行前10个

#jd_opencardDPLHTY.js
export opencard_toShop="true"
export opencard_draw="6" #次数
export opencard_shop="6" #次数

#jd_wxShareActivity.js
export OWN_COOKIE_NUM=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l)

export jd_cjhy_activityUrl="https://cjhydz-isv.isvjcloud.com"
export jd_zdjr_activityUrl="https://lzkjdz-isv.isvjcloud.com"
#脚本名：jd_luck_draw.js
#LUCK_DRAW_URL // 活动链接
export LUCK_DRAW_OPENCARD="true"	#是否开卡，默认不开卡
export LUCK_DRAW_NUM=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l) #运行账号数量，默认运行前7
export LUCK_DRAW_NOTIFY="true" #是否推送通知，默认不推送

#脚本名：jd_wxShareActivity.js
#jd_wxShareActivity_activityId // 活动id
export jd_wxShareActivity_helpnum=$(cat $openwrt_script_config/jdCookie.js | grep "pt_key" | grep -v "pt_key=xxx" |wc -l) #// 需要助力的账号数量
#脚本名：jd_wxgame.js
#jd_wxgame_activityId // 活动id
export jd_wxgame_addCart="true" #// 是否做加购任务，默认不做

#脚本名：jd_drawCenter.js
#jd_drawCenter_activityId // 活动id
export jd_drawCenter_addCart="true" #// 是否做加购任务，默认不做

	docker_id=$(docker ps | grep "tg:0.1" | awk '{print $1}')

	if [ "$tg_if" == "yes" ];then
		if [ -f $dir_file/tg/tg.py ] && [ ! "$docker_id" == "" ];then
			cp $dir_file/tg.py $dir_file/tg/tg.py
			docker exec $docker_id /bin/bash -c "export API_ID=$tg_api_id && export API_HASH=$tg_api_hash && python3.7 tg.py"
			if [[ $? -eq 0 ]]; then
				echo -e "${green}tg.py运行成功$white"
			else
				echo -e "${red}tg.py运行失败$white"
				exit 0
			fi
			#开始检测变量
			if [ -f $dir_file/tg/tg.log ];then
				tg_oldfile="$dir_file/tg/tg_oldfile.txt"
				tg_newfile="$dir_file/tg/tg_newfile.txt"
				tg_add="$dir_file/tg/tg_add.txt"
				script_dir=$(cat $dir_file/config.txt | grep -v "#" | grep "script_dir"  | awk -F "=" '{print $2}' | sed "s/\"//g")

				cat $dir_file/tg/tg.log | sed "s/,/\n/g"| sed "s/\\\n/\n/g" | grep "export"| sed 's/[[:space:]]//g' |awk -F "export" '{print $2}' | sed "s/\"//g" | sed "s/'//g" |grep -v "=活动" | sort -u >/tmp/tg_purify.log
				grep_keywords=$(cat $dir_file/tg/variable_name.txt|sed "s/#/\n#/g"| grep -v "#"|awk '{print $1}' |sed '/^$/d'| sed "s/$/|/g"| sed ':t;N;s/\n//;b t'| sed "s/|$//")

				extract_log=$(grep -E "$grep_keywords" /tmp/tg_purify.log)

				echo -e "\n$yellow本次变量有以下$white"
				echo -e "$extract_log\n"
				#首次运行需要创建oldfile
				if [ -f "$tg_oldfile" ];then
					echo ""
				else
					echo "没有发现tg_oldfile"
					echo "$extract_log" > $tg_oldfile
				fi

				#.*表示多个任意字符
				#新文件与旧文件对比
				echo "$extract_log" > $tg_newfile

				grep -vwf $tg_oldfile $tg_newfile > $tg_add
				if [[ $? -eq 0 ]]; then
					echo -e "${green}grep　tg_add运行成功$white"
					echo "此时tg_oldfile变量数：`cat $tg_oldfile| wc -l`"
					echo "此时tg_newfile变量数：`cat $tg_newfile| wc -l`"
					echo "此时tg_add变量数：`cat $tg_add| wc -l`"
				else
					echo -e "${red}grep　tg_add运行失败$white"
					echo "此时tg_oldfile变量数：`cat $tg_oldfile| wc -l`"
					echo "此时tg_newfile变量数：`cat $tg_newfile| wc -l`"
					echo "此时tg_add变量数：`cat $tg_add| wc -l`"
				fi

				if [ $(cat $tg_add | wc -l) = "0" ];then
					Add_if="0"
					echo "当前时间`date`"
					echo -e "$green暂时未发现新变量，暂时不做推送$white"
				else
					for i in `cat $tg_add|sed "s/#/\n#/g"| grep -v "#"`
					do
						variable_script_name=$(echo "$i"| awk -F "=" '{print $1}')
						variable_script_num=$(echo "$i"| awk -F "=" '{print $2}')

						js_name=$(grep $variable_script_name $dir_file/tg/variable_name.txt)
						js_name1=$(echo "$js_name" | awk '{print $2}' | sort -u)

						if [ -z "$variable_script_num" ];then
							echo "$variable_script_name值：为空不操作"
						elif [ `echo $variable_script_num| grep "xxxx" | wc -l` == "1" ];then
							echo "$variable_script_name值：为$variable_script_num不操作"
						else
							case "$variable_script_name" in
							jd_daily_activityId|jd_cjdaily_activityId|jd_wxCollectionActivity_activityUrl|jd_wxBuildActivity_activityId|jd_cjwxShopFollowActivity_activityId|jd_wxKnowledgeActivity_activityId|jd_cjwxKnowledgeActivity_activityId|jd_wxSecond_activityId|VENDER_ID|wish_appIdArrList|jd_mhurlList|comm_activityIDList|computer_activityId|jd_wdz_activityId|M_FOLLOW_SHOP_ARGV|VENDER_ID|PKC_TXGZYL|LUCK_DRAW_URL|DPLHTY|jd_cjhy_activityId|jd_zdjr_activityId|jd_wxShareActivity_activityId|jd_wxgame_activityId|jd_drawCenter_activityId|JD_Lottery)
								export $i
								cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$node ${script_dir}/$js_name1 >>/tmp/tg_run_script.log  &
								Add_if="1"
							;;
							yhyauthorCode)
								if [ -z "$yhypin" ];then
									echo "${script_dir}/$js_name1的yhypin值为空，不运行运行，当前时间`date`\n export yhypin="" #被助力的号，自己填到全局变量" >>/tmp/tg_run_script.log
								else
									export $i
									export yhyactivityId="dVF7gQUVKyUcuSsVhuya5d2XD4F"
									#export yhypin="" #被助力的号，自己填

									cat ${script_dir}/jdCookie.js |grep "pin=" | grep -v "正确格式为" | awk -F "," '{print $1}' | sed "s/'//g" | sed 's/[[:space:]]//g' >${script_dir}/cklist1.txt
									cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
									echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
									echo "开始运行${script_dir}/$js_name1"
									echo "当前yhypin值为：$yhypin" >>/tmp/tg_run_script.log
									echo "变量为$i"
									cd ${script_dir} && $python3 $js_name1 >>/tmp/tg_run_script.log  &
									Add_if="1"
								
								fi
							;;
							jd_categoryUnion_activityId)
								export $i
								cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
								cp $dir_file/KingRan_Script/jd_categoryUnion_draw.js ${script_dir}/jd_categoryUnion_draw.js
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$node ${script_dir}/$js_name1 >>/tmp/tg_run_script.log &
								Add_if="1"
								sleep 600
								$node ${script_dir}/$jd_categoryUnion_draw.js >>/tmp/tg_run_script.log
							;;
							jd_completeInfoActivity_activityId)
								export $i
								cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
								num=$(cat $tg_newfile | grep "jd_completeInfoActivity_venderId" |sed -n "1p")
								export jd_completeInfoActivity_activityUrl="https://cjhydz-isv.isvjcloud.com"
								export jd_completeInfoActivity_venderId="$num"

								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$python3 ${script_dir}/$js_name1 >>/tmp/tg_run_script.log  &
								Add_if="1"
							;;
							yhyactivityId)
								export $i
								cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$python3 ${script_dir}/$js_name1 >>/tmp/tg_run_script.log  &
								Add_if="1"
							;;
							prodevactCode|ACTIVITY_ID|jd_cjhy_wxCollectionActivityId|WXGAME_ACT_ID|SHOP_VENDER_ID|M_WX_ADD_CART_URL)
								export $i
								cp $dir_file/yyds_Script/magic.js ${script_dir}/magic.js
								cp $dir_file/yyds_Script/$js_name1 ${script_dir}/$js_name1
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$node ${script_dir}/$js_name1 >>/tmp/tg_run_script.log &
								Add_if="1"
							;;
							M_WX_LUCK_DRAW_URL)
								num=$(echo $i |sed "s/M_WX_LUCK_DRAW_URL/LUCK_DRAW_URL/g")
								export $num
								cp $dir_file/KingRan_Script/$js_name1 ${script_dir}/$js_name1
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$node ${script_dir}/$js_name1 >>/tmp/tg_run_script.log &
								Add_if="1"
							;;
							SHARE_ACTIVITY_ID)
								export $i
								cp $dir_file/js/$js_name1 ${script_dir}/$js_name1
								echo "${script_dir}/$js_name1运行，当前时间`date`" >>/tmp/tg_run_script.log
								echo "开始运行${script_dir}/$js_name1"
								echo "变量为$i"
								$node ${script_dir}/$js_name1 >>/tmp/tg_run_script.log &
								Add_if="1"
							;;
							*)
								i="$i暂不支持这个变量"
								Add_if="1"
							;;
							esac
							sleep 3 && ps -ww | grep "${js_name1}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >/tmp/run_script_ps.log
							echo "$i$wrap$wrap_tab$wrap$wrap_tab运行日志可以查询:/tmp/tg_run_script.log$wrap$wrap_tab" >/tmp/tg_tmp.txt
							ListJs_add="/tmp/tg_tmp.txt"
							Add=$(cat /tmp/tg_tmp.txt)

							echo >/$dir_file/tg/tg_del.txt
							ListJs_drop="/$dir_file/tg/tg_del.txt"
							run_script_ps_num=$(cat /tmp/run_script_ps.log |sed ':t;N;s/\n//;b t')

							if [ -z "$run_script_ps_num"];then
								ps_num="进程：没有发现，请手动跑测试"
							else
								ps_num="进程：$run_script_ps_num"
							fi
							tg_script_run="1"
							sendMessage
						fi
					done
					echo "$extract_log" > $tg_oldfile
				fi
					cron_tg=$(cat /etc/crontabs/root | grep "#tg0.2#" | wc -l)
					if [ "$cron_tg" == "0"  ];then
						sed -i '/checkjs.sh tg/d' /etc/crontabs/root >/dev/null 2>&1
						echo "*/1 * * * * source /etc/profile && $dir_file/checkjs.sh tg >/tmp/checkjs_tg.log 2>&1 #tg0.2#" >>/etc/crontabs/root
					else
						echo ""
					fi
			fi
		else
			if [ ! -d $dir_file/tg ];then
				mkdir $dir_file/tg
			fi

			if [ ! "$tg_api_id" == "" ] && [ ! "$tg_api_hash" == "" ];then
				# python3.7 -m pip install telethon
				echo -e "$green开始安装tg环境，请稍等，请保证你的docker 也能访问google，不然会失败$white"
				docker run -d --name tg -i -t -v $dir_file/tg:/usr/share/tg --restart=always itdeskzhang/tg:0.1

				sleep 3
				cp $dir_file/tg.py $dir_file/tg/tg.py
				docker_id=$(docker ps | grep "tg:0.1" | awk '{print $1}')
				clear
				if [ -z $docker_id ];then
					echo "没有找到docker_id，容器没有运行成功"
				else
					clear
					echo -e "$green>>请按下面提示输入tg手机号码:(+86XXX)$white"
					docker exec -it $docker_id /bin/bash -c "export API_ID=$tg_api_id && export API_HASH=$tg_api_hash && python3.7 tg.py"
					if [[ $? -eq 0 ]]; then
						echo -e "$green>>安装成功,后面脚本会自己运行的$white"
						echo >/$dir_file/tg/tg.log
						tg
					else
						echo -e "$red>>运行失败：$white请手动输入docker exec -it $docker_id /bin/bash -c "export API_ID=$tg_api_id "&& "export API_HASH=$tg_api_hash "&& python3 tg.py"""
					fi
				fi
			else
				echo "tg_api_id或tg_api_hash变量没有填"
				exit 0
			fi
		fi
	else
		echo "tg_if变量:$tg_if，无法运行"
	fi



}

#---------------------------------------------监控变量----------------------------------------------------------------------------------------#
echo "-----------------------------变量获取----------------------------------------"
#开卡部分
	if [ -z "$script_if" ];then
		script_if=$(cat $dir_file/config.txt | grep -v "#" | grep "script_if="  | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}script_if系统变量找不到，查找config文件$white"
		echo "script_if:$script_if"
	else
		echo "script_if:$script_if"
	fi

	if [ -z "$script_ifname" ];then
		script_ifname1=$(cat $dir_file/config.txt | grep -v "#" | grep "script_ifname" | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}script_ifname系统变量找不到，查找config文件$white"
		echo "script_ifname:$script_ifname1"
	else
		script_ifname1=$(echo $script_ifname |sed "s/,/|/g")
		echo "script_ifname:$script_ifname1"
	fi

	if [ -z "$script_dir" ];then
		script_dir=$(cat $dir_file/config.txt | grep -v "#" | grep "script_dir"  | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}script_dir系统变量找不到，查找config文件$white"
		echo "script_dir:$script_dir"
	else
		echo "script_dir:$script_dir"
	fi

	if [ -z "$script_date" ];then
		script_date=$(cat $dir_file/config.txt | grep -v "#" | grep "script_date" | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}script_date系统变量找不到，查找config文件$white"
		echo "script_date:$script_date"
	else
		echo "script_date:$script_date"
	fi

#tg部分
	if [ -z "$tg_if" ];then
		tg_if=$(cat $dir_file/config.txt | grep -v "#" | grep "tg_if" | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}tg_if系统变量找不到，查找config文件$white"
		echo "tg_if:$tg_if"
	else
		echo "tg_if:$tg_if"
	fi

	if [ -z "$tg_api_id" ];then
		tg_api_id=$(cat $dir_file/config.txt | grep -v "#" | grep "tg_api_id" | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}tg_api_id系统变量找不到，查找config文件$white"
		echo "tg_api_id:$tg_api_id"
	else
		echo "tg_api_id:$tg_api_id"
	fi

	if [ -z "$tg_api_hash" ];then
		tg_api_hash=$(cat $dir_file/config.txt | grep -v "#" | grep "tg_api_hash" | awk -F "=" '{print $2}' | sed "s/\"//g")
		echo -e "${yellow}tg_api_hash系统变量找不到，查找config文件$white"
		echo "tg_api_hash:$tg_api_hash"
	else
		echo "tg_api_hash:$tg_api_hash"
	fi
echo "---------------------------------------------------------------------/n/n"
#-------------------------------------------------------------------------------------------------------------------------------------------#


action1="$1"
if [ -z $action1 ]; then
	menu
else
	case "$action1" in
			update_script|system_variable|menu|that_day_push|help|task_delete|ds_setup|tg|rm_log)
			$action1
			;;
			*)
			help
			;;
	esac
fi




