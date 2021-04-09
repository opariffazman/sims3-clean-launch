# sims3-clean-launch

A Sims3Launcher executable replacement with automated cleaning of game files on starting up.

# USAGE

  - Download the [Sims3Launcher.exe](https://github.com/opariffazman/sims3-clean-launch/releases/download/1.0/Sims3Launcher.exe)

  - Navigate to The Sims 3 Bin folder that contains TS3.exe, should be something like this (.\The Sims 3\Game\Bin\)

  - Rename the original Sims3Launcher.exe inside this folder to something like Sims3Launcher.exe.bak or anything

  - Copy the previously downloaded Sims3Launcher3.exe to this folder and you'll be able to launch direclty from steam/origin.

# SYNOPSIS

  This script automates the process of launching a squeaky clean The Sims 3 game session

# DESCRIPTION

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

# NOTES

    File Name   : Sims3Launcher.ps1 / Sims3Launcher.exe
    Author      : ariff.azman
    Version     : 1.0

# LINK

  http://simswiki.info/wiki.php%3Ftitle%3DGame_Help:Sims_3_Delete_Cache_Files

  https://github.com/MScholtes/Win-PS2EXE (Compiled to an easy to use Sims3Launcher.exe executable file)

# INPUTS

  None

# OUTPUTS

  Minimal .log transcript file
