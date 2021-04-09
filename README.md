# sims3-clean-launch

A hassle free Sims3Launcher executable replacement with automated cleaning of game files on starting up.

# USAGE

  - Download my custom [Sims3Launcher.exe](https://github.com/opariffazman/sims3-clean-launch/releases/download/1.0/Sims3Launcher.exe)

  - Navigate to The Sims 3 Bin folder that contains **TS3.exe**, should be something like this (_.\The Sims 3\Game\Bin\_) _on steam you can just do the following to find it easier_

![steam-browse-local-files](https://steamuserimages-a.akamaihd.net/ugc/1807607607600193259/D853D4F136DD36EE233CB9B02753428243DF6C43/)

  - Rename the original **Sims3Launcher.exe** inside this folder to something like **Sims3Launcher.original.exe** or anything

![rename-original-launcher](https://steamuserimages-a.akamaihd.net/ugc/1807607607600187069/E2B26CE6F9522B645630A250323EB60B4143FEE4/)

  - Copy and paste the previously downloaded [Sims3Launcher.exe](https://github.com/opariffazman/sims3-clean-launch/releases/download/1.0/Sims3Launcher.exe) inside this folder and you'll be able to launch it directly from steam/origin.

![copy-custom-launcher](https://steamuserimages-a.akamaihd.net/ugc/1807607607600225985/7733E167CB3A1F01097FE7E86DFA17C695EE336D/)

# SYNOPSIS

  This script automates the process of launching a squeaky clean The Sims 3 game session

# DESCRIPTION

    Automatically remove these cached files on launch if exists:

    CasPartCache.package > CAS parts that appear in Create-A-Sim
    compositorCache.package > New objects that would appear in Buy/Build mode
    scriptCache.package > Mods or Hacks
    simCompositorCache.package > New Sims, default skins
    socialCache.package > Simport-related (maybe?) and other social data, if you use the wall to integrate with your MyPage on thesims3.com site

    FeaturedItems > "thumb_*.png"
    Thumbnails > "*.package"
    DCBackup > "0*.package"

    Some sort of index or cache repository for the launcher, could be corrupted and stall launch or crash:

    DCCache > missingdeps.idx and dcc.ent
    Downloads > "*.bin"
    SIgsCache > "*.bin"
    SavedSims > "Downloadedsims.index"
    IGACaches > everything
    WorldCaches > "*.package"

    Converted to an executable and can be used as Sims3Launcher to replace original executable (back up original one first) to easily launch directly from Steam
    This effectively skips the default launcher and directly launch the game

# NOTES

    File Name   : Sims3Launcher.ps1 / Sims3Launcher.exe
    Author      : ariff.azman
    Version     : 1.0

# LINK

  http://simswiki.info/wiki.php%3Ftitle%3DGame_Help:Sims_3_Delete_Cache_Files (Reference for files deletion)

  https://github.com/MScholtes/Win-PS2EXE (Compiled to an easy to use Sims3Launcher.exe executable file)
  
  https://steamcommunity.com/id/opsedar/myworkshopfiles/?section=guides&appid=47890 (Guide on Steam)

# INPUTS

  None

# OUTPUTS

  Minimal .log transcript file
