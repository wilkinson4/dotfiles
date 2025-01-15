if status is-login
     # Initialize Homebrew
    eval (/opt/homebrew/bin/brew shellenv)

    # Initialize asdf
    source (brew --prefix asdf)/libexec/asdf.fish
end

# Attach to suspended tmux session or start one if none exists
if test $TERM_PROGRAM != vscode
    if status is-interactive
        and not set -q TMUX
        exec tmux
    end
end

alias pcat 'pygmentize -f terminal256 -O style native -g'
alias gohome 'cd ~/workspace'
alias gs 'git status'
alias gaa 'git add --all'
alias gb 'git checkout -b '
alias gcm 'git commit -m'
alias glo 'git pull origin '
alias glom 'git checkout master && git pull origin master'
alias gpo 'git push origin'
alias gpom 'git push origin master'
alias cb 'symbolic-ref --short HEAD'
alias pn '!git push --set-upstream origin $(git cb)'
alias startdb 'pg_ctl -D /opt/homebrew/var/postgres start'


#autojump
source (brew --prefix)/share/autojump/autojump.fish

# Disable greeting
set -g fish_greeting

set EDITOR nvim

fish_add_path /usr/local/mysql/bin

# set PKG_CONFIG_PATH "$(brew --prefix icu4c)/lib/pkgconfig"
set AWS_VAULT_BACKEND file

fish_add_path $HOME/.rvm/bin

set CARGO_NET_GIT_FETCH_WITH_CLI true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/anaconda3/bin $PATH
    end
end
# <<< conda initialize <<<


# pnpm
set -gx PNPM_HOME /Users/williamwilkinson/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#

set ERL_AFLAGS "-kernel shell_history enabled"
set KERL_BUILD_DOCS yes

starship init fish | source
