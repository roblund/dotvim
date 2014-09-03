ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function my_current_branch() {
    local branch=$(current_branch)
    if [[ -n $branch ]]; then
        echo " %{$fg_bold[blue]%}($branch)%{$reset_color%}"
    fi
}

function ssh_connection() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%{$fg_bold[white]%}[%{$fg_bold[cyan]%}%m%{$fg_bold[white]%}]%{$reset_color%} "
    fi
}

function return_status() {
    echo " %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)%{$reset_color%}"
}

PROMPT='$(ssh_connection)%3~$(my_current_branch)$(return_status)'
