![](https://raw.githubusercontent.com/cairoGarcia/waypoint/master/media/logo.banner.png)
# Waypoint is a fast travel map for the shell
## Travel between directiories quickly

![](https://raw.githubusercontent.com/cairoGarcia/waypoint/master/media/index.gif)

## Why use waypoint instead of bookmarks or autojump?
Waypoint was created thinking on easy and fast use in the terminal, you should just type waypoint + number and you are exactly where you want to be.

Personally I recommend creating an alias "wp" for "waypoint" for faster use

## Requirements

- **sh** (Posix-shell used in the back-end)
- **Lua interpreter**

## Installation
```
# Check if you have the requirements for installing before running, please.
git clone https://github.com/cairoGarcia/waypoint
cd waypoint
sh install.sh
cd ..
rm -fr waypoint
```

## Compatibility
Waypoint is **POSIX-only**. It is not intended to run on non-POSIX platforms and may exhibit unexpected behavior in such environments.

List of Confirmed working shells below

| TESTED SHELLS |  WORKS?  |
| :------------ |  :----:  |
| zsh           |     yes  | 
| sh            |     yes  |
| bash          |     yes  |
| dash          |     yes  |
| fish          |      no  |
| csh           |      no  |
| powershell    |      no  |

## Notes
- A standard Unix-like environment is assumed.
- Most Lua versions may be able to run this project.
- You gotta source the script on every use (usually typing "." as a prefix), so having a sourcing alias seems like a good idea.

  Alias example on .bashrc: alias waypoint=". waypoint"

- Check if you have "~/.local/bin/" PATH set up 

  If not, try using "PATH=~/.local/bin:$PATH" or your shell's way of appending directories to PATH
