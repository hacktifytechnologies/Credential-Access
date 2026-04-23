# T1003.002 Setup Script (Windows Server 2012/2016/2019/2025)
# Scenario: SAM and SYSTEM hives exported to an unsecured directory

$BackupDir = "C:\Backup_Hives_Dir"
if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
}

# 1. Create a dummy user to act as the target account
$TargetUser = "sec_admin_99"
$PlainPass = "Winter2026@!!!"
$Password = ConvertTo-SecureString $PlainPass -AsPlainText -Force
New-LocalUser -Name $TargetUser -Password $Password -Description "Secondary Admin Account" | Out-Null
Add-LocalGroupMember -Group "Administrators" -Member $TargetUser | Out-Null

# 2. Save the SAM and SYSTEM hives to the insecure directory
# We use cmd.exe to execute the reg commands silently
Start-Process cmd.exe -ArgumentList "/c reg save HKLM\SAM $BackupDir\SAM_backup.hive /y" -Wait -WindowStyle Hidden
Start-Process cmd.exe -ArgumentList "/c reg save HKLM\SYSTEM $BackupDir\SYSTEM_backup.hive /y" -Wait -WindowStyle Hidden

# 3. Set weak permissions on the backup directory allowing anyone to read
$Acl = Get-Acl $BackupDir
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $BackupDir $Acl

# 4. Create the objective flag on the target user's desktop
$DesktopPath = "C:\Users\$TargetUser\Desktop"
if (-not (Test-Path $DesktopPath)) {
    New-Item -ItemType Directory -Path $DesktopPath -Force | Out-Null
}
Set-Content -Path "$DesktopPath\flag.txt" -Value "flag{sam_extraction_successful_99}"

Write-Host "T1003.002 Challenge Setup Complete."