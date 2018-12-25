# Configure prompt
autoload -Uz promptinit
promptinit
prompt walters

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt appendhistory beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stani/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# linux specific stuff
if [[ `hostname` == "svarog" ]] then

	# manage ethernet connection easily
	alias ethoff="nmcli dev disconnect iface enp4s0"
	alias ethon="nmcli con up id \"Wired connection 1\" iface enp4s0"

  # search the nixstore
  alias nsgrep="ls /nix/store | grep $@"

  # NixOS is a special snowflake
  unset GOROOT
  # cheating nix-shell
  alias nix-shell="nix-shell --command zsh"

elif [[ `uname` == "Darwin" ]] then

fi

if [[ `hostname` == "Marana" ]] then
	export TERM=xterm-256color
	~/.greet.sh
	alias dps="docker ps"
	alias dcb="docker-compose build --no-cache"
	alias dcu="docker-compose up -d"
	alias dcd="docker-compose down"
	alias dexec="docker exec -i -t"
fi

# function for making an image grub compatible
function mk_grub_compatible() {
  convert -resize 640x480 -colors 14 $1 filename.xpm.gz
}

function battlenet() {
  export WINEPREFIX=/home/stani/.wine/starcraft2 
  wine "$WINEPREFIX/drive_c/Program Files (x86)/Blizzard App/Battle.net Launcher.exe"
}

if [[ -n ${IN_NIX_SHELL+1} ]] then
  export PS1="[shell: $name]$PS1"
fi

if [[ -n ${SSH_CONNECTION+1} ]] then
	export TERM=xterm-256color
fi


#Git aliases
alias gco="git checkout"
alias gcm="git commit -m"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gbb="git branch"
alias ga="git add"
alias gd="git diff"

#alias cargo="rustup run cargo"
#alias rustc="rustup run rustc"


alias cdepi="cd ~/docs/epicert/"

# enable gpg auth for SSH
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
