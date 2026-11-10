# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && [[ $- == *i* ]]; then
  tmux new-session -A -s main
fi

alias aether='/mnt/NuPartition/Downloads/VPN/Aether/aether'
alias downloads='cd /mnt/NuPartition/Downloads/'
alias myvault='cd /mnt/NuPartition/MyVault/"3 - Full Notes"'
alias ccna='cd /mnt/NuPartition/CCNA'
alias vpn='cd /mnt/NuPartition/Downloads/VPN'
alias partition='cd /mnt/NuPartition/'
alias whatsip='curl -x socks5h://127.0.0.1:1819 https://www.cloudflare.com/cdn-cgi/trace'
alias lsa='ls -lah'
alias repofiles='ls -lah /etc/dnf/repos.override.d/ /etc/yum.repos.d/ /usr/share/dnf5/repos.d/'
