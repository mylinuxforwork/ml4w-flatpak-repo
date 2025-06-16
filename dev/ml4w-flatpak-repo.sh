gpg="5544907F31DF39950A1A576F48F295379AF3AC1E"

_build_app() {
    app=$1
    flatpak-builder --force-clean --repo=./ml4w-flatpak-repo/repo --gpg-sign=$gpg flatpak-builder_tmp /home/raabe/Projects/$app
}

# _build_app "dotfiles-welcome/com.ml4w.welcome.json"
# _build_app "dotfiles-settings/com.ml4w.settings.json"
# _build_app "dotfiles-sidebar/com.ml4w.sidebar.json"
# _build_app "dotfiles-calendar/com.ml4w.calendar.json"
# _build_app "hyprland-settings/com.ml4w.hyprlandsettings.json"
# _build_app "dotfiles-installer/com.ml4w.dotfilesinstaller.json"

# git add .
# git commit -m "Updated Flatpaks and repo metadata"
# git push origin main
