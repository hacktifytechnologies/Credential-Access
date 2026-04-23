# T1558.003 Setup Script (Windows)
# Since a full AD environment cannot be guaranteed, we simulate an offline Kerberoast cracking challenge
# by placing an exported Hashcat-formatted TGS ticket in a typical dumping folder.
$DumpDir = "C:\Temp\BloodHound_Data"
New-Item -ItemType Directory -Path $DumpDir -Force | Out-Null
$Hash = "`$krb5tgs`$23`$*svc_sql*CORP.LOCAL*MSSQLSvc/db01.corp.local*`$03E8...[SIMULATED_HASH]...`nPassword is: SqlAdmin2026! (Simulated Crack) `nflag{kerberoast_ticket_cracked_1558}"
Set-Content -Path "$DumpDir\kerberoast_hashes.txt" -Value $Hash
Write-Host "T1558.003 Setup Complete."