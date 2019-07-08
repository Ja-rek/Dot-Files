
sudo pacman -S python-pip python2-pip dotnet-sdk
sudo pip2 install pynvim && sudo pip3 install pynvim
pavucontrol
export EDITOR=nvim

nvidia-settings --assign CurrentMetaMode="DVI-D-0:1920x1080_60 +0+0 { ForceFullCompositionPipeline = On }"

mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service

sudo mysql_secure_installation

