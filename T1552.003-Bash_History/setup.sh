#!/bin/bash
# T1552.003 Setup Script (Linux)
useradd -m -s /bin/bash dev_user
echo "dev_user:dev123" | chpasswd
cat << 'EOF' > /home/dev_user/.bash_history
cd /var/www/html
nano config.php
mysql -u root -p'D@t@b@seAdmin88!' database_prod
echo "flag{bash_history_creds_1552}" > /tmp/secret.txt
EOF
chmod 644 /home/dev_user/.bash_history
Write-Host "T1552.003 Setup Complete."