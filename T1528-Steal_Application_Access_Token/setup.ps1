# T1528 Setup Script (Windows)
# Scenario: An internal application logs its backend API access tokens locally.

$AppLogDir = "C:\Users\Public\AppData\Local\CorpApp\Logs"
if (-not (Test-Path $AppLogDir)) {
    New-Item -ItemType Directory -Path $AppLogDir -Force | Out-Null
}

# Generate a simulated application trace log
$LogFile = "$AppLogDir\app_trace.log"
$LogContent = @"
[2026-04-24 08:15:22] [INFO] App Initialization started...
[2026-04-24 08:15:23] [DEBUG] Connecting to backend API at https://api.corp.local/v1/auth
[2026-04-24 08:15:24] [INFO] Authentication successful for identity: app_svc_account
[2026-04-24 08:15:24] [DEBUG] Received Session Token.
[2026-04-24 08:15:25] [TRACE] HTTP Request Outbound:
GET /v1/data/secure HTTP/1.1
Host: api.corp.local
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYXBwX3N2YyIsInJvbGUiOiJhZG1pbiJ9.S3cr3tT0k3n2026!
X-App-Flag: flag{app_token_stolen_1528}

[2026-04-24 08:15:26] [INFO] Data retrieved successfully.
"@

Set-Content -Path $LogFile -Value $LogContent
Write-Host "T1528 Challenge Setup Complete."