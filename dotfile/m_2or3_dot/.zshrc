#!/usr/bin/zsh
# -*- coding: utf-8 -*-
# .zshrc written for 4.3.4 since 20071122
#
# vim:enc=utf8:
#
# history:
#   20100217: lsoracceptがOS X(BSD系一般?)で効かない問題に対処 (thanks to K.T)
#   20090701: for文などの継続入力時のlsoracceptで落ちる問題を暫定解決
#   20090624: sudoや|を無視して補完候補を履歴から探すsmart-search-history
#   20090620: 微修正. ホストローカルな設定
#   20090613: 微修正, bashなどのPATH設定を流用する, コマンド実行中にタイトルに'(*)'挿入
#   20090612: バッファが空の状態でEnter入力でls, ^Oでcd -
#   20090609: cd後のlsでファイル数が多すぎる場合に省略
#   20090606: 統合
#   20090404: psg追加, cd, gd等修正
#   20071122

# ----------------------------------------
# add below to ~/.bash_profile (exec zsh on login)
#        or to ~/.bashrc       (exec zsh for all bash)
#
# if [ -x /usr/bin/zsh ]; then
#   echo 'exec zsh'
#   exec /usr/bin/zsh -l
# else
#   echo 'exec zsh failed.'
# fi
#

# ----------------------------------------
# prompt

# for Linux (procps 3.2.6)
function joblist { ps -l|awk '/^..T/&&NR!=1{print $14}'|sed ':a;$!N;$!b a;;s/\n/,/g' }
function jobnum { ps -l|awk '/^..T/&&NR!=1{print}'|wc -l}
function ipaddrs { /sbin/ifconfig | awk '/^ *inet addr:/{print $2}' | cut -d: -f2 | grep -v 127.0.0.1 | sed ':a;$!N;$!b a;;s/\n/, /g' }

local C_USERHOST="%{$bg[white]$fg[black]%}"
local C_PROMPT="%{$fg[white]%}"
local C_PRE="%{$reset_color%}%{$fg[white]%}"
local C_CMD="%{$reset_color%}%{$fg[white]%}"
local C_RIGHT="%{$bg[white]%}%{$fg[black]%}"
local C_DEFAULT="%{$reset_color%}"

PROMPT=$C_USERHOST"%S[%n@%m] %~ %s$C_PRE "$1"
"$C_PROMPT"%# "$C_CMD
# keep a few blank lines at the bottom
echo -n -e "\n\n\n\033[3A"

# vcs_infoロード
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
unsetopt promptcr

# vcsの表示
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats '[%s][%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%s][%F{green}%b%f(%F{red}%a%f)]'

function _vcs_precmd () {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="%S"$C_RIGHT" %D{%d %a} %* %s"$C_CMD
  RPROMPT="${vcs_info_msg_0_}"$RPROMPT
}
add-zsh-hook precmd _vcs_precmd

# exists?
function exists {
  if which "$1" 1>/dev/null 2>&1; then return 0; else return 1; fi
}

# ----------------------------------------
# import PATH from other shell's rc files
export PYENV_ROOT="${HOME}/.pyenv"

local paths=':'
local exports=':'
export CLKS=/root/www/node.js/www/
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin/php:/Applications/XAMPP/bin:/opt/td-agent/embedded/bin:/Users/2or3/Library/Python/3.6/bin:$HOME/.nodebrew/current/bin:$HOME/.composer/vendor/bin:${PYENV_ROOT}/bin
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules:/Users/2or3/Documents/membership-api-test/test/lib:/Users/2or3/Documents/membership-api-test/test/e2e/param/


eval $paths
eval $exports
export XAMPP=/Applications/XAMPP/
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# ----------------------------------------
# env
if exists lv; then
  export PAGER=lv
elif exists less; then
  export PAGER=less
fi

export EDITOR=vim

