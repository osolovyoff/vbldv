#Requires -RunAsAdministrator

$feature = Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.Server*'
if ($feature.State -ne 'Installed') {
    Add-WindowsCapability -Online -Name $feature.Name
}

Set-Service -Name sshd -StartupType Automatic
Start-Service sshd

Set-Service -Name ssh-agent -StartupType Automatic
Start-Service ssh-agent

New-NetFirewallRule -Name 'OpenSSH-Server' -DisplayName 'OpenSSH Server (sshd)' `
    -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22 `
    -ErrorAction SilentlyContinue

Write-Host "SSH server is running on port 22"
