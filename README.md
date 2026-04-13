![](https://raw.githubusercontent.com/cairoGarcia/waypoint/master/media/logo.banner.png)
# Waypoint is a fast travel map for the shell

![](https://raw.githubusercontent.com/cairoGarcia/waypoint/master/media/index.gif)

## Requirements

- **sh** (Posix-shell used in the back-end)
- **Lua interpreter**

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
