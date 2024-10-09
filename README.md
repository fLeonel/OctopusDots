
# 🐙 OctopusDots - Neovim Configuration

Welcome to the **OctopusDots** repository, a custom **Neovim** configuration designed to maximize productivity and style. This setup aims to create a powerful and developer-friendly Neovim environment for coders of all levels. 😎

## 🚀 **Key Features**

- **Easy installation** with **LazyVim**: This configuration uses the popular **LazyVim** for Neovim plugin management, making plugin installation and management efficient.
- **Popular plugins** for development in multiple programming languages like Dart, Flutter, Python, and more.
- **Modern, minimalistic theme** that enhances the visual experience during long coding sessions.
- **Performance optimization**: With LazyVim, plugins are loaded efficiently to keep Neovim fast and responsive.

## 📂 **Directory Structure**

The repository is organized as follows:

```bash
OctopusDots/
├── init.lua          # Main configuration file for Neovim
├── lazy.lua          # LazyVim configuration (plugin management)
└── lua/
    ├── plugins/      # Directory for specific plugin configurations
    ├── settings/     # General settings such as key mappings, themes, etc.
    ├── lsp/          # Language Server Protocol (LSP) configurations
    └── mappings.lua  # Custom key mappings
```

## 🛠️ **Prerequisites**

Before using this configuration, make sure you have the following programs installed:

1. **Neovim**: The latest version of Neovim.
2. **Git**: To clone the repository and manage plugins with LazyVim.
3. **Node.js**: Required for certain functionalities like LSP support for JavaScript and TypeScript.
4. **Python**: If you're working with Python, make sure Python and `pynvim` are installed.

```bash
pip install pynvim
```

## ⚙️ **Installation**

### 1. Clone the repository

Clone the repository into your Neovim configuration directory (`~/.config/nvim/`):

```bash
git clone https://github.com/fLeonel/OctopusDots.git ~/.config/nvim
```

### 2. Launch Neovim

Open Neovim, and LazyVim will automatically handle the plugin installations:

```bash
nvim
```

### 3. Enjoy your new setup

You can now start using Neovim with all the enhancements and plugins provided by this configuration.

## 🌟 **Highlighted Plugins**

Some key plugins included in this configuration:

- **Telescope**: Fast file and buffer searching, and more.
- **Treesitter**: Enhanced syntax highlighting for multiple languages.
- **LSP Config**: Support for various programming languages with autocompletion.
- **LuaLine**: Highly customizable status bar.

## 🤝 **Contributions**

Feel free to contribute to the project! Any suggestions or improvements are welcome. You can open a **Pull Request** or an **Issue** for any changes you think might be useful.

## 📄 **License**

This project is licensed under the [MIT License](LICENSE).
