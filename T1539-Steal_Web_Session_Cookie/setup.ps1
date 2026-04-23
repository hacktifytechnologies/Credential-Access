# T1539 Setup Script (Windows)
$CookieDir = "C:\Users\Public\AppData\Roaming\Mozilla\Firefox\Profiles\xyz123.default"
New-Item -ItemType Directory -Path $CookieDir -Force | Out-Null
$FakeCookieDb = "$CookieDir\cookies.sqlite"
$DbContent = "SQLite format 3... session_id=abc123xyz890 admin.corp.local HTTPOnly flag{session_cookie_hijacked_1539}"
Set-Content -Path $FakeCookieDb -Value $DbContent
Write-Host "T1539 Setup Complete."