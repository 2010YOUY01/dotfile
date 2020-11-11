# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# It might be bash like, but I can't have my co-workers knowing I use zsh
# EMOJI='%{$FX[bold]$FG[254]%} 👴'
ARROW=' %{$FX[bold]$FG[009]%}>%{$FX[bold]$FG[214]%}>%{$FX[bold]$FG[070]%}> '
BAR='%{$FX[bold]$FG[000]%}|'
PROMPT='%{$FX[bold]$FG[124]%}%2~$(git_prompt_info)'${ARROW}'%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FX[bold]$FG[033]%}|"
ZSH_THEME_GIT_PROMPT_SUFFIX="|%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN='🌝'
ZSH_THEME_GIT_PROMPT_DIRTY='🌚'
