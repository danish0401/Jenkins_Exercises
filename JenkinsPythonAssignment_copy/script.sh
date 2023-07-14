#!/usr/bin/bash
cp app.py /tmp
sudo chmod +x /tmp/app.py
sudo su - root -c "lsof -i :5000 | xargs kill -9"
sudo su - root -c "/usr/bin/nohup /usr/bin/python3 /tmp/app.py > /tmp/logs 2>&1 & "
echo "In the Script running python" 

