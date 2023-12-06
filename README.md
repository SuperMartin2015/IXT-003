aws ec2 run-instances --image-id ami-01bc990364452ab3e --count 1 --instance-type t2.micro --key-name Key-pair  --security-group-ids sg-0b823fe4a0c8d67aa  --user-data file://script.sh --region us-east-1\
ssh -i "E:\LABS\Key-pair.pem" ec2-user@ec2-54-221-103-236.compute-1.amazonaws.com"# IXT-3" 
"# IXT-03" 
