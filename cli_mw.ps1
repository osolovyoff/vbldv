Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public static class Mouse {
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);

    public const int MM = 0x0001;
}
"@

$rand = New-Object System.Random
while ($true) {
    $dx = $rand.Next(-10, 20)
    $dy = $rand.Next(-10, 20)

    [Mouse]::mouse_event([Mouse]::MM, $dx, $dy, 0, 0)
    Start-Sleep -Milliseconds 1
    [Mouse]::mouse_event([Mouse]::MM, -1*$dx, -1*$dy, 0, 0)

    Start-Sleep -Seconds 60
}