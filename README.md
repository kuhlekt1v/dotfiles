# dotfiles

Personal configuration files for various development tools including themes, keybindings, terminal settings, and editor preferences.

## Setup Instructions

<details>
<summary><strong>Wezterm</strong></summary>
<br>
  
1. Copy & paste [.wezterm.lua](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/terminal/wezterm-config/.wezterm.lua) into `~/`
2. Copy & paste [wezterm/](https://github.com/kuhlekt1v/dotfiles/tree/main/terminal/wezterm-config/wezterm) directory into `~/.config`
  
</details>

<details>

<summary><strong>Nerd Font</strong></summary>

- Install a Nerd Font (e.g., MesloLGS NF) from https://www.nerdfonts.com/
- Current: {family = "Lilex Nerd Font Mono", weight = "Regular" }
  ```

</details>
<details>
<summary><strong>Nvim</strong></summary>
<br>
  
1. Copy [Neovim](https://github.com/kuhlekt1v/dotfiles/tree/main/terminal/nvim) config to `~/.config/nvim`
2. Install CSharpier for C# formatting:
   `dotnet tool install -g csharpier`
  
</details>

<details> 
<summary><strong>Zsh + Powerlevel10k</strong></summary> 
<br>

1. Copy & paste [.zshrc](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/terminal/.zshrc) into your home directory: `~/.zshrc`.
2. Install Powerlevel10k (if not already installed):
   - Brew:
     `brew install romkatv/powerlevel10k/powerlevel10k`
   - Manual:
     ```sh
     git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
     echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
     ```
3. Copy & paste [.p10k.zsh](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/terminal/.p10k.zsh) into your home directory: `~/.p10k.zsh`.

</details>



<details>
<summary><strong>VS Code</strong></summary>
<br>
1. Execute the following command:

```console
curl -s https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/install-extensions.sh?token=GHSAT0AAAAAACJGL2DEVDOLP5JLQNB5QV4YZOHKXDA | /bin/bash
```

2. Copy & paste [keybindings](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/keybindings.json) into VS Code `keybindings.json`

3. Copy & paste [settings](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/settings.json) into VS Code `settings.json`

</details>
