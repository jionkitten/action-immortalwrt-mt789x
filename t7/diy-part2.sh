#!/bin/bash

CUR_PWD=$(pwd)

cp "$GITHUB_WORKSPACE"/custom/luci-* feeds/luci
rm feeds/luci/applications/luci-app-zerotier/root/etc/init.d/zerotier
cd feeds/luci && git apply luci-*
cd "$CUR_PWD"

# cp "$GITHUB_WORKSPACE"/custom/glib2.patch feeds/packages
# cd feeds/packages && git apply glib2.patch
# cd "$CUR_PWD"

# cp "$GITHUB_WORKSPACE"/custom/mosdns-4.patch feeds/packages
# cd feeds/packages && git apply mosdns-4.patch
# rm -rf net/mosdns/patches
# cd "$CUR_PWD"

# mkdir -p files/etc
# cp -r "$GITHUB_WORKSPACE"/custom/hotplug.d files/etc

# https://github.com/sbwml/luci-app-alist
# rm -rf feeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
# sudo apt install libfuse-dev
# git clone https://github.com/sbwml/luci-app-alist package/alist

mkdir -p files/usr/share/geodata
curl -L https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -o "files/usr/share/geodata/geosite.dat"
curl -L https://github.com/Loyalsoldier/geoip/releases/latest/download/geoip-only-cn-private.dat -o "files/usr/share/geodata/geoip.dat"

mkdir -p files/usr/bin
CLASH_META_URL=$(curl https://api.github.com/repos/MetaCubeX/mihomo/releases/tags/Prerelease-Alpha | jq -c '.assets[] | select(.name | contains("linux-arm64-alpha")) | .browser_download_url' -r)
curl -L $CLASH_META_URL -o files/usr/bin/clash.gz
gzip -d files/usr/bin/clash.gz
chmod a+x /usr/bin/clash

# revert to version 20230209 VLess bug
# cp "$GITHUB_WORKSPACE"/custom/clash files/usr/bin/
# chmod a+x files/usr/bin/clash

curl -LO https://github.com/IrineSistiana/mosdns/releases/download/v4.5.3/mosdns-linux-arm64.zip
unzip mosdns-linux-arm64.zip -d /tmp
cp /tmp/mosdns files/usr/bin/
chmod a+x files/usr/bin/mosdns

# curl -LO https://github.com/MetaCubeX/subconverter/releases/download/Alpha/subconverter_aarch64.tar.gz
# tar xzf subconverter_aarch64.tar.gz
# mv ./subconverter files/etc/

mkdir -p files/etc/clash
curl -LO https://github.com/MetaCubeX/metacubexd/archive/gh-pages.zip
unzip gh-pages.zip -d files/etc/clash
