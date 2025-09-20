echo "-- arslaan's dotfiles installer (MacOS only)  -- "

echo "## Xcode CLI Tools ##"
xcode-select --install

echo "## Homebrew ##"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

echo "## Homebrew Tap ##"
brew tap koekeishiya/formulae
brew tap FelixKratz/formulae

echo "## yabai ##"
echo "Installing yabai..."
brew install koekeishiya/tap/yabai
echo "Cloning config..."
git clone https://github.com/RealArslaanYT/dotfiles.git /tmp/dotfiles
mv $HOME/.config/yabai $HOME/.config/yabai_backup
mv /tmp/dotfiles/.config/yabai $HOME/.config/yabai
echo "Done!"

echo "## skhd ##"
echo "Installing skhd..."
brew install skhd
echo "Cloning config..."
mv $HOME/.config/skhd $HOME/.config/skhd_backup
mv /tmp/dotfiles/.config/skhd $HOME/.config/skhd
echo "Done!"

echo "## JankyBorders ##"
brew install borders
echo "Done!"

echo "## SketchyBar/SbarLua ##"

echo "Installing dependencies.."
brew install lua
brew install switchaudio-osx
brew install nowplaying-cli
echo "Installing sketchybar..."
brew install sketchybar
echo "Installing fonts..."
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
echo "Installing SbarLua..."
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
echo "Cloning config..."
mv $HOME/.config/sketchybar $HOME/.config/sketchybar_backup
mv /tmp/dotfiles/.config/sketchybar $HOME/.config/sketchybar
echo "Done!"

echo "## Other tools & apps ##"
brew install --cask spotify
mas install 497799835 # Xcode
brew install --cask iterm2
brew install --cask vlc
brew install --cask whatsapp
brew install --HEAD brightness # install from HEAD to ensure Apple Silicon support - brew package is outdated
brew install --cask firefox

echo "## Starting services (you may need to grant permissions) ##"
brew services start sketchybar
yabai --start-service
skhd --start-service

csrutil status
echo "(optional) you may want to disable SIP for advanced yabai features."
echo "Installation complete!"
