#!/bin/bash
# diy-part1 — 版本号补丁，all distros 共用
# 在 scripts/feeds update 之前运行

date_version=$(date +"%Y%m%d%H")
[ -f version ] && sed -i "s/0000000000/${date_version}/g" version || true



# ===== 拉自定义包 =====


if [ "$ARCHITECTURE" = "xr1710g" ]; then
    echo 'xr1710g diy start...'
    sed -i '/pushbot/d' feeds.conf.default
fi

if [ "$ARCHITECTURE" = "xg2010g" ]; then
    echo 'xg2010g diy start...'
    sed -i '/pushbot/d' feeds.conf.default
fi


mkdir package/small
pushd package/small

#git clone https://github.com/kenzok78/luci-app-adguardhome.git
git clone https://github.com/sirpdboy/luci-app-timecontrol.git
git clone https://github.com/sirpdboy/luci-app-taskplan.git
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git
git clone https://github.com/wukongdaily/luci-app-run.git
git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git
git clone https://github.com/kuoruan/openwrt-kcptun.git
git clone https://github.com/rchen14b/luci-theme-glass.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/sirpdboy/luci-app-lucky.git
git clone https://github.com/kenzok8/openwrt-daede.git

npm install -g pnpm

popd



