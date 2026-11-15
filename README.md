# Dotfiles

Personal Linux configuration files for [dehumanized-i/dotfiles](https://github.com/dehumanized-i/dotfiles/), structured for symlink management with GNU Stow on Fedora Linux.

## Overview

This [dotfiles repository](https://github.com/dehumanized-i/dotfiles/) contains terminal, shell, multiplexer, text editor, and system monitoring configurations designed around a minimal, keyboard-centric workflow and the [Miasma](https://github.com/xero/miasma.nvim) color palette.

| Package | Configuration File | Target Path | Purpose |
| :--- | :--- | :--- | :--- |
| [alacritty](https://github.com/dehumanized-i/dotfiles/tree/main/alacritty/.config/alacritty) | [alacritty.toml](https://github.com/dehumanized-i/dotfiles/blob/main/alacritty/.config/alacritty/alacritty.toml) | `~/.config/alacritty/alacritty.toml` | GPU-accelerated terminal emulator with borderless window, `0.97` opacity, `JetBrainsMono Nerd Font`, and [Miasma](https://github.com/xero/miasma.nvim) colors |
| [bash](https://github.com/dehumanized-i/dotfiles/tree/main/bash) | [.bashrc](https://github.com/dehumanized-i/dotfiles/blob/main/bash/.bashrc) | `~/.bashrc` | Interactive shell setup with automatic `tmux` session attachment, timestamped history, and DNF5/navigation aliases |
| [btop](https://github.com/dehumanized-i/dotfiles/tree/main/btop/.config/btop) | [btop.conf](https://github.com/dehumanized-i/dotfiles/blob/main/btop/.config/btop/btop.conf) | `~/.config/btop/btop.conf` | Resource monitor using the `TTY` theme, transparent background, rounded corners, and braille graphs |
| [fastfetch](https://github.com/dehumanized-i/dotfiles/tree/main/fastfetch/.config/fastfetch) | [config.jsonc](https://github.com/dehumanized-i/dotfiles/blob/main/fastfetch/.config/fastfetch/config.jsonc) | `~/.config/fastfetch/config.jsonc` | System information fetcher grouped into color-coded OS, environment, and hardware modules |
| [nano](https://github.com/dehumanized-i/dotfiles/tree/main/nano) | [.nanorc](https://github.com/dehumanized-i/dotfiles/blob/main/nano/.nanorc) | `~/.nanorc` | Minimal monochrome (`white,black`) title, status, and key bar styling |
| [tmux](https://github.com/dehumanized-i/dotfiles/tree/main/tmux) | [.tmux.conf](https://github.com/dehumanized-i/dotfiles/blob/main/tmux/.tmux.conf) | `~/.tmux.conf` | Terminal multiplexer with 1-based indexing, `10ms` escape time, and a clean cyan status bar |
| [vim](https://github.com/dehumanized-i/dotfiles/tree/main/vim) | [.vimrc](https://github.com/dehumanized-i/dotfiles/blob/main/vim/.vimrc) | `~/.vimrc` | Vim configuration with relative line numbers, dynamic ANSI mode-aware statusline, and mode-specific cursor shapes |

## Repository Structure

Each top-level directory in [dehumanized-i/dotfiles](https://github.com/dehumanized-i/dotfiles/) mirrors the target layout relative to `$HOME` so packages can be stowed individually or all at once:

* [alacritty/.config/alacritty/alacritty.toml](https://github.com/dehumanized-i/dotfiles/blob/main/alacritty/.config/alacritty/alacritty.toml)
* [bash/.bashrc](https://github.com/dehumanized-i/dotfiles/blob/main/bash/.bashrc)
* [btop/.config/btop/btop.conf](https://github.com/dehumanized-i/dotfiles/blob/main/btop/.config/btop/btop.conf)
* [fastfetch/.config/fastfetch/config.jsonc](https://github.com/dehumanized-i/dotfiles/blob/main/fastfetch/.config/fastfetch/config.jsonc)
* [nano/.nanorc](https://github.com/dehumanized-i/dotfiles/blob/main/nano/.nanorc)
* [tmux/.tmux.conf](https://github.com/dehumanized-i/dotfiles/blob/main/tmux/.tmux.conf)
* [vim/.vimrc](https://github.com/dehumanized-i/dotfiles/blob/main/vim/.vimrc)

## Configuration Details

### Alacritty ([alacritty.toml](https://github.com/dehumanized-i/dotfiles/blob/main/alacritty/.config/alacritty/alacritty.toml))

* **Window Appearance**: Borderless window (`decorations = "None"`), `0.97` background opacity, and `10px` horizontal/vertical padding.
* **Typography**: `JetBrainsMono Nerd Font` at size `12.0` across `Regular`, `Bold`, `Italic`, and `Bold Italic` styles.
* **Color Palette**: Earthy, warm dark palette adapted from [xero/miasma.nvim](https://github.com/xero/miasma.nvim) (`#222222` background base, `#c2c2b0` foreground).

### Bash ([.bashrc](https://github.com/dehumanized-i/dotfiles/blob/main/bash/.bashrc))

* **Auto-Tmux Session**: Automatically attaches to or creates a `main` session (`tmux new-session -A -s main`) when starting an interactive shell outside `tmux`.
* **History Formatting**: Formats `history` output with timestamps via `HISTTIMEFORMAT="%Y-%m-%d %T "`.
* **System & Package Aliases**:
  * `u` — `sudo dnf upgrade --refresh -y`
  * `repofiles` — `ls -lah /etc/dnf/repos.override.d/ /etc/yum.repos.d/ /usr/share/dnf5/repos.d/`
  * `lsa` — `ls -lah`
  * `p` / `r` — `poweroff` / `reboot`
* **Navigation & Network Shortcuts**: Includes quick `cd` aliases for `/mnt/NuPartition` directories (`partition`, `downloads`, `myvault`, `ccna`, `vpn`) alongside `aether` and `whatsip` (queries Cloudflare trace over a local SOCKS5 proxy at `127.0.0.1:18080`).

### Vim ([.vimrc](https://github.com/dehumanized-i/dotfiles/blob/main/vim/.vimrc))

* **Editor Defaults**: Hybrid line numbers (`number` and `relativenumber`), 4-space soft tabs (`tabstop=4`, `shiftwidth=4`, `expandtab`), `cursorline`, syntax highlighting, and a `50ms` keycode timeout (`ttimeoutlen=50`).
* **Mode-Specific Cursor Shapes**: Switches cursor shape via DECSCUSR escape sequences (with `tmux` passthrough support)—block (`\e[2 q`) in Normal mode, vertical bar (`\e[6 q`) in Insert mode, and underline (`\e[4 q`) in Replace mode.
* **Dynamic Statusline**: Custom `s:ModeColor` function updates status bar colors on `VimEnter`, `ColorScheme`, and `ModeChanged` events (`NORMAL` in blue, `INSERT` and `TERMINAL` in green, `VISUAL`/`SELECT` modes in magenta, `REPLACE` in red, `COMMAND` in yellow) and displays the current mode, file path, modified/readonly flags, filetype, line/column, and file percentage.

### Tmux ([.tmux.conf](https://github.com/dehumanized-i/dotfiles/blob/main/tmux/.tmux.conf)) & Nano ([.nanorc](https://github.com/dehumanized-i/dotfiles/blob/main/nano/.nanorc))

* **Tmux**: Starts window numbering at `1` (`base-index 1`), lowers `escape-time` to `10ms` for responsive modal switching in Vim, clears the right status area, and styles the status bar with `fg=cyan,bg=default`.
* **Nano**: Sets `titlecolor`, `statuscolor`, and `keycolor` to `white,black`.

### Fastfetch ([config.jsonc](https://github.com/dehumanized-i/dotfiles/blob/main/fastfetch/.config/fastfetch/config.jsonc)) & btop ([btop.conf](https://github.com/dehumanized-i/dotfiles/blob/main/btop/.config/btop/btop.conf))

* **Fastfetch**: Displays system details in three color-coded groups using `-->` labels:
  * **Yellow (System/OS)**: OS, kernel, root filesystem creation age in days (`stat -c %W /`), uptime, package count, shell, and locale.
  * **Blue (Desktop/Terminal)**: Window manager, desktop environment, login manager, theme, icons, cursor, terminal, and terminal font.
  * **Green (Hardware/Network)**: Host, CPU, GPU, display, memory, disk, swap, battery, and local IP.
* **btop**: Uses the `TTY` color theme (`truecolor = false`, `theme_background = false`) so the monitor inherits the terminal's [Miasma](https://github.com/xero/miasma.nvim) palette and transparency, paired with `braille` graphs and rounded corners.

## Prerequisites

Install the configured tools and GNU Stow on Fedora:

```bash
sudo dnf install stow alacritty bash tmux vim nano btop fastfetch curl
```

Ensure `JetBrainsMono Nerd Font` is installed in `~/.local/share/fonts` or `/usr/share/fonts` for [alacritty.toml](https://github.com/dehumanized-i/dotfiles/blob/main/alacritty/.config/alacritty/alacritty.toml).

## Installation

1. Clone [dehumanized-i/dotfiles](https://github.com/dehumanized-i/dotfiles/) into your home directory:

```bash
git clone https://github.com/dehumanized-i/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Back up any existing conflicting dotfiles (such as `~/.bashrc` or `~/.vimrc`), then symlink the desired packages using `stow`:

```bash
# Stow all packages
stow alacritty bash btop fastfetch nano tmux vim

# Or stow individual packages
stow vim tmux alacritty
```

3. Review and adjust machine-specific aliases in [bash/.bashrc](https://github.com/dehumanized-i/dotfiles/blob/main/bash/.bashrc) (such as `/mnt/NuPartition` directory paths and the local SOCKS5 proxy port in `whatsip`) to match your local setup.
