#!/bin/bash

# execute command
# -------------------
# curl -s -H "Authorization: token <generate-gh-PAT>" https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/install-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
angular.ng-template
bierner.markdown-preview-github-styles
bodil.file-browser
chaitanyashahare.lazygit
dbaeumer.vscode-eslint
denoland.vscode-deno
dimitarnonov.jellybeans-theme
dsznajder.es7-react-js-snippets
esbenp.prettier-vscode
formulahendry.auto-rename-tag
ghaschel.vscode-angular-html
github.copilot
github.copilot-chat
infinity1207.angular2-switcher
jacobdufault.fuzzy-search
johnpapa.angular2
mechatroner.rainbow-csv
ms-vscode.live-server
pkief.material-icon-theme
syler.sass-indented
vscodevim.vim
vspacecode.vspacecode
vspacecode.whichkey
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done


