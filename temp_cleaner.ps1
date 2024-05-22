# Caminhos para pastas temporárias
$tempPaths = @(
    "$env:TEMP",
    "$env:WINDIR\Temp"
)

foreach ($path in $tempPaths) {
    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -Force | ForEach-Object {
            try {
                Remove-Item $_.FullName -Force -Recurse
                Write-Host "Removed: $($_.FullName)"
            } catch {
                Write-Host "Failed to remove: $($_.FullName) - $_"
            }
        }
    }
}

Write-Host "Temporary files cleanup completed."
