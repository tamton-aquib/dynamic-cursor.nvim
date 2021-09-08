
## dynamic-cursor.nvim
A neovim plugin in lua that gives the cursor dynamic highlight.

Some terminals like alacritty has this by default. But some others like kitty does not support it.
This plugin gets the treesitter highlight and sets it to cursor.

Alacritty:

![alacritty](https://i.imgur.com/JtSV9ZD.png)

Kitty:

![kitty](https://i.imgur.com/pR2t7EY.png)

### Installation
* Vim-plug:
    ```vim
    Plug 'tamton-aquib/dynamic-cursor.nvim'
    ```
* Packer
    ```lua
    use 'tamton-aquib/dynamic-cursor.nvim'
    ```

### Configuration
```lua
require("dynamic-cursor").setup()
```


PS: The treesitter highlight function was mostly taken from [treesitter-playground](https://github.com/nvim-treesitter/playground).
