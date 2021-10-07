# Development Environment Setup (Windows + WSL)

Here are the steps I follow to set up a new Windows + WSL machine.  
Updated for **Windows 11** and **Ubuntu 20.04**.

## Linux config

Open the Powershell as admin and run (restart needed):

```
wsl --install
```

For more details see [Install Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10).


### Config files and scripts

- Clone this repo:

  ```
  git clone git@github.com:rbika/dotfiles-windows-wsl.git ~/.dotfiles
  ```

- Change directory

  ```
  cd ~/.dotfiles
  ```

- Download git-prompt script:

  ```
  curl -fsSo ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  ```

- Create symlinks:

  ```
  ln -s $(pwd)/.zshrc ~/.zshrc
  ln -s $(pwd)/.gitconfig ~/.gitconfig
  ln -s $(pwd)/.vimrc ~/.vimrc
  ln -s $(pwd)/.vim ~/.vim
  ```

- Copy main.ahk to Windows' startup folder:

  ```
  cp main.ahk $(wslpath "$(wslvar USERPROFILE)")/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/
  ```

### Zsh

Install zsh and set it as the default shell:

```
sudo apt install -y zsh
```

```
chsh -s /usr/bin/zsh
```

### Tools

- [antigen](https://github.com/zsh-users/antigen) - Zsh plugin manager
- [nvm](https://github.com/creationix/nvm#installation-and-update) - Node Version Manager

## Windows config

### Invert mouse scroll

Open the Powershell as admin and run (restart needed):

```
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }
```

### Disable keyboard language shortcut

TODO

### Winget

Install winget package manager from the Microsoft Store.

### Install Apps

```
winget import -i path/to/winget.json
```

### In Progress

- Microsoft Todo
- Power Toys
- Lightshot
