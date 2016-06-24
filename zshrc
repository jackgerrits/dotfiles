# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# oh-my-zsh Settings
#-------------

ZSH_THEME="dieter"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Load git zsh plugin
plugins=(git)

# Loads oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set the prompt to something custom
PROMPT='${time} ${pwd} $(git_prompt_info) > '


# PATH
#-----

# Core path value
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:"

# Extra paths for installed programs
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:$PKG_CONFIG_PATH"