# C-wで単語の一部と見なす記号
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# ----------------------------------------
# terminal specific
export LANG=ja_JP.UTF-8
unset LC_ALL
export LC_MESSAGES=C
export SHELL=`which zsh`
export PATH="$HOME/bin:$PATH"

eval "$(pyenv init -)"

# ----------------------------------------
# aliases
alias ctags='/usr/local/bin/ctags'
setopt completealiases
alias ls='ls -GAFh'
alias l='ls -GFAlh'
export LSCOLORS='ExfxcxdxBxegedabagacad'
export LV='-Ou8 -c'
alias mv='mv -i'
alias quit='exit'
alias ':q'='exit'
alias w3m='w3m -O ja_JP.UTF-8'
# 'go'mi = trash (apt-get install trash-cli)
if exists trash; then
  alias go='trash'
#  list-trash
fi
# for function cd
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
# shortcuts
alias -g ...='../../'
alias -g ....='../../../'
alias -g .....='../../../../'
alias man='man'
alias jman="LC_MESSAGES=$LANG man"
alias -g F='| grep -i'
alias -g GG='| xargs -0 grep -i'
alias -g G=' 2>&1 | grep -i'
alias -g L=" 2>&1 | $PAGER"
alias -g V=" 2>&1 | vim -R -"
# clipboard (requires xsel which can be installed by "sudo aptitude install xsel")
if exists xsel; then
  alias -g   B=" | xsel -bi" # stdout => clip
  alias -g  B2=" 2>&1 | xsel -bi" # stdout + stderr => clip
  alias -g  BB=" | (cat 1>&2 | xsel -bi) 2>&1" # stdout => clip and stdout
  alias -g BB2=" 2>&1 | (cat 1>&2 | xsel -bi) 2>&1" # stdout, stderr => clip and stdout
fi
alias T='tail -n 50 -f'
# short commands
alias psp='ps -F ax'

# ctags python
alias ptags='find . -type f -name "*.py" -exec ctags -a {} \;'

# ssh-agent wrapper
exists lazy-ssh-agent && eval `lazy-ssh-agent setup ssh scp sftp`


# ----------------------------------------
# colors
autoload -U colors
colors

# ----------------------------------------
# functions
function ll {
  # super list
  l "$@" | $PAGER
}

function cdd {
  if ! builtin cd 2>/dev/null $@; then
    echo "$fg[yellow]cannot cd: $@$reset_color"
    return
  fi
  if [ "$?" -eq 0 ]; then
    lscdmax=40
    nfiles=$(/bin/ls|wc -l)
    if [ $nfiles -eq 0 ]; then
      if [ "$(/bin/ls -A|wc -l)" -eq 0 ]; then
        echo "$fg[yellow]no files in: $(pwd)$reset_color"
      else
        echo "$fg[yellow]only hidden files in: $(pwd)$reset_color"
        ls -A
      fi
    elif [ $lscdmax -ge $nfiles ]; then
      ls
    else
      echo "$fg[yellow]$nfiles files in: $(pwd)$reset_color"
    fi
  fi
}

function gd {
  # usage: gd 2
  # usage: gd (prompt..)
  if [ "$#" -ge 1 ]; then cd +"$1"; return ; fi
  dirs -v
  echo -n "select: "
  read nd
  if [ "$nd" != "" ]; then
    cd +"$nd"
  fi
}

function psg {
  # ps aux | grep ... but do not include ps nor grep
  HEAD=$(ps aux | head -n 1) # header
  COMMANDPOS=$(echo $HEAD | sed -r 's@COMMAND$@@' | wc -m) # where 'COMMAND' begins
  COMMANDPOS=$(($COMMANDPOS-1))
  ps aux | while read LINE; do
    echo $LINE | grep -v -E "^.{${COMMANDPOS}}"'(ps aux|grep)' >/dev/null # not ps|grep
    if [ "$?" -ne 0 ]; then continue; fi
    echo $LINE | grep $*
  done
}

