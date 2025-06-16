# How to Install Apps from the ML4W Flatpak Repo

The ML4W Flatpak Repo provides all flatpak apps developed by ML4W.

Copy the following command into your terminal to add the ML4W Flatpak Repo automatically:

```
bash -c "$(curl -s https://raw.githubusercontent.com/mylinuxforwork/ml4w-flatpak-repo/main/setup.sh)"

```

## Manual adding the repo (OPTIONAL)

### Step 1: Download the Repository's Public Key

```
curl -sL -O https://mylinuxforwork.github.io/ml4w-flatpak-repo/ml4w-apps-public-key.asc 
```
This command downloads the key file (ml4w-apps-public-key.asc) to your current directory.

### Step 2: Add the ML4W Flatpak Repository

Now, add the repository to your Flatpak setup, using the key you just downloaded for verification.

In the same terminal, run:

```
flatpak remote-add --user ml4w-repo https://mylinuxforwork.github.io/ml4w-flatpak-repo/ml4w-apps.flatpakrepo --gpg-import=./ml4w-apps-public-key.asc
```
- user: Installs the repository for your user only (recommended).
- ml4w-repo: This is the name given to our repository on your system.

### Step 3: Install Your Desired Application

Once the repository is added, you can install any application available in it. Let's install Hyprland Settings as an example.

```
flatpak install --user ml4w-repo com.ml4w.hyprlandsettings
```
Replace com.ml4w.hyprlandsettings with the specific App ID of any other ML4W app you wish to install (e.g., com.ml4w.welcome or com.ml4w.dotfilesinstaller).

### Step 4: Run the Application

After installation, you can typically find the application in your desktop environment's application launcher or menu.

You can also run it directly from the terminal:

```
flatpak run com.ml4w.hyprlandsettings
```

### Optional: Clean Up

You can delete the downloaded public key file if you wish, as it has already been imported by Flatpak:

```
rm ml4w-apps-public-key.asc
```

flatpak remotes --user
