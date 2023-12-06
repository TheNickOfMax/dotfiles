# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Add stuff to PATH
export PATH="/home/lapepega/.config/emacs/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH plugins
plugins=(
   git
   zsh-autosuggestions
)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Start the zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Aliases, I love aliases
alias ls='ls --color=auto --group-directories-first'
l() {
	if [ $# -eq 0 ]
	then
		ls -lA -d .*;
	else
		(cd "$@"; ls -lA -d .*);
	fi
	ls -l "$@";
	echo '';
}

alias cls='clear'
alias cll='cls;l'

alias rr='rm -fr '
alias cp='cp -fr '

alias pacs='sudo pacman -S '
alias pacss='pacman -Ss '
alias pacr='sudo pacman -R '
alias paclean="sudo pacman -Sc"
alias upd='sudo pacman -Syu'
alias pacu='upd'

alias yays='yay -S '
alias yayss='yay -Ss '
alias yayr='yay -R '

alias !="sudo"
alias fucking='sudo'

alias x='exit'
alias grep='grep --color=auto'
alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""

alias slp="xset dpms force off"

alias vcode="code .;x"
alias iwre="iwctl station wlan0 disconnect && iwctl station wlan0 connect Keenetic-9829"
alias opn="xdg-open"
alias nn="nano"
alias hex="hexedit"
alias vim="nvim"
alias fox='firefox'
alias clip="xclip -selection clipboard"

alias proton='STEAM_COMPAT_DATA_PATH=/home/lapepega/.prtn STEAM_COMPAT_CLIENT_INSTALL_PATH=/home/lapepega/.prtn /home/lapepega/.steam/steam/steamapps/common/Proton\ -\ Experimental/proton run'
alias prtn="proton"

det() { $@ &;disown }
lk() { cdl "$(walk "$@")" }
scan() {
	if [ $# -eq 0 ]
	then
		scanimage --device "smfp:usb;04e8;3419;8P66BAJQ217170H." --format=tiff --output-file scan.tiff --progress && convert scan.tiff scan.png && rm -fr scan.tiff
		return ;
	fi
	scanimage --device "smfp:usb;04e8;3419;8P66BAJQ217170H." --format=tiff --output-file $1.tiff --progress && convert $1.tiff $1.png && rm -fr $1.tiff
}

mnt() { sudo mkdir /mnt/$1 && sudo mount /dev/$1 /mnt/$1 || sudo rm -fr /mnt/$1 }
umnt() { sudo umount /mnt/$1 && sudo rm -fr /mnt/$1; }

uzip() { zp=".zip"; szp=".7z"; zpth="$1"; pth=${zpth%"$zp"}; pth=${pth%"$szp"}; mkdir $pth && cd $pth && 7z x ../$zpth && cll }
azip() { 7z a "$1.zip" $1 }

cdl() { cd $@ && clear && l }
mkcd() { mkdir $1 && cd $1; }

ytd() { yt-dlp $1 -S res,ext:mp4:m4a --recode mp4; }
fnd() { sudo find / -name $1}

eval "$(thefuck --alias)"
