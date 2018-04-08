# Plugins
source $HOME/.config/zsh/zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zstyle ':prezto:module:*' color 'yes'
zstyle ':prezto:module:*' case-sensitive 'no'
zstyle ':prezto:module:prompt' theme sorin
zstyle ':prezto:module:editor' key-bindings 'vi'

zplug "modules/bundler", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/node", from:prezto

zplug "modules/prompt", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto, defer:1

zplug "modules/syntax-highlighting", from:prezto, defer:2
zplug "modules/history-substring-search", from:prezto, defer:3

zplug "b4b4r07/enhancd", use:init.sh
zplug "supercrabtree/k"
zplug "knu/zsh-manydots-magic"

if ! zplug check; then
    zplug install
fi

zplug load

export ENHANCD_DISABLE_DOT=1
# alias and other things

[ -x "$(command -v fasd)" ] && eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias v='f -e nvim'
alias vim="nvim"
alias python="python3"
alias pip="pip3"

SEARCH_LIMIT=3
alias wiki="googler -n $SEARCH_LIMIT -w wikipedia.org"
alias amazon="googler -n $SEARCH_LIMIT -w amazon.co.uk"
alias github="googler -n $SEARCH_LIMIT -w github.com"
[ -x "$(command -v xdg-open)" ] && alias open="xdg-open"

export LANG=en_US.UTF-8
export GOPATH=$HOME/.local/
export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='chromium-browser'
export PAGER='less'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/npm/bin
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
