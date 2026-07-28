#!/bin/sh

set -eu

# enable repeat keys
defaults write -g ApplePressAndHoldEnabled -bool false

# keyboard key repeat timing
defaults write com.apple.Accessibility KeyRepeatEnabled -int 1
defaults write com.apple.Accessibility KeyRepeatDelay -float 0.25
defaults write com.apple.Accessibility KeyRepeatInterval -float 0.03333333299999999

# trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# Remove the annoying beep when changing tabs on Rubymine, by binding
# cmd-ctrl-down/left/right to noop. \UF701, \UF702 and \UF703 are the down, left
# and right arrows. Written only when absent, so a dict with other bindings in
# it is left alone.
keybindings="$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
mkdir -p "$(dirname "$keybindings")"
if [ -s "$keybindings" ]; then
  echo "$keybindings already has content, leaving it alone"
else
  cat > "$keybindings" <<'DICT'
{
    "@^\UF701" = "noop:";
    "@^\UF702" = "noop:";
    "@^\UF703" = "noop:";
}
DICT
fi

echo "Log out and back in for the keyboard, trackpad and key binding changes to take effect."
