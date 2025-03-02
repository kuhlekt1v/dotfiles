#!/bin/bash

# execute command
# -------------------
# curl -s -H "Authorization: token <generate-gh-PAT>" https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/install-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
igolskyi.vscode-zenburn-plus-theme
pkief.material-icon-theme
bodil.file-browser
cometeer.spacemacs
vscodevim.vim
vspacecode.vspacecode
vspacecode.whichkey
kahole.magit
jacobdufault.fuzzy-search
angular.ng-template
johnpapa.angular2
ghaschel.vscode-angular-html
infinity1207.angular2-switcher
bierner.markdown-preview-github-styles
dsznajder.es7-react-js-snippets
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
esbenp.prettier-vscode
dbaeumer.vscode-eslint
mechatroner.rainbow-csv
visualstudioexptteam.vscodeintellicode
syler.sass-indented
github.copilot
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done


