# ml4w-flatpak-repo


curl -sL -O https://mylinuxforwork.github.io/ml4w-flatpak-repo/ml4w-apps-public-key.asc 

flatpak remote-add --user ml4w-repo https://mylinuxforwork.github.io/ml4w-flatpak-repo/ml4w-apps.flatpakrepo --gpg-import=./ml4w-apps-public-key.asc