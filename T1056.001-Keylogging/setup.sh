#!/bin/bash
# T1056.001 Setup Script (Linux)
mkdir -p /var/tmp/.hidden
cat << 'EOF' > /var/tmp/.hidden/klog_out.txt
[10:00:01] [ENTER]
[10:00:05] ssh sysadmin@10.0.0.5[ENTER]
[10:00:12] Password: K3yB0ardWarr!or[ENTER]
[10:01:00] flag{keylogger_file_discovered_1056}[ENTER]
EOF
chmod 644 /var/tmp/.hidden/klog_out.txt
Write-Host "T1056.001 Setup Complete."