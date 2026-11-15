# dotfiles

Personal Fedora configs for a minimal, keyboard-centric terminal workflow, themed with [Miasma](https://github.com/xero/miasma.nvim) and managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

Each top-level folder is a Stow package that mirrors the layout of `$HOME`.

| Package | Target | What it configures |
| :--- | :--- | :--- |
| `alacritty` | `~/.config/alacritty/alacritty.toml` | Borderless window, `0.97` opacity, 10px padding, JetBrainsMono Nerd Font 12, Miasma colors |
| `bash` | `~/.bashrc` | Auto-attaches to a tmux `main` session, timestamped history, DNF and navigation aliases |
| `btop` | `~/.config/btop/btop.conf` | `TTY` theme (inherits terminal colors), transparent background, rounded corners, braille graphs |
| `fastfetch` | `~/.config/fastfetch/config.jsonc` | System info in three color-coded groups: OS, desktop/terminal, hardware/network |
| `nano` | `~/.nanorc` | Monochrome `white,black` title, status, and key bars |
| `tmux` | `~/.tmux.conf` | 1-based window numbering, 10ms escape time, cyan status bar |
| `vim` | `~/.vimrc` | Hybrid line numbers, 4-space tabs, mode-colored statusline, mode-specific cursor shapes (tmux-aware) |

## Notable details

- **bash:** key aliases are `u` (`sudo dnf upgrade --refresh -y`), `lsa` (`ls -lah`), `repofiles` (list DNF repo dirs), and `p`/`r` (poweroff/reboot). `whatsip` queries Cloudflare's trace endpoint through a local SOCKS5 proxy at `127.0.0.1:18080`.
- **vim:** the cursor is a block in Normal mode, a bar in Insert mode, and an underline in Replace mode.
- **tmux:** the low `escape-time` makes mode switching in Vim feel instant.

## Setup

1. Install the tools and Stow, plus the [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) (in `~/.local/share/fonts` or `/usr/share/fonts`):

   ```bash
   sudo dnf install git stow alacritty tmux vim nano btop fastfetch curl
   ```

2. Clone the repo:

   ```bash
   git clone https://github.com/dehumanized-i/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

3. Back up any existing configs (e.g. `~/.bashrc`, `~/.vimrc`). Stow refuses to overwrite real files.

4. Symlink everything, or only the packages you want:

   ```bash
   stow alacritty bash btop fastfetch nano tmux vim   # all
   stow vim tmux                                      # a subset
   ```

5. Adjust the machine-specific values in `bash/.bashrc`: the `/mnt/NuPartition` directory aliases and the SOCKS5 port in `whatsip`.

To remove a package's symlinks, run `stow -D <package>`.
