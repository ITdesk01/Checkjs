# Checkjs
openwrt使用，用于监测个别github仓库变化，并通过Server酱推送告知

## 支持系统
openwrt X86 （基于x86测试）

## Usage 使用方法
```sh
git clone https://github.com/ITdesk01/Checkjs.git /usr/share/Checkjs
cd /usr/share/Checkjs && chmod 777 checkjs.sh
sh checkjs.sh
```

## 定时任务（需要手动复制过去）
```sh
15 10,18,21 * * * /usr/share/Checkjs/checkjs.sh >/tmp/checkjs.log 2>&1
30 21 * * * /usr/share/Checkjs/checkjs.sh update_script  >/tmp/checkjs_update_script.log 2>&1
```

##感谢
Javon(基于他的模板改写)
