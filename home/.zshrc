# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/. zshrc. 
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.privateZshrc
alias devChrome="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"
alias ls="lsd"
alias cd..="cd ../"
export ANDROID_HOME=~/Library/Android/sdk/
export PATH="$PATH":"$HOME/.pub-cache/bin":"/Users/jonasackermann/.emacs.d/bin":"$ANDROID_HOME/tools":"$ANDROID_HOME/platform-tools"
export PATH=~/.cargo/bin:$PATH
export PATH=~/fvm/default/bin:$PATH
HISTFILE=~/.zsh_history
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/jonasackermann/.dart-cli-completion/zsh-config.zsh ]] && . /Users/jonasackermann/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
