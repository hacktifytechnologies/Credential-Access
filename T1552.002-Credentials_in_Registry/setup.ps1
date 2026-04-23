# T1552.002 Setup Script (Windows)
$RegPath = "HKLM:\SOFTWARE\CorpAppSetup"
New-Item -Path $RegPath -Force | Out-Null
New-ItemProperty -Path $RegPath -Name "ServiceAccount" -Value "corp_deploy" -PropertyType String | Out-Null
New-ItemProperty -Path $RegPath -Name "ServicePassword" -Value "R3gistryP@ss!99" -PropertyType String | Out-Null
New-ItemProperty -Path $RegPath -Name "Flag" -Value "flag{registry_keys_harvested_1552}" -PropertyType String | Out-Null
Write-Host "T1552.002 Setup Complete."