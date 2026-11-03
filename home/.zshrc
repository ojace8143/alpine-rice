# ==========================================================================
#  ~/.zshrc — "midnight" zsh setup
#  palette: ice blue (#4C78A8) on midnight navy (#080D18)
#  full palette documented in ~/.colors
# ==========================================================================

# ------------------------------------------------------------------ history -
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# --------------------------------------------------------------- behaviour -
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt PROMPT_SUBST
metopt NUMERIC_GLOB_SORT

# ------------------------------------------------------------- path / bins -
export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# --------------------------------------------------------------- keys/edit -
bindkey -e
WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'

# ----------------------------------------------------------------- aliases -
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias ll='eza -lah --group-directories-first --icons=auto'
  alias la='eza -lah --group-directories-first --icons=auto'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='eza --tree --level=2 --long --icons --git -lah'
fi
if command -v bat >/dev/null 2>&1; then
  alias cat='bat --style=plain --paging=never'
  alias catn='bat --style=numbers,changes --paging=never'
  alias catp='bat --style=full --paging=always'
fi
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -rf'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias cls='clear'

export EDITOR=nvim
export MANPAGER='nvim +Man!'

# ------------------------------------------------------------ ls colors ---
export LS_COLORS="di=1;38;2;76;120;168:ln=38;2;99;197;218:so=38;2;167;139;250:pi=38;2;167;139;250:ex=1;38;2;114;199;160:bd=38;2;233;196;106:cd=38;2;233;196;106:su=38;2;224;108;117:sg=38;2;224;108;117:tw=1;38;2;120;169;219:ow=1;38;2;120;169;219:*.tar=38;2;233;196;106:*.tgz=38;2;233;196;106:*.gz=38;2;233;196;106:*.xz=38;2;233;196;106:*.zst=38;2;233;196;106:*.zip=38;2;233;196;106:*.7z=38;2;233;196;106:*.png=38;2;167;139;250:*.jpg=38;2;167;139;250:*.jpeg=38;2;167;139;250:*.gif=38;2;167;139;250:*.svg=38;2;167;139;250:*.mp3=38;2;99;197;218:*.flac=38;2;99;197;218:*.wav=38;2;99;197;218:*.mp4=38;2;99;197;218:*.mkv=38;2;99;197;218:*.pdf=38;2;224;108;117:*.md=38;2;120;169;219"

# ------------------------------------------------------------ eza colors ---
# truecolor (38;2;R;G;B) built from the midnight palette
__vd_rgb() { print -rn -- "38;2;$((16#${1:0:2}));$((16#${1:2:2}));$((16#${1:4:2}))"; }
export EZA_COLORS="\
di=1;$(__vd_rgb 4C78A8):\
fi=$(__vd_rgb E6F1FF):\
ex=1;$(__vd_rgb 72C7A0):\
pi=$(__vd_rgb E9C46A):\
so=$(__vd_rgb A78BFA):\
bd=$(__vd_rgb 526A89):\
cd=$(__vd_rgb 526A89):\
ln=$(__vd_rgb 63C5DA):\
or=1;$(__vd_rgb E06C75):\
mp=$(__vd_rgb 63C5DA):\
sp=$(__vd_rgb E9C46A):\
oc=$(__vd_rgb 315477):\
ur=$(__vd_rgb 4C78A8):\
uw=$(__vd_rgb 78A9DB):\
ux=$(__vd_rgb B5D8F5):\
ue=$(__vd_rgb B5D8F5):\
gr=$(__vd_rgb 8298B8):\
gw=$(__vd_rgb E6F1FF):\
gx=$(__vd_rgb B5D8F5):\
tr=$(__vd_rgb 8298B8):\
tw=$(__vd_rgb 315477):\
tx=$(__vd_rgb 315477):\
su=1;$(__vd_rgb A78BFA):\
sf=1;$(__vd_rgb A78BFA):\
xa=$(__vd_rgb 315477):\
sn=$(__vd_rgb 72C7A0):\
sb=$(__vd_rgb 315477):\
uu=1;$(__vd_rgb 4C78A8):\
uR=1;$(__vd_rgb E06C75):\
un=$(__vd_rgb 8298B8):\
gu=$(__vd_rgb 72C7A0):\
gR=1;$(__vd_rgb E06C75):\
gn=$(__vd_rgb E9C46A):\
lc=$(__vd_rgb 315477):\
lm=$(__vd_rgb 315477):\
df=$(__vd_rgb 315477):\
ds=$(__vd_rgb 315477):\
in=$(__vd_rgb 315477):\
bl=$(__vd_rgb 315477):\
hd=1;$(__vd_rgb 78A9DB):\
lp=$(__vd_rgb 315477):\
cc=$(__vd_rgb A78BFA):\
xx=$(__vd_rgb 315477):\
da=$(__vd_rgb 8298B8):\
ga=$(__vd_rgb 72C7A0):\
gm=$(__vd_rgb E9C46A):\
gd=$(__vd_rgb E06C75):\
gv=$(__vd_rgb 63C5DA):\
gt=$(__vd_rgb A78BFA):\
gi=$(__vd_rgb 315477):\
gc=1;$(__vd_rgb E06C75):\
Gm=1;$(__vd_rgb 72C7A0):\
Go=$(__vd_rgb 78A9DB):\
Gc=$(__vd_rgb 72C7A0):\
Gd=$(__vd_rgb E9C46A):\
im=$(__vd_rgb A78BFA):\
vi=$(__vd_rgb C4A7FF):\
mu=$(__vd_rgb 63C5DA):\
lo=$(__vd_rgb 8AE0ED):\
cr=$(__vd_rgb E9C46A):\
do=$(__vd_rgb 78A9DB):\
co=$(__vd_rgb E9C46A):\
tm=$(__vd_rgb 315477):\
cm=$(__vd_rgb 8298B8):\
bu=$(__vd_rgb 72C7A0):\
sc=$(__vd_rgb 72C7A0):\
*.tar=$(__vd_rgb E9C46A):*.tgz=$(__vd_rgb E9C46A):*.gz=$(__vd_rgb E9C46A):*.xz=$(__vd_rgb E9C46A):*.zst=$(__vd_rgb E9C46A):*.zip=$(__vd_rgb E9C46A):*.7z=$(__vd_rgb E9C46A):\
*.png=$(__vd_rgb A78BFA):*.jpg=$(__vd_rgb A78BFA):*.jpeg=$(__vd_rgb A78BFA):*.gif=$(__vd_rgb A78BFA):*.svg=$(__vd_rgb A78BFA):\
*.mp3=$(__vd_rgb 63C5DA):*.flac=$(__vd_rgb 63C5DA):*.wav=$(__vd_rgb 63C5DA):\
*.mp4=$(__vd_rgb 63C5DA):*.mkv=$(__vd_rgb 63C5DA):\
*.pdf=$(__vd_rgb E06C75):*.md=$(__vd_rgb 78A9DB)"
unset -f __vd_rgb

