$cutoffDate = (Get-Date).AddDays(-7)

Write-Host "Current Date:"
Get-Date

Write-Host "`nCutoff Date:"
$cutoffDate

$files = Get-ChildItem -File |
    Where-Object {
        $_.LastWriteTime -ge $cutoffDate
    }

Write-Host "`nFiles modified in the last 7 days:"
$files | Select-Object Name, LastWriteTime

Write-Host "`nTesting file copy:"
Copy-Item .\sample1.txt .\sample1-backup.txt -WhatIf