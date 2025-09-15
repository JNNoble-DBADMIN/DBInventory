# Use official ASP.NET 4.8 runtime image (Windows Server 2022)
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

# -------------------------------
# Step 1: Prepare temp folder for ChartImageHandler
# -------------------------------
RUN powershell -Command \
    New-Item -Path C:\TempImageFiles -ItemType Directory -Force; \
    $acl = Get-Acl C:\TempImageFiles; \
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('IIS_IUSRS','FullControl','ContainerInherit,ObjectInherit','None','Allow'); \
    $acl.SetAccessRule($accessRule); \
    Set-Acl C:\TempImageFiles $acl

# -------------------------------
# Step 2: Install required Windows features
# -------------------------------
RUN powershell -Command \
    Install-WindowsFeature Web-ASP; \
    Install-WindowsFeature Web-Asp-Net45; \
    Install-WindowsFeature Web-Windows-Auth; \
    Install-WindowsFeature Web-Mgmt-Console

# -------------------------------
# Step 3: Set working directory for IIS
# -------------------------------
WORKDIR C:/inetpub/wwwroot

# -------------------------------
# Step 4: Copy your ASP.NET app
# -------------------------------
# Make sure db_inv_web/ contents (not folder itself) are copied into wwwroot
COPY db_inv_web/ .

# -------------------------------
# Step 5: Remove default IIS pages safely
# -------------------------------
RUN powershell -Command \
    "if (Test-Path 'C:\inetpub\wwwroot\iisstart.htm') { Remove-Item 'C:\inetpub\wwwroot\iisstart.*' -Force }; \
     if (Test-Path 'C:\inetpub\wwwroot\welcome.png') { Remove-Item 'C:\inetpub\wwwroot\welcome.png' -Force }"

# -------------------------------
# Step 6: Configure IIS site
# -------------------------------
RUN powershell -Command \
    Import-Module WebAdministration; \
    if (Test-Path IIS:\Sites\Default\) { Remove-Website -Name 'Default Web Site' }; \
    New-Website -Name 'DBInventory' -Port 80 -PhysicalPath 'C:\inetpub\wwwroot' -ApplicationPool '.NET v4.5'

# -------------------------------
# Step 7: Optional: fix Web.config
# -------------------------------
COPY fix-webconfig.ps1 C:/fix-webconfig.ps1
RUN powershell -ExecutionPolicy Bypass -File C:/fix-webconfig.ps1

# -------------------------------
# Step 8: Expose HTTP port
# -------------------------------
EXPOSE 80

# -------------------------------
# Step 9: Healthcheck
# -------------------------------
HEALTHCHECK --interval=30s --timeout=3s \
    CMD powershell -Command \
        "try { $response = Invoke-WebRequest http://localhost/ -UseBasicParsing; if ($response.StatusCode -eq 200) { exit 0 } } catch { exit 1 }"

# -------------------------------
# Step 10: Start IIS
# -------------------------------
ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
