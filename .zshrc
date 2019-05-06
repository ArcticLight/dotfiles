# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
#TERM=xterm-256color
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git nvm z zsh-syntax-highlighting command-not-found)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/dev/gradle/bin:$HOME/dev/adt-bundle/eclipse:$HOME/dev/idea/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source "$HOME/.global-fancy-editor.profile"
source "$HOME/.global-zsh-aliases.profile"

# Make Gradle permanently happy
export ANDROID_HOME=$HOME/dev/adt-bundle/sdk

export PATH=$PATH:$HOME/go/bin/

# If npm is installed...
if which npm > /dev/null 2>&1 ; then
    export PATH="${PATH}:$(npm -g bin)"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

###
# The old startup-directory-plus snippets (which basically never worked)
# and standup-zsh integration with TMUX (disabled because it ended up a hassle)
#
# Kept here for posterity, temporarily.
### 
# # Startup Directory ?
# if [ -z {STARTUP_DIRT+x} ]; then
# 
# else
#     cd $STARTUP_DIRT
# fi
# 
# #standup-zsh
# if [ -z ${TMUX+x} ]; then
#     if [[ -o login ]]; then
#         if [[ -z ${XDG_CURRENT_DESKTOP+x} ]]; then
#            
#         else
#             $HOME/standup-zsh.sh
#             exit
#         fi
#     elif [[ -z ${XDG_CURRENT_DESKTOP+x} ]]; then
#         echo "Not login and no XDG seat? You might be a robot."
#     else
#         $HOME/standup-zsh.sh
#         exit
#     fi
# fi

# Welcome text
echo "[$(date +"%m/%d/%y %I:%M %p")] Hello.\nToday is $(date +"%A, %b(%m) %d").\n\n" | tee -a "$HOME/.login-log"
