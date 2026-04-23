#!/bin/bash
# T1552.004 Setup Script (Linux)
mkdir -p /opt/backups/ssh_keys
cat << 'EOF' > /opt/backups/ssh_keys/id_rsa_admin
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBSimB9/SIMULATED_KEY_DATA_DO_NOT_USE_yXo9Xq8AAAAJiC1VfUgtV
X1AAAAC3NzaC1lZDI1NTE5AAAAIFKKYH39/SIMULATED_KEY_DATA_DO_NOT_USE_yXo9X
q8AAAEBi+Qy/flag{private_ssh_key_stolen_1552}
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 755 /opt/backups/ssh_keys
chmod 644 /opt/backups/ssh_keys/id_rsa_admin
Write-Host "T1552.004 Setup Complete."