if status is-login
    if test -d /home/linuxbrew/.linuxbrew
        # Homebrew is installed on Linux

        set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
        set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
        set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
        set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
        set -q MANPATH; or set MANPATH ''
        set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
        set -q INFOPATH; or set INFOPATH ''
        set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

        # Homebrew asked for this in order to `brew upgrade`
        set -gx HOMEBREW_GITHUB_API_TOKEN {api token goes here, don't remember where that's created}
    else if test -d /opt/homebrew
        # Homebrew is installed on MacOS

        /opt/homebrew/bin/brew shellenv | source
    end

    # Initialize asdf
    source (brew --prefix asdf)/libexec/asdf.fish
end

# Attach to suspended tmux session or start one if none exists
if test $TERM_PROGRAM != vscode
    if status is-interactive && not set -q TMUX
        set -g TMUX tmux new-session -d -s base
        eval $TMUX
        tmux attach-session -d -t base
    end
end

function pcat
    pygmentize -f terminal256 -O style native -g
end
function gohome
    cd ~/workspace
end
function gs
    git status
end
function gaa
    git add --all
end
function gb
    git checkout -b $argv[1]
end
function gcm
    git commit -m $argv[1]
end
function glo
    git pull origin
end
function glom
    git checkout master && git pull origin master
end
function gpo
    git push origin $argv[1]
end
function gpom
    git push origin master
end
function cb
    symbolic-ref --short HEAD
end

function pn
    !git push --set-upstream origin $(git cb)
end

function startdb
    pg_ctl -D /opt/homebrew/var/postgres start
end

#autojump
source (brew --prefix)/share/autojump/autojump.fish

# Disable greeting
set -g fish_greeting

set -gx EDITOR nvim

fish_add_path /usr/local/mysql/bin

# set PKG_CONFIG_PATH "$(brew --prefix icu4c)/lib/pkgconfig"
set -gx AWS_VAULT_BACKEND file

set -gx CARGO_NET_GIT_FETCH_WITH_CLI true
set -gx PGAPPNAME wwilkinson_cli

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f /opt/anaconda3/bin/conda
#    eval /opt/anaconda3/bin/conda "shell.fish" hook $argv | source
#else
#    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
#        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
#    else
#        set -x PATH /opt/anaconda3/bin $PATH
#    end
#end
# <<< conda initialize <<<

# pnpm
set -gx PNPM_HOME /Users/williamwilkinson/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#

set -gx CHROME_PATH /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

set -gx ERL_AFLAGS -kernel shell_history enabled
set -gx KERL_BUILD_DOCS yes

# Added by `rbenv init` on Thu Jan 16 17:30:45 CST 2025
status --is-interactive; and rbenv init - --no-rehash fish | source

starship init fish | source
