# 🐙 OctopusDots

Mis dotfiles para **Linux (Kali)** y **macOS**, manejados con [chezmoi](https://chezmoi.io).
Neovim (LazyVim) como editor principal, apps TUI "lazy", Flutter y Odoo 19.

## 🚀 Instalar en una máquina nueva

```bash
# macOS: herramientas de línea de comandos (git, curl)
xcode-select --install

# chezmoi + aplicar todo
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply fLeonel/OctopusDots
```

Te pregunta **nombre y email para git** (se guardan solo en `~/.config/chezmoi/chezmoi.toml`, no en el repo) y luego:

1. Instala Homebrew (si falta) y todo el [`Brewfile`](Brewfile).
2. Copia las configs (nvim, zsh, tmux, zellij, lazygit, git + delta, alacritty, atuin, btop…).
3. Instala oh-my-zsh y TPM.
4. Clona Flutter stable en `~/development/flutter`.
5. Instala **OdooLS** (binario + typeshed) en `~/.local/share/odoo-ls`.
6. Clona Odoo 19 community + enterprise en `~/Documents/DevRoot/Odoo/Core/19.0/`.

> Enterprise necesita tu llave SSH en GitHub con acceso a `odoo/enterprise`.
> Si falla: `gh auth login` (protocolo SSH) y vuelve a correr `chezmoi apply`.

Después: abre `nvim` (lazy.nvim instala los plugins solo) y en tmux `prefix + I`.

## 🔁 Día a día

| Quiero… | Comando |
|---|---|
| Traer cambios del repo y aplicarlos | `chezmoi update` |
| Editar una config | `chezmoi edit ~/.zshrc` (o edítala normal y luego `chezmoi re-add`) |
| Ver qué cambiaría | `chezmoi diff` |
| Agregar un archivo nuevo | `chezmoi add ~/.config/algo` |
| Subir cambios | `chezmoi cd` → `git add -A && git commit && git push` |

## ⌨️ Atajos principales en Neovim

| Atajo | Qué hace |
|---|---|
| `<leader>gg` | lazygit (con delta) |
| `<leader>y` / `<leader>Y` | yazi en archivo actual / cwd |
| `<leader>-` | oil |
| `<leader>td` `ts` `tj` `th` `tp` `tb` | lazydocker, lazysql, lazyjournal, lazyssh, posting, btop |
| `<leader>F…` | Flutter (run, devices, reload, restart, logs…) |

## 🧩 Odoo

`~/Documents/DevRoot/Odoo/` contiene `odools.toml` y `pyrightconfig.json`.
Clona los repos de Odoo.sh de cada empresa en `DevRoot/Odoo/<Empresa>/` y OdooLS los detecta solo.

Actualizar versiones: cambia `odooVersion` / `odooLsVersion` en `.chezmoi.toml.tmpl`, corre `chezmoi init` y `chezmoi apply`.
