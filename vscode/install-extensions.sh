#!/bin/bash

# execute command
# -------------------
# curl -s -H "Authorization: token <generate-gh-PAT>" https://raw.githubusercontent.com/kuhlekt1v/dotfiles/main/vscode/install-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
idbartosz.darkpp-italic
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
xabikos.reactsnippets
dsznajder.es7-react-js-snippets
burkeholland.simple-react-snippets
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
esbenp.prettier-vscode
dbaeumer.vscode-eslint
kreativ-software.csharpextensions
mechatroner.rainbow-csv
ms-dotnettools.csharp
ms-dotnettools.vscode-dotnet-runtime
ms-mssql.data-workspace-vscode
ms-mssql.mssql
ms-mssql.sql-database-projects-vscode
ms-python.black-formatter
ms-python.debugpy
ms-python.isort
ms-python.python
ms-python.vscode-pylance
rangav.vscode-thunder-client
ritwickdey.liveserver
visualstudioexptteam.vscodeintellicode
syler.sass-indented
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done


