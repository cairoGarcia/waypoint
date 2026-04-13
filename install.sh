sh uninstall.sh

# Copies and gives executable permission
cp -fr $PWD/src/waypoint* $HOME/.local/bin/

chmod +x $HOME/.local/bin/waypoint.lua $HOME/.local/bin/waypoint
