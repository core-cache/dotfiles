# yarn & nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# go
sudo yum install go -y
# fzf
go get -u github.com/junegunn/fzf
# git
sudo yum install git-gui -y
# rust
curl https://sh.rustup.rs -sSf | sh
# ag
sudo yum install the_silver_searcher -y
# build deps
sudo yum install libevent-devel ncurses-devel glibc-static -y
# vs code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo yum install code -y
sudo yum install gnome-terminal -y
bash -c  "$(wget -qO- https://git.io/vQgMr)" # install Gogh - terminal colours
# themes: 34 89 97 114 115 116 139
sudo yum install xclip -y
# flatpack https://flathub.org/repo/flathub.flatpakrepo
# gimp
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
