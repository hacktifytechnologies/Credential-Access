1. What is the absolute path to the application trace log containing the leaked access token? (MCQ)
A) C:\Users\Public\Logs\app_trace.log
B) C:\Users\Public\AppData\Local\CorpApp\Logs\app_trace.log
C) C:\ProgramData\CorpApp\app_trace.log
D) C:\Windows\System32\config\app.log
**Answer:** B

2. Which backend API URL was the application connecting to when the token was logged? (MCQ)
A) https://api.corp.local/v1/auth
B) https://backend.corp.local/api
C) https://auth.local/v1/token
D) https://api.corp.local/v2/secure
**Answer:** A

3. Which HTTP header was utilized to transmit the application access token? (MCQ)
A) X-Auth-Token
B) Session-Key
C) Authorization: Bearer
D) Cookie: Token
**Answer:** C

4. What is the exact string of the access token (Bearer token) extracted from the log? (Fill in the blank)
**Answer:** eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiYXBwX3N2YyIsInJvbGUiOiJhZG1pbiJ9.S3cr3tT0k3n2026!

5. Please submit the exact flag found inside the custom HTTP header of the trace log: _______________ (Fill in the blank)
**Answer:** flag{app_token_stolen_1528}