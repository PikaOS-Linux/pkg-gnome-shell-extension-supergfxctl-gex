DEBIAN_FRONTEND=noninteractive

# Clone Upstream
apt install -y rpm
wget https://extensions.gnome.org/extension-data/supergfxctl-gexasus-linux.org.v33.shell-extension.zip
mkdir -p ./gnome-shell-extension-supergfxctl-gex
cp -rvf ./debian ./gnome-shell-extension-supergfxctl-gex/
cd ./gnome-shell-extension-supergfxctl-gex
mkdir -p ./usr/share/gnome-shell/extensions/supergfxctl-gex@asus-linux.org
unzip ../supergfxctl-gexasus-linux.org.v33.shell-extension.zip -d ./usr/share/gnome-shell/extensions/supergfxctl-gex@asus-linux.org/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -pv ./output
mv -v ./*.deb ./output/
