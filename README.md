# Development Environment Setup (Windows + WSL)

Here are the steps I follow to set up a new Windows + WSL machine (Windows 10 + Ubuntu 20.04 updated).

## Windows Config

### Disable Office shortcut

Open the Powershell and run:

```
REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32
```

### Invert mouse scroll

Open the Powershell as admin, run the command below and restart:

```
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }
```

### Apps

- Google Chrome
- VSCode
- (SKIP) Fork
- Spotify
- Telegram
- WhatsApp
- Notion
- Microsoft Todo
- Power Toys
- Quick Look
- AutoHotKey
- Windows Terminal

### WSL

[Install Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

## Linux Config

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
  ```

- Copy main.ahk to Windows' startup folder:

  ```
  cp main.ahk /mnt/c/Users/<USERNAME>/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/
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
- (SKIP) [wslgit](https://github.com/andy-5/wslgit) - Git integration with WSL