# ------------------------------------------------------- completion styling -
autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{#4C78A8}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{#E06C75}-- no matches --%f'
zstyle ':completion:*' group-name ''

# ------------------------------------------------------------------ zoxide -
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# ---------------------------------------------------------- autosuggestions -
# Only used if zsh-autosuggestions is installed.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#315477'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ---------------------------------------------------- syntax highlighting -
# Must be sourced last so it can wrap the line editor.
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --------------------------------------------------------------- fzf (opt) -
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
  export FZF_DEFAULT_OPTS="--color=bg+:#17263D,bg:#080D18,fg:#E6F1FF,hl:#78A9DB,hl+:#4C78A8,info:#8298B8,prompt:#78A9DB,pointer:#A78BFA,marker:#72C7A0,spinner:#63C5DA,header:#8298B8,border:#315477"
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  fi
fi

# ==========================================================================
#  midnight prompt
# ==========================================================================
typeset -g VD_ACCENT='%F{#4C78A8}'      # Ice Blue  (primary accent)
typeset -g VD_HL='%F{#78A9DB}'          # Frost     (highlight)
typeset -g VD_FG='%F{#E6F1FF}'          # Snow      (main text / values)
typeset -g VD_GRAY='%F{#8298B8}'        # Mist      (labels)
typeset -g VD_DIM='%F{#315477}'         # Glacier   (punct / separators)
typeset -g VD_RST='%f'

# --------------------------------------------------- duration + git prompt -
zmodload zsh/datetime
autoload -Uz add-zsh-hook

__vd_preexec() { __vd_start=$EPOCHREALTIME }

__vd_precmd() {
  # --- last command duration (ms) ---------------------------------------
  local dur=''
  if [[ -n $__vd_start ]]; then
    local -F ms
    (( ms = (EPOCHREALTIME - __vd_start) * 1000 ))
    dur="${ms%.*}ms"
    unset __vd_start
  fi

  # --- git branch@commit ------------------------------------------------
  local branch sha gp='' gc=''
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null)
    sha=$(git rev-parse --short HEAD 2>/dev/null)
    if [[ -n $branch && -n $sha ]]; then
      gp="${branch}@${sha}"
      gc="${VD_HL}${branch}${VD_DIM}@${VD_GRAY}${sha}${VD_RST}"
    elif [[ -n $sha ]]; then
      gp="${sha}"
      gc="${VD_GRAY}${sha}${VD_RST}"
    fi
  fi

  # --- build left + right, right-align the right segment to the terminal --
  local disp=$(print -P '%~')
  local plain_left="${USER}:(${disp})"

  local plain_right="| time: ${dur:-0ms}"
  [[ -n $gp ]] && plain_right+=" git: ${gp}"

  local cols=${COLUMNS:-80}
  local pad=$(( cols - 1 - ${#plain_left} - ${#plain_right} ))
  (( pad < 1 )) && pad=1
  printf -v __vd_pad '%*s' "$pad" ''

  local right="${VD_DIM}|${VD_RST} ${VD_GRAY}time:${VD_RST} ${VD_ACCENT}${dur:-0ms}${VD_RST}"
  [[ -n $gc ]] && right+=" ${VD_GRAY}git:${VD_RST} ${gc}"

  PROMPT="${VD_HL}${USER}${VD_RST}${VD_DIM}:(${VD_FG}${disp}${VD_DIM})${VD_RST}${__vd_pad}${right}"$'\n'$'%F{#4C78A8}%(!.#.$) %f'
  RPROMPT=''
}

add-zsh-hook preexec __vd_preexec
add-zsh-hook precmd  __vd_precmd

# ---------------------------------------------------------------- greeting -
if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi
