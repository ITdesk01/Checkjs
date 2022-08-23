from telethon.sync import TelegramClient
from telethon import utils
import re
import os
import sys
import time
import logging

if "API_ID" in os.environ:
       if len(os.environ["API_ID"]) > 1:
          api_id = os.environ["API_ID"]
else:
	print ('请设置API_ID值，export API_ID="xxx"\n获取地址参考https://www.jianshu.com/p/3d047c7516cf')
	sys.exit(0)

if "API_HASH" in os.environ:
       if len(os.environ["API_HASH"]) > 1:
          api_hash = os.environ["API_HASH"]
else:
	print ('请设置API_HASH值，export API_HASH="xxx"\n获取地址参考https://www.jianshu.com/p/3d047c7516cf')
	sys.exit(0)

Note=open('tg.log',mode='w')
name = 'test'
channel = ['KingRan521', 'fdd_JSB', 'wondertemple']


with TelegramClient(name, api_id, api_hash) as client:
	print ('频道列表：',channel)
	for i in channel:
		channel_id= client.get_peer_id(i)
		print ('当前监控频道:',i)
		print ('当前监控频道ID:',channel_id)
		msg = client.get_messages(channel_id,limit=20)
		print (msg)
		Note.write(str(msg))
		print ('\n\n文件写入到tg.log')
