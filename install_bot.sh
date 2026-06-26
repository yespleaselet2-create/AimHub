#!/bin/bash
apt update && apt install python3 python3-pip nodejs npm git -y
npm install -g pm2
pip3 install discord.py python-dotenv
pm2 start nyx_bot.py --name nyxbot --interpreter python3
pm2 save
pm2 startup
echo 'Bot setup complete. Run: pm2 logs nyxbot'
