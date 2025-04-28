#!/bin/bash

# อัปเดตเครื่อง
sudo apt update -y

# ติดตั้ง Node.js และ npm
sudo apt install nodejs -y
sudo apt install npm -y

# ติดตั้ง Yarn และ PM2
npm install --global yarn
npm install -g n
n 22.14.0 # ใช้ n ติดตั้ง Node.js เวอร์ชัน 22.14.0
hash -r
yarn global add pm2

# ตรวจสอบเวอร์ชัน
node -v
npm -v
yarn -v

# Clone frontend project
git clone https://github.com/SOBC67/SOBC-front.git
cd SOBC-front
pm2 start "yarn run dev" --name SOBC-frontend
npx update-browserslist-db@latest
cd ..

# Clone backend project
git clone https://github.com/SOBC67/Fast.git
cd Fast

# ติดตั้ง Python และ venv
sudo apt install python3-pip -y
sudo apt install python3.12-venv -y

# สร้างและ activate venv
python3 -m venv venv
source venv/bin/activate

# ติดตั้ง Python packages
pip install --upgrade pip
pip install -r requirements.txt

# รัน Backend ด้วย PM2
pm2 start "uvicorn app:app --host 0.0.0.0 --port 5000" --name SOBC-backend

