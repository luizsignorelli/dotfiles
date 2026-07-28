#!/bin/sh

# enable repeat keys
defaults write -g ApplePressAndHoldEnabled -bool false

# keyboard key repeat timing
defaults write com.apple.Accessibility KeyRepeatEnabled -int 1;
defaults write com.apple.Accessibility KeyRepeatDelay -float 0.25
defaults write com.apple.Accessibility KeyRepeatInterval -float 0.03333333299999999

# trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1


mkdir ~/Library/KeyBindings
touch ~/Library/KeyBindings/DefaultKeyBinding.dict
echo 'Remove anoying beep when changing tabs on Rubymine
Add this JSON to ~/Library/KeyBindings/DefaultKeyBinding.dict
{
    "@^\UF701" = "noop:";
    "@^\UF702" = "noop:";
    "@^\UF703" = "noop:";
}'