# backup whole directory
function backup {
  D=`pwd|sed -r 's/^.*\/(.*?)$/\1/'`
  F=${D}_`date +%Y%m%d_%H%M`.tar.gz
  if [ -f 'Makefile' ]; then make clean; fi
  (builtin cd ..;
  tar zcvf ${F} $D;
  builtin cd -)
  if [ $# -ge 1 ]; then mv ${F} "$1/"; fi
  echo "saved: ${F}"
}

# backup only right on the current level (no recursion)
function slimbackup {
  D=`pwd|sed -r 's/^.*\/(.*?)$/\1/'`
  F=${D}_`date +%Y%m%d_%H%M`.tar.gz
  if [ -f 'Makefile' ]; then make clean; fi
  (builtin cd ..;
  tar --no-recursion -zcvf ${F} $D/*(^/);
  builtin cd -)
  if [ $# -ge 1 ]; then mv ${F} "$1/"; fi
  echo "saved: ${F}"
}

# ----------------------------------------
# keybinds
bindkey -e
bindkey '^[[1~' beginning-of-line # Home
bindkey '^[[4~' end-of-line # End
bindkey '^T' kill-word
bindkey '^U' backward-kill-line
bindkey '^[[3~' delete-char-or-list # Del
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete # Shift+TAB

# insert `date` on F5
function insert_datetime {
  LBUFFER=$LBUFFER'$(date +%Y%m%d-%H%M%S)'
}
function insert_date {
  LBUFFER=$LBUFFER'$(date +%Y%m%d)'
}
zle -N insert_date
zle -N insert_datetime
bindkey '^[[15~' insert_date
bindkey '^[[15;2~' insert_datetime

if [ $((${ZSH_VERSION%.*}>=4.3)) -eq 1 ]; then
  # directory up on Ctrl-6
  function cdup {
    echo
    cd ..
    echo
    zle reset-prompt
  }
  zle -N cdup
  bindkey '^\^' cdup

  # directory back on Ctrl-O
  function cdback {
    if [ "$(printf '%d' "$BUFFER")" = "$BUFFER" ]; then
      # back N level (reset)
      echo
      builtin cd +$BUFFER
      echo
      BUFFER=''
      zle reset-prompt
    else
      # back 1 level (inline)
      echo
      builtin cd -
      echo
      zle reset-prompt
    fi
  }
  zle -N cdback
  bindkey '^O' cdback

  LSORACCEPT_TEST=/bin/test
  if [ ! -x $LSORACCEPT_TEST ]; then LSORACCEPT_TEST=/usr/bin/test; fi
  # ls on single Enter
  function lsoraccept {
    # BUG: use /usr/bin/test rather than builtin [ .
    # calling [ in $CONTEXT = 'cont' will cause segv to zsh 4.3.4
    if $LSORACCEPT_TEST -z "$BUFFER"; then
      echo
      if $LSORACCEPT_TEST $(/bin/ls|wc -l) -eq 0; then
        # ls -A
      else
        # ls
      fi
      echo
    else
      zle accept-line
    fi
    # call reset-prompt outside the if-else-fi statement (to prepend showing 'for else>' in PS2)
    zle reset-prompt
  }
  zle -N lsoraccept
  bindkey '^M' lsoraccept

  # resume suspended job
  function zlewidget-fg {
    if [ -z "$(jobs)" ]; then
      return
    fi
    if [ "$(printf '%d' "$BUFFER")" = "$BUFFER" ]; then
      # fg %N
      echo ''
      builtin fg %$BUFFER
      BUFFER=''
      zle reset-prompt
    else
      # fg
      echo ''
      builtin fg
      zle reset-prompt
    fi
  }
  zle -N zlewidget-fg
  bindkey '^Z' zlewidget-fg
fi


# complete from history ignoring leading (sudo, '|', man, which, ..) in current prompt
# only complete in this way if there are some other input than those ignoring patterns
# examples with history:
#  ldconfig
#  make
#  make install
#  less
# case:
#  $ sudo   => $ sudo ldconfig
#  $ sudo m  => $ sudo make install => $ sudo make
#  $ wget -O - http://.../ | l => $ wget -O - http://.../ | less
SMART_SEARCH_HISTORY_PATTERN='(sudo|\||man|which)'
function smart-search-history {
  local trim="$(echo "$LBUFFER" | sed -r "s/^.*${SMART_SEARCH_HISTORY_PATTERN} *//")"
  local old_leader="$(echo "$LBUFFER" | sed -r "/${SMART_SEARCH_HISTORY_PATTERN}/s/(^.*${SMART_SEARCH_HISTORY_PATTERN} *).+?$/\\1/p;d")"
  if [ -n "$trim" ]; then
    LBUFFER="$trim"
    zle $1
    LBUFFER="$old_leader""$LBUFFER"
  else
    zle $1
  fi
}
function smart-search-history-backward {
  smart-search-history history-beginning-search-backward
}
function smart-search-history-forward {
  smart-search-history history-beginning-search-forward
}

zle -N smart-search-history-backward
bindkey '^[p' smart-search-history-backward
zle -N smart-search-history-forward
bindkey '^[n' smart-search-history-forward

# hjkl on completion
zmodload -i zsh/complist # -i: ignore errors (on duplicate load)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# smart insert last word
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([^[:space]])*'
bindkey '^]' insert-last-word

# quote previous word in single or double quote
autoload -U modify-current-argument
_quote-previous-word-in-single() {
  modify-current-argument '${(qq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N _quote-previous-word-in-single
bindkey '^[s' _quote-previous-word-in-single

_quote-previous-word-in-double() {
  modify-current-argument '${(qqq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N _quote-previous-word-in-double
bindkey '^[d' _quote-previous-word-in-double


# ----------------------------------------
# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt histignorealldups
setopt histnofunctions
setopt histnostore
setopt histreduceblanks
setopt histignorespace # do not add a command line with leading space to the history
setopt share_history

# ----------------------------------------
# zsh
setopt noclobber # 存在するファイルにリダイレクトしない
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushd_minus # swap '-' and '+' in the context of pushd
setopt ignoreeof # C-Dでログアウトしない
setopt print_eightbit # multibyte characters
setopt noflowcontrol # no C-S C-Q



# ----------------------------------------
# completion
autoload -U compinit
compinit -u

export LISTMAX=20
# ls, colors in completion
export LS_COLORS='di=1;34:ln=1;35:so=32:pi=33:ex=1;31:bd=46;34:cd=43;34:su=41;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=1 # C-P/C-N
# match upper case from lower case, search after -_./
# dir => Dir, _t => some_tmp, long.c => longfilename.c
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[-_./]=** r:|=*'
setopt nolistbeep # 曖昧補完でビープしない
setopt autolist # 補完時にリスト表示
#setopt listpacked # compact list on completion # 不安定?
setopt listtypes
unsetopt menucomplete # 最初から候補を循環する
setopt automenu # 共通部分を補完しそれ以外を循環する準備
setopt extendedglob # 展開で^とか使う
setopt numericglobsort # 数字展開は数値順
#setopt magicequalsubst # completion after '=' # 不安定?

setopt autoparamkeys # 補完後の:,)を削除
fignore=(.o .swp lost+found) # 補完で無視する

# ssh
function print_known_hosts {
  if [ -f $HOME/.ssh/known_hosts ]; then
    cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
  fi
}
_cache_hosts=($(print_known_hosts))

# 補完の種類
compctl -c man where
compctl -o setopt
compctl -s '$(setopt)' unsetopt # 設定されているオプション
compctl -v vared unset export
compctl -g '*(-/)' cd
compctl -b bindkey
compdef -d java

_cache_hosts=(localhost $HOST)

# include ~/.zsh_localrc if exists
local localzshrc=~/.zsh_localrc_$(basename $(hostname))
test -r $localzshrc && source $localzshrc && echo "$(hostname) local settings loaded."

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
