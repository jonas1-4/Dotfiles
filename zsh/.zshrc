# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=100000
setopt SHARE_HISTORY

# Created by newuser for 5.8
#
bindkey -v





#cat ~/.cache/wal/sequences 

export ANDROID_HOME="/home/jonas/android-sdk"
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$PATH
export FLUTTER_SDK="/home/jonas/private/development/flutter/flutter/"
export PATH="$PATH:/home/jonas/private/development/flutter/flutter/bin"
export PATH="$PATH:/home/jonas/android-sdk/tools/bin/"
export PATH="$PATH:/home/jonas/bin/node/bin"
export PATH="$PATH:/home/jonas/go/bin"
export PATH="$PATH:/home/jonas/Scripts/"
export PATH="$PATH:/home/jonas/Git-Programs/keg/bin"	
export PATH="$PATH:/home/jonas/neovim/bin/"
export PATH="$PATH:/home/jonas/Scripts/autostartprograms"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"/home/jonas/.local/share/gem/ruby/3.0.0/bin":"/home/jonas/.local/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export GAMEMODERUNEXEC="env __NV_PRIME_RENDER_OFFLOAD=1 env __GLX_VENDOR_LIBRARY_NAME=nvidia env __VK_LAYER_NV_optimus=NVIDIA_only"

#emacs
export DOOMDIR="/home/jonas/private/dotfiles/doom"
export PATH="$PATH:/home/jonas/.config/emacs.d/doom.emacs.d/bin"

#for intellij
export _JAVA_AWT_WM_NONREPARENTING=1

#for waifu2x
export CUDAToolkit_ROOT=/opt/cuda/
export PATH=$PATH:/opt/cuda/bin

export LD_LIBRARY_PATH=/usr/local/lib

#own programs im to lazy to add to bin
#export PATH="$PATH":"$HOME/Developing/C/kilo/kilo"

export IDEA_JDK="/usr/lib/jvm/jdk-jetbrains"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"


export IDE=intellij-idea-ultimate-edition
export BROWSER=firefox
export EDITOR=emacs
export TerminalEmulator=kitty
export CHROME_EXECUTABLE=/usr/bin/chromium
export LAPTOPSCREEN=$(/home/jonas/private/development/scripts/monitors/laptop.sh)
export EXTERNALSCREEN=$(/home/jonas/private/development/scripts/monitors/external.sh)


export GOOGLE_APPLICATION_CREDENTIALS="/home/jonas/private/documents/arbeit/OplusFON/oplus-fon-346d78c8526e.json"
alias google-chrome=firefox
alias deployOplus="(cd /home/jonas/private/development/flutter/dvoss-scanner/firebase/ && python deploy.py) "

autoload -Uz compinit && compinit

#aliases 
alias e="emacsclient -c"
alias ls="lsd"
alias mb1="sudo mount /dev/sdb1 /mnt"
alias mountExt="sudo mount /dev/sdb1 /extMount"
alias mb2="sudo mount /dev/sdb2 /mnt"
alias mc1="sudo mount /dev/sdc1 /mnt"
alias mc2="sudo mount /dev/sdc2 /mnt"
alias tmux="tmux -u"
alias dwarf="python ~/private/games/LinuxDwarfPack/launch.py"
alias s='sudo $(fc -ln -1) && echo "you got sudod"'
alias hearthstone='emulator -avd Pixel_4_API_31 &> /dev/null &'


alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'


alias MS="sudo mount /dev/sdb1 /Games/ && cd /Games/MinecraftServer/ && sudo java -Xms2G -Xmx2G -jar paper-1.16.4-312.jar"

alias sndmon="xrandr --output eDP-1-1 --right-of HDMI-1-1 && xrandr --output HDMI-1-1 --primary && xrandr --output HDMI-1-1 --auto && xrandr --output eDP-1-1 --auto && feh --bg-scale ~/Pictures/ArchLinuxBackground.png"

alias em="emulator -avd em" 

alias v="nvim" 
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
# exec tmux
#fi

#mpdf () {
#	man -t $1 | ps2pdf -> ~/Documents/man.pdf && epdfview ~/Documents/man.pdf
#	}
#
#
#gcb() {
#	git checkout master && 
#  	make clean && 
#	rm -f config.h && 
#	reset --hard origin/master && 
#	git branch $1 && 
#	git checkout $1
#}
#gitmerge(){
#	branch=$(git rev-parse --abbrev-ref HEAD)
#	git checkout master && git merge $branch && git push && git checkout $branch}
#	alias gitcommit(){
#	git add . && git commit . -m "$1"
#}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


