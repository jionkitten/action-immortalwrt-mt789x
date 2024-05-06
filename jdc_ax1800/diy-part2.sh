PATCH_FILE_1=$GITHUB_WORKSPACE/jdc_ax1800/0001-show-soc-status-on-luci.patch

git config --global user.name "OpenWrt Builder"
git config --global user.email "buster-openwrt@ovvo.uk"
cp $PATCH_FILE_1 $OPENWRT_PATH/feeds/luci
cd $OPENWRT_PATH/feeds/luci
git am 0001-show-soc-status-on-luci.patch

cd $OPENWRT_PATH
