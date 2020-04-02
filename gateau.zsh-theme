# name in folder (github)
# ± if in github repo, or ≥ if otherwise Time in 24-hour format is on right.
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
function prompt_char {
    echo -n "%{$fg[magenta]%}"
    git branch >/dev/null 2>/dev/null && echo "$>%{$reset_color%}" && return
    echo "$>%{$reset_color%}"
}
RIXIUS_PRE="%{$fg_bold[magenta]%}"

PROMPT='%{$RIXIUS_PRE%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
$(prompt_char) '
RPROMPT='%{$RIXIUS_PRE%}%T%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red]∙%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[green]∙%{$reset_color%}"
