# T1555.003 Setup Script (Windows)
$BrowserDir = "C:\Users\Public\AppData\Local\Google\Chrome\User Data\Default"
New-Item -ItemType Directory -Path $BrowserDir -Force | Out-Null
# Simulating an unencrypted SQLite DB or a decrypted dump left behind
$FakeDB = "$BrowserDir\Login Data"
$DbContent = "SQLite format 3... tableloginslogins... url:https://intranet.corp/login user:admin_svc pass:Winter!@#2026 flag{browser_creds_harvested_1555}"
Set-Content -Path $FakeDB -Value $DbContent
Write-Host "T1555.003 Setup Complete."