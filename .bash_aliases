alias sublime='~/bin/sublime/sublime_text &> /dev/null'
alias Done='~/bin/done'
alias gitup='~/gupd.sh'
alias ug='~/ug.sh'
alias g='~/greptransporter.sh'
alias fe='~/autogitfetch.sh'
alias coolvm='~/auto_kick_vmx.sh'
#alias mntR='~/mRemDir.sh'
#alias umntR='~/umRemDir.sh'
alias m='make'
alias mm='make clean && make'
alias auto='~/scripts/auto.sh'
alias dn='auto ~/scripts/setup_double_net.sh'


#pseudoname

#for qt3 plugin (custom widgets)
alias adopt="sed -e 's/:$//g' -e 's/:/ +/g' <<<"
alias gdif='~/scripts/gdiff.sh'
alias less='less -r'
alias lessru='LC_ALL=ru_RU.koi8r less -r'
alias s='~/saving_output.sh'
alias bo='echo -e "\\033[38;5;196m ================================================================================ \\033[0m"'
alias ..='cd ../'
alias gitG='gitg &> /dev/null'

#git shortcuts
alias ga='git add'
alias gap='git add -p'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcl='git clone'
alias gcommit='git commit'
alias gca='git commit --amend'
alias gcfg='git config --global'
alias gcfgn='git config --global user.name'
alias gcfge='git config --global user.email'
alias gdesc='git describe'
alias gd='git diff'
alias gdp='git diff -p'
alias gdc='git diff --cached'
alias gdch='git diff --check'
alias gdcc='git diff --cached --check'
alias gdf='git diff-files'
alias gdi='git diff-index'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gl='git log'
alias gll='git log --oneline --graph --decorate --all'
alias gm='git merge'
alias gmn='git merge --no-ff'
alias gmo='git merge --only-ff'
alias gp='git push'
alias gpo='git push origin'
alias gr='git remote'
alias gra='git remote add'
alias grr='git remote rm'
alias grp='git rev-parse - 1'
alias grm='git rm'
alias grmc='git rm -cached'
alias gsh='git show'
alias gshn='git show --name-only'
alias gst='git status'
alias gsu='git submodule'
alias gsua='git submodule add'
alias gsui='git submodule init'
alias gsurr='git submodule update --recursive --remote'
alias gsup='git submodule update'
alias gt='git tag'
alias gta='git tag -a'
