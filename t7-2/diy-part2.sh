#!/bin/bash

CUR_PWD=$(pwd)

# cp "$GITHUB_WORKSPACE"/custom/luci-* feeds/luci
rm feeds/luci/applications/luci-app-zerotier/root/etc/ -rf
mkdir feeds/luci/applications/luci-app-zerotier/root/etc/init.d -p
cp feeds/packages/net/zerotier/files/etc/init.d/zerotier feeds/luci/applications/luci-app-zerotier/root/etc/init.d/

cp "$GITHUB_WORKSPACE"/t7-2/mediatek.patch $CUR_PWD
git apply mediatek.patch
# cd feeds/luci && git apply luci-*
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
