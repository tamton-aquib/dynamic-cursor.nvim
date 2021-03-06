
## dynamic-cursor.nvim
A neovim plugin in lua that gives the cursor dynamic highlight.

Some terminals like alacritty has this by default. But some others like kitty does not support it.
This plugin gets the treesitter highlight and sets it to cursor.

> ❗ Kitty has introduced this recently: [afe728](https://github.com/kovidgoyal/kitty/commit/0fdafd83986d46ea5eecdd6174617bd71eafe728) so this plugin is obsolete now.

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

<details open>
<summary> the default config looks something like: </summary>

```lua
require("dynamic-cursor").setup { 
	guicursor = "n-v-c:block-DynamicCursor,i:ver100-DynamicCursor" 
}
```
</details>

---
* This plugin exposes a highlight: `DynamicCursor` which can be used elsewhere.
* The treesitter highlight function was mostly taken from [treesitter-playground](https://github.com/nvim-treesitter/playground).
