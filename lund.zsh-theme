ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ◦%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function ssh_connection() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%{$fg_bold[white]%}[%{$fg_bold[cyan]%}%m%{$fg_bold[white]%}]%{$reset_color%} "
    fi
}

function return_status() {
    echo " %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)%{$reset_color%}"
}

local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="$(ssh_connection)%5~${git_branch}$(return_status)"
