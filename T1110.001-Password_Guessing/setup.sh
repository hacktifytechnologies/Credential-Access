#!/bin/bash
# T1110.001 Setup Script (Ubuntu 22.04 / 24.04)
# Scenario: Local password guessing against a known list of usernames.

# 1. Create the target vulnerable user
useradd -m -s /bin/bash sys_backup
echo "sys_backup:charlie123" | chpasswd

# 2. Create decoy users to pad the username list
useradd -m -s /bin/bash sys_audit
echo "sys_audit:Sup3rS3cur3P@ssw0rd!" | chpasswd
useradd -m -s /bin/bash sys_sync
echo "sys_sync:An0th3rL0ngP@ss!!!" | chpasswd

# 3. Create a forgotten administrative note containing the usernames
mkdir -p /var/opt/admin_notes
cat << 'EOF' > /var/opt/admin_notes/service_accounts.txt
# INTERNAL USE ONLY - Service Account List
sys_audit
sys_sync
sys_backup
admin_local
EOF
chmod 644 /var/opt/admin_notes/service_accounts.txt

# 4. Plant the objective flag in the vulnerable user's directory
echo "flag{brute_force_successful_1110}" > /home/sys_backup/flag.txt
chmod 600 /home/sys_backup/flag.txt
chown sys_backup:sys_backup /home/sys_backup/flag.txt

echo "T1110.001 Challenge Setup Complete."