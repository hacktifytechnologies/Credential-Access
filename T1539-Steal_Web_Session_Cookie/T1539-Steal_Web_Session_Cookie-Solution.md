# Solution Walkthrough: T1539 (Steal Web Session Cookie)

### Step 1: Reconnaissance
Instead of stealing passwords, stealing a valid web session cookie allows attackers to bypass MFA entirely (Pass-the-Cookie). Search user profiles for browser cookie databases, such as `cookies.sqlite` (Firefox).
`Get-ChildItem -Path C:\Users -Filter "cookies.sqlite" -Recurse -ErrorAction SilentlyContinue`

### Step 2: Extraction
You will locate the file at `C:\Users\Public\AppData\Roaming\Mozilla\Firefox\Profiles\xyz123.default\cookies.sqlite`.

### Step 3: Analysis
Read the contents of the database. Look for session identifiers (e.g., `session_id`, `JSESSIONID`) associated with corporate domains.
`Select-String -Path "C:\Users\Public\AppData\Roaming\Mozilla\Firefox\Profiles\xyz123.default\cookies.sqlite" -Pattern "session_id"`
You will discover the active session token and the challenge flag. In a real scenario, you would inject this cookie into your own browser to hijack the session.