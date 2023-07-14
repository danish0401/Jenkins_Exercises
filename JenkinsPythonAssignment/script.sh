#!/usr/bin/bash
ec2publicdns=$(aws ec2 describe-instances --region us-west-2 --instance-ids i-09875111f30d6ee92 --query 'Reservations[].Instances[].PublicDnsName' --output text)
ssh $ec2publicdns "$( cat << 'EOT'
sudo pip3 install -r requirements.txt 
cp app.py /tmp
sudo chmod +x /tmp/app.py
sudo su - root -c "lsof -i :5000 | xargs kill -9" &> /dev/null
sudo su - root -c "/usr/bin/nohup /usr/bin/python3 /tmp/app.py > /tmp/logs 2>&1 &"
EOT
)"
