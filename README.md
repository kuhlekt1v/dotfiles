# dotfiles

Personal configuration files for various development tools including fonts, themes, keybindings, terminal settings, and editor preferences.

## Details

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

<details>
<summary><strong>Wezterm</strong></summary>
<br>

1. Copy & paste [.wezterm.lua](https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/terminal/wezterm-config/.wezterm.lua) into `~/`
2. Copy & paste [wezterm/](https://github.com/kuhlekt1v/dotfiles/tree/main/terminal/wezterm-config/wezterm) directory into `~/.config`

</details>

<details>
<summary><strong>Nvim</strong></summary>
<br>

1. Copy your preferred Neovim configuration ([terminal/lazyvim](https://github.com/kuhlekt1v/dotfiles/tree/main/terminal/lazyvim) or [terminal/nvchad](https://github.com/kuhlekt1v/dotfiles/tree/main/terminal/nvchad)) to `~/.config/nvim`
2. (Optional) When using LazyVim, use the snippet below to create a file, `.luarc.json`, within your nvim config folder to improve Lua LSP support:

```json
{
  "workspace": {
    "library": ["/usr/share/nvim/runtime"],
    "checkThirdParty": false
  },
  "diagnostics": {
    "globals": ["vim"]
  },
  "telemetry": {
    "enable": false
  }
}
```

</details>


<details> 
<summary><strong>Zsh + Powerlevel10k</strong></summary> 
<br>

1. Copy & paste .zshrc into your home directory: `~/.zshrc`.
2. Install Powerlevel10k (if not already installed):
   <br>`brew install romkatv/powerlevel10k/powerlevel10k`
3. Copy & paste .p10k.zsh into your home directory: `~/.p10k.zsh`.
