$webConfigPath = 'C:\inetpub\wwwroot\web.config'

if (Test-Path $webConfigPath) {
    [xml]$webConfig = Get-Content $webConfigPath
    $chartHandler = $webConfig.SelectSingleNode("//add[@key='ChartImageHandler']")
    if ($chartHandler) {
        Write-Host "✅ Found ChartImageHandler in web.config, updating value..."
        $chartHandler.SetAttribute('value', 'storage=file;timeout=1800;dir=C:\TempImageFiles\;')
        $webConfig.Save($webConfigPath)
        Write-Host "✅ web.config updated successfully."
    } else {
        Write-Host "⚠️ ChartImageHandler key not found in web.config."
    }
} else {
    Write-Host "❌ web.config not found at $webConfigPath, skipping update."
}
