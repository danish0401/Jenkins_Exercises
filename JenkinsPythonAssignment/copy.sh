#!/usr/bin/bash
ec2publicdns=$(aws ec2 describe-instances --region us-west-2 --instance-ids i-09875111f30d6ee92 --query 'Reservations[].Instances[].PublicDnsName' --output text)
scp app.py ec2-user@$ec2publicdns:. 
scp script.sh ec2-user@$ec2publicdns:. 
scp requirements.txt ec2-user@$ec2publicdns:. 