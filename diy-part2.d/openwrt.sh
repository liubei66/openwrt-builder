#!/bin/bash
# OpenWrt DIY part2
# — 在 .config 加载之后、make 之前运行 —

# 删除feeds中的插件
rm -rf package/lucky \
       feeds/luci/luci-theme-argon \
       package/feeds/packages/net/{geoview,chinadns-ng,hysteria,mosdns,v2ray-geodata,lucky,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,sing-box,v2ray-plugin,xray-core,smartdns,dae,daed} \
       package/feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-openclash,luci-app-homeproxy,luci-app-lucky,luci-app-smartdns,luci-app-timecontrol,luci-app-mosdns,luci-app-nikki,luci-app-momo,luci-app-daed,luci-app-dae,luci-theme-argon}


# ===== 追加第三方插件包（不影响 .config 主文件）=====
PKG_CONF="$GITHUB_WORKSPACE/packages/openwrt.conf"
[ -f "$PKG_CONF" ] && grep -v '^#' "$PKG_CONF" | grep -v '^$' >>.config && echo "已加载第三方插件: openwrt" || true



# ===== UCI 默认值示例 ======
# mkdir -p openwrt/files/etc/uci-defaults
# cat > openwrt/files/etc/uci-defaults/99-custom << 'UCIEOF'
# uci set system.@system[0].timezone='CST-8'
# uci commit system
# UCIEOF

[ -f package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json ] && sed -i 's#admin/services/ksmbd#admin/nas/ksmbd#g' ./package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json

[ -f package/base-files/files/etc/passwd ] && sed -i 's#root:/bin/ash#root:/bin/bash#g' package/base-files/files/etc/passwd

[ -f package/feeds/luci/luci-app-nfs/root/etc/init.d/nfs ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/nfs" package/feeds/luci/luci-app-nfs/root/etc/init.d/nfs

[ -d package/base-files/files/etc/profile.d ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/30-sysinfo.sh" package/base-files/files/etc/profile.d/

[ -d package/base-files/files/etc ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/banner" package/base-files/files/etc/banner
