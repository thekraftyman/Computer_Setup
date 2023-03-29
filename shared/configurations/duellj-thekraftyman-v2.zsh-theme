# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
#PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}%B]%b - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%1d%{\e[0;34m%}%B]%b%{\e[0m%}
#%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
#PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

PROMPT="%B┌─[%b%{$fg[yellow]%}%n%{$reset_color%}%B]%b - %B[%b%{$fg[blue]%}%1~%{$reset_color%}%B]%b"
PROMPT+='$(git_prompt_info)'
PROMPT+='
%B└─[%b%{$fg[cyan]%}\$%{$reset_color%}%B]%b '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}➜ %{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
