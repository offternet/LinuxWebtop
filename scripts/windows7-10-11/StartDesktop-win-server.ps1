# webtop-server-clean.ps1
# Run as Administrator: powershell -ExecutionPolicy Bypass -File webtop-server-clean.ps1
#Copyright 2026 (c) Robert J. Cooper - robert@StartDesktop.com

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

$port = 9000
$logFile = "$env:TEMP\webtop.log"
$listener = $null

# Start the listener
try {
    if ([System.Net.HttpListener]::IsSupported) {
        $listener = New-Object System.Net.HttpListener
        $listener.Prefixes.Add("http://+:$port/")
        $listener.Prefixes.Add("http://localhost:$port/")
        $listener.Start()
        Write-Host "Server listening on port $port" -ForegroundColor Green
        Write-Host "Log file: $logFile" -ForegroundColor Cyan
        Write-Host "Test with: http://localhost:$port/linuxapps/notepad" -ForegroundColor Yellow
        Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
    } else {
        Write-Host "HttpListener not supported on this system" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Failed to start server: $_" -ForegroundColor Red
    exit 1
}

function Write-Log {
    param($msg)
    $timestamp = Get-Date -Format "HH:mm:ss"
    $logMsg = "[$timestamp] $msg"
    Add-Content -Path $logFile -Value $logMsg
    Write-Host $logMsg
}

function Invoke-App {
    param($appName)
    Write-Log "Launch: $appName"
    switch ($appName) {
        "notepad"   { Start-Process notepad.exe }
        "calc"      { Start-Process calc.exe }
        "cmd"       { Start-Process cmd.exe }
        "explorer"  { Start-Process explorer.exe }
        "devmgmt"   { Start-Process devmgmt.msc }
        "ncpa"      { Start-Process ncpa.cpl }
        "control"   { Start-Process control.exe }
        "regedit"   { Start-Process regedit.exe }
        default {
            $err = $null
            try {
                Start-Process $appName -ErrorAction Stop
                Write-Log "OK: $appName"
            } catch {
                Write-Log "FAILED: $appName - $_"
            }
        }
    }
}

# Main request loop
while ($true) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawUrl = $request.RawUrl
        Write-Log "Request: $rawUrl"

        # Process only /linuxapps/ requests
        if ($rawUrl -match "/linuxapps/([a-zA-Z0-9_-]+)") {
            $app = $matches[1]
            Invoke-App $app
        } elseif ($rawUrl -eq "/favicon.ico") {
            Write-Log "Ignored favicon"
        } else {
            Write-Log "Ignored (no match): $rawUrl"
        }

        # Send a tiny HTML page that closes itself
        $html = '<html><body onload="window.close()">OK</body></html>'
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($html)
        $response.ContentLength64 = $buffer.Length
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
        $response.OutputStream.Close()
        $response.Close()

    } catch {
        Write-Log "Error in loop: $_"
        # If the listener was stopped, exit the loop
        if ($_.Exception.Message -match "Listener was stopped") {
            break
        }
    }
}

# Cleanup
$listener.Stop()
Write-Log "Server stopped"
