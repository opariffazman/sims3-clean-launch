<#
.SYNOPSIS
    This script automates the process of launching a squeaky clean The Sims 3 game session
.DESCRIPTION
    Automatically remove these files:

    CasPartCache.package > CAS parts that appear in Create-A-Sim
    compositorCache.package > New objects that would appear in Buy/Build mode
    scriptCache.package > Mods or Hacks
    simCompositorCache.package > New Sims, default skins
    socialCache.package > Simport-related (maybe?) and other social data, if you use the wall to integrate with your MyPage on thesims3.com site

    AND, additionaly if they exist:

    in DCCache: missingdeps.idx and dcc.ent
    in Downloads: everything ending in ".bin"
    in SIgsCache: everything ending in ".bin"
    in SavedSims: Downloadedsims.index
    in Thumbnails: everything ending in ".package" and every associated thumbnail (thumb_*.png)

    Converted to an executable and can be used as Sims3Launcher to replace original executable (back up original one first) to easily launch directly from Steam
    This effectively skips the default launcher and directly launch the game
.NOTES
    File Name   : Sims3Launcher.ps1
    Author      : ariff.azman
    Version     : 1.0
.LINK
    http://simswiki.info/wiki.php%3Ftitle%3DGame_Help:Sims_3_Delete_Cache_Files
    https://github.com/MScholtes/Win-PS2EXE
.INPUTS
    Bin folder containing TS3.exe
.OUTPUTS
    Minimal .log transcript file
#>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm:$false

$sims3DocPath = "$env:USERPROFILE\Documents\Electronic Arts\The Sims 3"
$currTranscriptName = "$sims3DocPath\sims3-clean-launch.log"
Start-Transcript -Path $currTranscriptName | Out-Null

$folderItems = @(
    [PSCustomObject]@{Path = "$sims3DocPath"; File = "*.package" } # removing those 5 saved game cache .package
    [PSCustomObject]@{Path = "$sims3DocPath\FeaturedItems"; File = "thumb_*.png" } # removing FeaturedItems .png thumbnails
    [PSCustomObject]@{Path = "$sims3DocPath\Thumbnails"; File = "*.package" } # removing Thumbnails .package
    [PSCustomObject]@{Path = "$sims3DocPath\DCBackup"; File = "0*.package" } # removing DCBackup .package
    [PSCustomObject]@{Path = "$sims3DocPath\DCCache"; File = "missingdeps.idx" } # removing DCCache file
    [PSCustomObject]@{Path = "$sims3DocPath\DCCache"; File = "dcc.ent" } # removing DCCache file
    [PSCustomObject]@{Path = "$sims3DocPath\Download"; File = "*.bin" } # removing Download .bin
    [PSCustomObject]@{Path = "$sims3DocPath\SigsCache"; File = "*.bin" } # removing SigsCache .bin
    [PSCustomObject]@{Path = "$sims3DocPath\SavedSims"; File = "Downloadedsims.index" } # removing SavedSims .index
    [PSCustomObject]@{Path = "$sims3DocPath\IGACache"; File = "." } # removing IGACache file
    [PSCustomObject]@{Path = "$sims3DocPath\WorldCaches"; File = "*.package" } # removing riverworld .package
)

$folderItems | ForEach-Object {

  $fileToRemove = Get-ChildItem -Path $_.Path -Filter $_.File -ErrorAction 'SilentlyContinue'

  if ($fileToRemove) { # only execute if exist

    Write-Verbose -Message "Removing `"$($_.Path)\`" for $($_.File) files" -Verbose
    $fileToRemove | ForEach-Object {
      Remove-Item -Path $fileToRemove.FullName -Force -ErrorAction 'SilentlyContinue' -Confirm:$false
    }
  }
  else {
    Write-Warning -Message "Skipping `"$($_.Path)\`" for $($_.File) files"
  }

}

$ts3exePath = (Get-Process -Id $pid).Path -replace 'Sims3Launcher.exe', 'TS3.exe'

try {
  Start-Process "$ts3exePath" -ErrorAction 'Stop'
  Write-Verbose -Message "Starting Sims 3 squeaky clean gameplay session from `"$ts3exePath`"" -Verbose
}
catch {
  Write-Warning -Message "Error starting Sims 3 from `"$ts3exePath`", ensure the .ps1 or exe  in the same directory with TS3.exe"
}

Stop-Transcript | Out-Null
