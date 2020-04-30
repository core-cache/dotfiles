defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false # disable Press&Hold - needed for vscode VIM extension
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO # switch off font smoothing - should fix blurry fonts

# install command line tools
# xcode-select --install

# uninstall command line tools
# sudo rm -rf $(xcode-select -print-path)
