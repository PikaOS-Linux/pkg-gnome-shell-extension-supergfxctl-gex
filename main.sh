DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
apt install -y rpm
wget https://extensions.gnome.org/extension-data/supergfxctl-gexasus-linux.org.v30.shell-extension.zip
mkdir -p ./gnome-shell-extension-supergfxctl-gex
cp -rvf ./debian ./gnome-shell-extension-supergfxctl-gex/
cd ./gnome-shell-extension-supergfxctl-gex
mkdir -p ./usr/share/gnome-shell/extensions/supergfxctl-gex@asus-linux.org
unzip ../supergfxctl-gexasus-linux.org.v30.shell-extension.zip -d /usr/share/gnome-shell/extensions/supergfxctl-gex@asus-linux.org/

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -pv ./output
mv -v ./*.deb ./output/
