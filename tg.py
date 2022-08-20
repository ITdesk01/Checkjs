from telethon.sync import TelegramClient
from telethon import utils
import re
import os
import sys
import time
import logging

if "NAME" in os.environ:
       if len(os.environ["NAME"]) > 1:
          name = os.environ["NAME"]
else:
	print ('请设置NAME值，export NAME="xxx"')
	sys.exit(0)

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

channel = ['KingRan521', 'fdd_JSB']


with TelegramClient(name, api_id, api_hash) as client:
	print ('频道列表：',channel)
	for i in channel:
		channel_id= client.get_peer_id(i)
		print ('当前监控频道:',i)
		print ('当前监控频道ID:',channel_id)
		msg = client.get_messages(channel_id,limit=10)
		print (msg)
