local return_code="%(?..%{$fg[red]%}↵%{$reset_color%})"
local user_host="%{$reset_color%}%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$reset_color%}@%(!.%{$fg[red]%}.%{$fg[green]%})%m%{$reset_color%}"
local user_symbol='%(!.#.$)'
local current_dir=" in %{$reset_color%}%{$fg[blue]%}%~%{$reset_color%}"

local vcs_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

if [[ "${plugins[@]}" =~ 'kube-ps1' ]]; then
    local kube_prompt='$(kube_ps1)'
else
    local kube_prompt=''
fi

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"


PROMPT="╭─ ${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}${kube_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}\uE0A0%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[yellow]%}\uE0A0%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}\uE0A0%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" using %{$fg[green]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
