#!/bin/bash
    sudo yum install -y cronie

    sudo systemctl start crond
    sudo systemctl enable crond

    touch /var/log/sysinfo.log

    sudo echo '#!/bin/bash' > /root/sysinfo.sh
    sudo echo 'echo "--------------" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "System Time and Date:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'date >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "System Uptime, Logged-in Users, and CPU Load:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'w >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "Memory Usage:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'free -m >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "Disk Space Usage:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'df -h >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "List of Programs using Open TCP Ports:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'ss -tulpn >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "Check Connection to ukr.net:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'ping -c1 -w1 ukr.net >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'echo "List of SUID Programs:" >> /var/log/sysinfo.log' >> /root/sysinfo.sh
    sudo echo 'find / -type f -perm /4000 >> /var/log/sysinfo.log' >> /root/sysinfo.sh

    chmod +x /root/sysinfo.sh

    echo '* * * * 1-5 root /root/sysinfo.sh' >> /etc/crontab