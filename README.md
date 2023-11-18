# Pockest Auto-Care

## What is this?

This is an [AutoHotkey](https://www.autohotkey.com/) script that automatically cares for [Street Fighter Pockest Monsters](https://www.streetfighter.com/6/buckler/minigame).

It does this by systematically clicking the specified care options (FOOD, CURE, CLEAN) and then will attempt to TRAIN a specified skill (Power, Speed, or Technique). By default, this cycle is performed every minute. Care options, training, and timings can all be customized.

Shout out to the [Pockest Guide on Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=3003515624&tscn=1698405122) and their Discord community.

## How do I use it?

#### Download & Installation

1. [Download and install AutoHotkey v2](https://www.autohotkey.com/download/ahk-v2.exe).
2. [Download this repo](https://github.com/folklorelabs/pockest-auto-care/archive/refs/heads/main.zip).

#### Configure

1. Modify the PockestAutoCare.ini config file to your liking (see Config section below).

#### Run

1. Open https://www.streetfighter.com/6/buckler/minigame in a separate Chrome window.\*
2. Run **PockestAutoCare.ahk**.
3. Press **SHIFT + F12** to toggle the script on/off.

*\* This script depends on window sizing/positioning. Ensure you are using ***Chrome with the bookmarks bar visible***. Otherwise you will need to modify the Size, CanvasX, and CanvasY Settings within PockestAutoCare.ini to match the dimensions of your setup.*


## Config

#### \[CarePlan\]
Care plan settings. Utilize [Pockest Guide on Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=3003515624&tscn=1698405122) to figure out which stats to train and whether or not to care for your pockest.

- **CareDelay**: The amount of time (in ms) to delay running the care plan again.
    - Default: 60000 (1 minute)
    - Type: Number
- **Feed**: Whether or not to feed the Pockest on each care loop.
    - Default: "False"
    - Type: String ("True", "False")
- **Cure**: Whether or not to cure the Pockest on each care loop.
    - Default: "False"
    - Type: String ("True", "False")
- **Clean**: Whether or not to clean the Pockest on each care loop.
    - Default: "False"
    - Type: String ("True", "False")
- **Train**: Whether or not to train the Pockest on each care loop.
    - Default: "False"
    - Type: String ("True", "False")
- **TrainStat**: The stat with which to train the Pockest.
    - Default: "Power"
    - Type: String ("Power", "Speed", "Technique")

#### \[Settings\]
General settings used by the script. Defaults should be good for most users here.

- **WindowTitle**: The title of the window containing the Pockest game. This is used by the script to focus and resize the window. You may need to change this if using a different language.
    - Default: "Pockest | Buckler's Boot Camp | STREET FIGHTER 6 | CAPCOM"
    - Type: String
- **Size**: The size of the Pockest canvas within the browser window. Used for calculating click positions.
    - Default: 302
    - Type: Number
- **CanvasX**: The x-offset of the Pockest canvas within the browser window. Used for calculating click positions.
    - Default: 333
    - Type: Number
- **CanvasY**: The y-offset of the Pockest canvas within the browser window. Used for calculating click positions.
    - Default: 443
    - Type: Number
- **RefreshDelay**: The amount of time (in ms) to delay refreshing the browser window. Useful for preventing game desyncs.
    - Default: 1800000 (30 minutes)
    - Type: Number
