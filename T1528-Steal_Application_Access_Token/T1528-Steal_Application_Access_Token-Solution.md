# Solution Walkthrough: T1528 (Steal Application Access Token)

### Step 1: Reconnaissance
Modern applications often use tokens (like OAuth or JWT) instead of traditional passwords to authenticate to backend APIs. If an application is poorly coded, it might log these tokens during debugging or tracing. Search user `AppData` directories for custom application logs.
`Get-ChildItem -Path C:\Users\Public\AppData -Filter "*.log" -Recurse -ErrorAction SilentlyContinue`

### Step 2: Extraction
You will discover an application trace log at `C:\Users\Public\AppData\Local\CorpApp\Logs\app_trace.log`. Open the file to inspect the logged HTTP requests.
`Get-Content C:\Users\Public\AppData\Local\CorpApp\Logs\app_trace.log`

### Step 3: Analysis
Review the trace output. You will notice the application makes an HTTP GET request to a backend API and passes the access token in the `Authorization: Bearer` header. 
In a real engagement, you would copy this Bearer token and inject it into your own API requests (using tools like Postman or `curl`) to impersonate the application service account and steal backend data. The flag is also logged as a custom HTTP header.