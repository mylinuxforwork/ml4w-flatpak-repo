gpg="5544907F31DF39950A1A576F48F295379AF3AC1E"

repo_dir="./ml4w-flatpak-repo/repo"
tmp_build_dir="flatpak-builder_tmp"

_build_app() {
    app_manifest=$1
    arch=$2
    echo "Building $app_manifest for $arch..."

    # Use the BWRAP environment variable for aarch64 builds
    if [ "$arch" = "aarch64" ]; then
        export BWRAP="bwrap --ro-bind /proc/sys/fs/binfmt_misc /proc/sys/fs/binfmt_misc"
    else
    # Unset the variable for x86_64 builds
        unset BWRAP
    fi

    flatpak-builder --arch="$arch" --force-clean --repo="$repo_dir" --gpg-sign="$gpg" "$tmp_build_dir" "/home/raabe/Projects/$app_manifest"

    if [ $? -ne 0 ]; then
        echo "Error building $app_manifest for $arch. Aborting."
        # Clean up the environment variable on exit
        unset BWRAP
        exit 1
    fi
    
    # Unset the variable after a successful build
    unset BWRAP
}

project_path="/home/raabe/Projects/"
# architectures=("x86_64" "aarch64")
architectures=("x86_64")
for arch in "${architectures[@]}"; do
    # _build_app "dotfiles-welcome/com.ml4w.welcome.json" "$arch"
    _build_app "dotfiles-settings/com.ml4w.settings.json" "$arch"
    # _build_app "dotfiles-sidebar/com.ml4w.sidebar.json" "$arch"
    # _build_app "dotfiles-calendar/com.ml4w.calendar.json" "$arch"
    # _build_app "hyprland-settings/com.ml4w.hyprlandsettings.json" "$arch"
done
echo "All builds completed successfully."
