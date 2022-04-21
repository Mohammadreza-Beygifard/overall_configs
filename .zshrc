# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sobole"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias pip="pip-10.0.1"
alias vim="nvim"
alias clang='clang-12'
eval "$(register-python-argcomplete3 expt)"
export http_proxy="http://127.0.0.1:3128"
export https_proxy="http://127.0.0.1:3128"
export ftp_proxy="http://127.0.0.1:3128"
export HTTP_PROXY="http://127.0.0.1:3128"
export HTTPS_PROXY="http://127.0.0.1:3128"
export FTP_PROXY="http://127.0.0.1:3128"
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"

###  RPP-BEGIN  ###
# Do not change content between BEGIN and END!
# This section is managed by a script.
if [[ -d "/usr/libexec/rpp_zshrc.d" ]]; then
    for rc_script in "/usr/libexec/rpp_zshrc.d/"*; do
      source "${rc_script}"
    done
fi
###  RPP-END  ###

# Sourcing ros setup for usage
source /opt/ros/noetic/setup.zsh
# GIT Utils for DDAD
alias ddaddir="cd /home/sc62291/ddad/"
alias adpdir="cd /home/sc62291/ddad/application/adp"
# The checkout is destructive since -f is used
function pullall() { ddaddir; git checkout -f master && git pull && git submodule foreach 'git checkout -f master && git pull'; cd - ; }

ddadcompdb() {
    if [ $# -eq 0 ]; then
        echo "No Bazel targets specified!"
        return 1
    fi;
    cd ~/ddad &&
    ~/ddad/application/adp/tools/compile_commands/generate_compile_commands.sh ~/ddad/compile_commands.json --config=stla_base --config=platform_ros $* &&
    if [ -e ~/ddad/compile_commands.json ]; then
        sed -i 's/-fno-canonical-system-headers //g' ~/ddad/compile_commands.json;
        sed -i 's/-ftree-loop-vectorize //g' ~/ddad/compile_commands.json;
        perl -ni.bak -e 'print unless /.*\.h(pp)?"},?/' ~/ddad/compile_commands.json;
    fi;
    cd - 2> /dev/null;
}
