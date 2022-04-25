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
