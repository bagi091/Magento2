# Alias

alias n98='n98-magerun2.phar'
alias magerun='n98-magerun2.phar'
alias mage='php -d memory_limit=-1 -f bin/magento'
alias magento='php -d memory_limit=-1 -f bin/magento'
alias node='nodejs'

# NVM
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
