# My Neovim Config

My Neovim configurations. Used [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) as a base starting point, [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

## Installation

1. Install [Neovim](https://neovim.io) (nightly recommended) and a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) (Optional but still recommended).

2. Clone the config:

    ```sh
    if [ -d $HOME/.config/nvim ]; then
        mv $HOME/.config/nvim $HOME/.config/nvim.original
    fi

    git clone https://github.com/complex-syndrome/nvim-config $HOME/.config/nvim
    ```

3. Start neovim:

    ```sh
    nvim
    ```

## Some keybinds to start with

- Current leader key is "\<Space\>"
- "\<leader\>sk" to search for all current keybinds
- "<Ctrl-\/>" to open a terminal
- "\\" to open file explorer, "?" to check its keybinds
- "Shift + (< | >)" to indent | unindent {VISUAL MODE}
- Try clicking "g" and "\<leader\>" in different file types (txt, py, etc.)
- :q to quit (VERY IMPORTANT)
