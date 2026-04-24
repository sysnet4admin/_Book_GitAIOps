@echo off
REM Claude Code Windows PATH fix
REM Adds %USERPROFILE%\.local\bin to user PATH registry (permanent)
REM Referenced from ch2.md 2.2.2 Windows install note

powershell -NoProfile -Command "$t=[IO.Path]::Combine($env:USERPROFILE,'.local','bin'); $c=[Environment]::GetEnvironmentVariable('PATH','User'); if ($c -and $c.Split(';') -contains $t) { Write-Host ('PATH already contains ' + $t) -ForegroundColor Yellow } else { $new = if ($c) { \"$c;$t\" } else { $t }; [Environment]::SetEnvironmentVariable('PATH', $new, 'User'); Write-Host ('PATH updated with ' + $t + '. Open a NEW PowerShell window to use claude.') -ForegroundColor Green }"

pause
