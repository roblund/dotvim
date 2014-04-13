local ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)"
PROMPT='%{$fg_bold[blue]%}%p%{$fg[cyan]%}%3~%{$fg_bold[blue]%}$(git_prompt_info) % ${ret_status}%{$fg_bold[green]%}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
