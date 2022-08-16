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
		run_script_if

		run_script_ps_num=$(cat /tmp/run_script_ps.log |sed ':t;N;s/\n//;b t')
		if [ -z "$run_script_ps_num"];then
			ps_num=""
		else
			ps_num="进程：$run_script_ps_num"
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


update_script() {
	echo -e "$green 开始更新checkjs，当前时间：$white`date "+%Y-%m-%d %H:%M"`"
	cd $dir_file
	branch="main"
	git_pull

	#删掉当天的日志文件
	rm -rf /tmp/run_script.log
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
	cron_version="2.6"
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
*/5 * * * * $dir_file/checkjs.sh >/tmp/checkjs.log 2>&1 #102#
45 21 * * * $dir_file/checkjs.sh update_script  >/tmp/checkjs_update_script.log 2>&1 #102#
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
	script_if=$(cat $dir_file/config.txt | grep -v "#" | grep "script_if="  | awk -F "=" '{print $2}' | sed "s/\"//g")
	script_ifname=$(cat $dir_file/config.txt | grep -v "#" | grep "script_ifname" | awk -F "=" '{print $2}' | sed "s/\"//g" | sed "s/,/|/g")
	script_dir=$(cat $dir_file/config.txt | grep -v "#" | grep "script_dir"  | awk -F "=" '{print $2}' | sed "s/\"//g")
	script_date=$(cat $dir_file/config.txt | grep -v "#" | grep "script_date" | awk -F "=" '{print $2}' | sed "s/\"//g")

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

		if [ "$script_ifname" == "" ];then
			echo "script_ifname为空"
		elif [ "$script_ifname" == "*" ];then
			auto_run="(全部自动运行)"
			for i in `echo $Add |sed "s/$wrap//g" | sed "s/$wrap_tab//g"`
			do
				cp ${File_path}/${i} ${script_dir}/${i}
				echo "${i}(全部自动运行),当前时间`date`" >>/tmp/run_script.log
				$node ${script_dir}/${i} >>/tmp/run_script.log &
				sleep 3 && ps -ww | grep "${i}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >>/tmp/run_script_ps.log
			done
		elif [ `echo ${script_ifname} | grep -o "|" |sort -u | wc -l` == "1" ];then
			url=$(echo $url_test | sed "s/README.md//g")
			for i in `echo $Add |sed "s/$wrap//g" | sed "s/$wrap_tab//g"`
			do
				if [ `echo $i | grep -E "${script_ifname}" |wc -l` == "1" ];then
					auto_run="(个别自动运行)"
					cp ${File_path}/${i} ${script_dir}/${i}
					echo "${i}(个别自动运行),当前时间`date`" >>/tmp/run_script.log
					$node ${script_dir}/${i} >>/tmp/run_script.log &
					sleep 3 && ps -ww | grep "${i}" |grep -v grep | awk '{print $1}' |sed "s/$/,/g" >>/tmp/run_script_ps.log
				else
					echo
				fi
			done
		else
			echo "未能识别script_ifname的字符：$script_ifname"
		fi

}

checkjs_config_if() {
	checkjs_config_version="1.1"
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
#是否自动跑新增的脚本(默认no，跑yes)
script_if="no"

#脚本名判断(* 代表无论新增什么脚本都跑，你可以这里填关键字用，隔开，如填opencard,gua  这样脚本含有这两个字符的就会开始跑)
script_ifname="opencard,gua"

#脚本下载到那个路径并执行
script_dir="/usr/share/jd_openwrt_script/JD_Script/js"

#脚本在那个时间自动跑(* 代表所有时间 7-18 代表7点到18点有符合的脚本更新就跑 7,9 代表7点 9点才会自己跑)
script_date="*"

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
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




