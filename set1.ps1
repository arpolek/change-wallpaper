Add-Type @"
using System;
using System.Runtime.InteropServices;
using Microsoft.Win32;
namespace Wallpaper
{
   public enum Style : int
   {
       Tile, Center, Stretch, NoChange
   }
   public class Setter {
      public const int SetDesktopWallpaper = 20;
      public const int UpdateIniFile = 0x01;
      public const int SendWinIniChange = 0x02;
      [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
      private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
      public static void SetWallpaper ( string path, Wallpaper.Style style ) {
         SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
         RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
         key.SetValue(@"WallpaperStyle", "2") ; 
         key.SetValue(@"TileWallpaper", "0") ;
         key.Close();
      }
   }
}
"@

$Plik = Get-Random -InputObject "D:\1.bmp", "D:\2.bmp", "D:\3.bmp", "D:\4.bmp", "D:\5.bmp", "D:\6.bmp", "D:\7.bmp", "D:\8.bmp"
[Wallpaper.Setter]::SetWallpaper( $Plik, 0 )