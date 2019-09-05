#
# caps-to-esc.sh
#

dumpkeys | head -1 > caps2esc.map
echo "Keycode 58 = Escape" >> caps2esc.map
loadkeys caps2esc.map
