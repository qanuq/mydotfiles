#!/bin/bash

# uncomment to debug
# set -x

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# headless install of xcode command line tools
if ! xcode-select -p &> /dev/null; then
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  CLTX=$(softwareupdate --list | \
         grep "\*.*Command Line Tools" | \
         tail -n 1 | \
         awk -F"Label: " '{print $2}' \
        )
  softwareupdate --verbose --install "$CLTX"
  rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi

# install homebrew if it is not already installed
export HOMEBREW_NO_GITHUB_API=1
which brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

./Brewfile
./Caskfile

# add sudoedit link
ln -s /usr/bin/sudo /usr/local/bin/sudoedit

# since big sur, zsh version is the same as zsh bundled with brew
# sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
# chsh -s /usr/local/bin/zsh

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/System/Applications/App Store.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Contacts.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Music.app"

dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/MacVim.app"
dockutil --no-restart --add "/Applications/Sourcetree.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Insomnia.app"
dockutil --no-restart --add "/Applications/Postman.app"
dockutil --no-restart --add "/Applications/VirtualBox.app"

dockutil --no-restart --add "/Applications/Bitwarden.app"
dockutil --no-restart --add "/Applications/Authy Desktop.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/qutebrowser.app"
dockutil --no-restart --add "/Applications/TeamViewer.app"
dockutil --no-restart --add "/Applications/Microsoft Excel.app"
dockutil --no-restart --add "/Applications/Microsoft PowerPoint.app"
dockutil --no-restart --add "/Applications/Microsoft Word.app"
dockutil --no-restart --add "/Applications/Signal.app"
dockutil --no-restart --add "/Applications/Transmission.app"
dockutil --no-restart --add "/Applications/VLC.app"



# restart your mac automatically after it freezes
sudo systemsetup -setrestartfreeze on

# set timezone
sudo systemsetup -settimezone "Europe/Paris"

# silence at boot time
sudo nvram SystemAudioVolume=" "

# check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# automatically install updates
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -int 1

# enable ssh
sudo systemsetup -f -setremotelogin on

# add extra information to login window when clicking on the time
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# sleep the display after 5 minutes on battery
sudo pmset -b displaysleep 5

# sleep the display after 10 minutes on charger
sudo pmset -c displaysleep 10


######################
# system preferences #
######################


### general settings

# automatically switch dark / light style
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -int 1

# set highlight color to orange
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Orange"

# set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# automatically hide and show the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# click in the scrollbar to jump to the clicked spot (option key to override)
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# TODO default browser ?

# disable change confirmation when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool false

# close windows when quitting an app
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# TODO recent elements

# disable handoff
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false

### desktop and screensaver

# TODO


### dock

# set dock icon size
defaults write com.apple.dock tilesize -int 40

# disable dock resizing
defaults write com.apple.Dock size-immutable -bool true

# disable magnification
defaults write com.apple.dock magnification -bool false

# dock is at the bottom of screen
defaults write com.apple.dock orientation -string 'bottom'

# minimize windows using suck effect
defaults write com.apple.dock mineffect -string 'suck'

# TODO prefer tabs for opening documents, manually

# TODO double clic on title bar to put in the dock

# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# do not animate opening applications from the dock
defaults write com.apple.dock launchanim -bool false

# automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# do not show recent applications
defaults write com.apple.dock show-recents -bool false

# remove the auto-hiding dock delay
defaults write com.apple.dock autohide-delay -float 0

# decrease animation time when hiding/showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0.25

# enable dock spring opening and stacks item finder
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# enable highlight hover effect for the grid view of a stack (dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# hot corners
# top-right with alt modifier starts screen saver
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 524288


### mission control

# TODO


### siri

# disable ask siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# disable show siri in menu bar
defaults write com.apple.siri StatusMenuVisible -bool false


### spotlight

# TODO

### language

# TODO


### keyboard

# disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# set a fast key repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# enable navigation with tab or shift-tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# disable auto correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# disable auto capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# disable two spaces to get a dot
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

### security and privacy




# disable screenshot shadows
defaults write com.apple.screencapture disable-shadow -bool true

# screenshots are saved into ~/Pictures/Screenshots in png format
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string ~/Pictures/Screenshots
defaults write com.apple.screencapture type -string png

# disable saving to icloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# manually open tabs when opening documents
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'manual'

# double-click a window's title bar to minimize
defaults write NSGlobalDomain AppleActionOnDoubleClick -string 'Minimize'

###################
# finder settings #
###################

# allow finder to quit
defaults write com.apple.finder QuitMenuItem -bool true

# display file extensions in finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable cmd + i animation
defaults write com.apple.finder DisableAllAnimations -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# set this path bar relative to the home directory
defaults write com.apple.finder PathBarRootAtHome -bool true

# show side bar
defaults write com.apple.finder ShowSidebar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# open home directory in new finder window or tab
defaults write com.apple.finder NewWindowTarget 'PfHm'
defaults write com.apple.finder NewWindowTargetPath "'file://$HOME'"

# open in new tab instead of window
defaults write com.apple.finder FinderSpawnTab -bool true

# delete items from the Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# warn before emptying the trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# use list view in all finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# automatically open a new finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# enable airdrop over ethernet and on unsupported macs running lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

#################
# miscellaneous #
#################

# expand save menu
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print menu
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# restart affected services
killall Dock
killall Finder
killall SystemUIServer

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# install zsh-history-substring-search plugin
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
