# My Neovim Config

My Neovim configurations. Used [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) as a base starting point, [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

## Installation

1. Installation:
   - [Neovim](https://neovim.io) (nightly recommended)
   - Set a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) as your display font (Optional but still recommended).
   - Install other dependencies:

       ```sh
       # Ubuntu
       sudo add-apt-repository ppa:neovim-ppa/unstable -y
       sudo apt update
       sudo apt install make git unzip ripgrep fd-find gcc neovim xclip lua5.1 liblua5.1-0-dev

       # Arch
       sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
       ```

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

- `:checkhealth` in nvim to check possible plugin issues
- Current leader key is `<Space>`
- `\<leader\>sk` to search for all current keybinds
- `<Ctrl-\/>` to open a terminal
- `\\` to open file explorer, `?` to check its keybinds
- `Shift + (< | >)` to indent | unindent {VISUAL MODE}
- `"+y` to copy to clipboard {VISUAL MODE}
- `gc[c]` to toggle comments {VISUAL MODE}
- Try clicking `g` and `<leader>` in different file types (txt, py, etc.)
- `:q` to quit (VERY IMPORTANT)
