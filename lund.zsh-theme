local ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)"
PROMPT='%{$reset_colors%}%3~%{$fg_bold[black]%}$(git_prompt_info) % ${ret_status}%{$fg_bold[green]%}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[black]%})"
