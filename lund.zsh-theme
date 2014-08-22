
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function ssh_connection() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%{$fg_bold[red]%}[%m] "
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)"
PROMPT='$(ssh_connection)%{$reset_colors%}%3~%{$fg_bold[black]%}$(git_prompt_info) % ${ret_status}%{$fg_bold[green]%}%{$reset_color%}'
