#!/bin/bash
# Immortalwrt DIY part2
# — 在 .config 加载之后、make 之前运行 —

# =================================================================
# 步骤 1：【最先执行】加载你的第三方插件包配置（包含你的 mihomo 配置）
# =================================================================
PKG_CONF="$GITHUB_WORKSPACE/packages/immortalwrt.conf"
if [ -f "$PKG_CONF" ]; then
  grep -v '^#' "$PKG_CONF" | grep -v '^$' >>.config
  echo "已成功加载第三方插件配置"
fi


# =================================================================
# 【彻底物理删除】你不想要的app
# =================================================================
# 删除feeds中的插件
rm -rf package/lucky \
       feeds/luci/luci-theme-argon \
       package/feeds/packages/net/{geoview,chinadns-ng,hysteria,mosdns,v2ray-geodata,lucky,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,sing-box,v2ray-plugin,xray-core,smartdns,dae,daed} \
       package/feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-openclash,luci-app-homeproxy,luci-app-lucky,luci-app-smartdns,luci-app-timecontrol,luci-app-mosdns,luci-app-nikki,luci-app-momo,luci-app-daed,luci-app-dae,luci-theme-argon}


rm -rf package/feeds/video/sdl3
rm -rf package/feeds/video/sdl2-compat
rm -rf package/feeds/video/sdl3-*
rm -rf feeds/video/video/sdl3*
rm -rf feeds/luci/applications/luci-app-clientstatus
rm -rf package/feeds/luci/luci-app-clientstatus
rm -rf package/lucky
rm -rf feeds/luci/luci-theme-argon


[ -f package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json ] && sed -i 's#admin/services/ksmbd#admin/nas/ksmbd#g' package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json

[ -f package/small/luci-app-taskplan/luci-app-taskplan/root/usr/share/luci/menu.d/luci-app-taskplan.json ] && sed -i 's#admin/control#admin/services#g' package/small/luci-app-taskplan/luci-app-taskplan/root/usr/share/luci/menu.d/luci-app-taskplan.json

[ -f package/base-files/files/etc/passwd ] && sed -i 's#root:/bin/ash#root:/bin/bash#g' package/base-files/files/etc/passwd

[ -f package/feeds/luci/luci-app-nfs/root/etc/init.d/nfs ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/nfs" package/feeds/luci/luci-app-nfs/root/etc/init.d/nfs

[ -d package/base-files/files/etc/profile.d ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/30-sysinfo.sh" package/base-files/files/etc/profile.d/

[ -d package/base-files/files/etc ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/banner" package/base-files/files/etc/banner


#diy temp
if [ "$ARCHITECTURE" = "xr1710g" ]; then
    echo 'xr1710g diy part2 start...'
    rm patches/feeds/app_airoha/luci-app-airoha-npu/root/usr/libexec/rpcd/100-offload-unsupported-xg2010g-2g.patch
fi

if [ "$ARCHITECTURE" = "xg2010g" ]; then
    echo 'xg2010g diy part2 start...'
    rm patches/feeds/app_airoha/luci-app-airoha-npu/root/usr/libexec/rpcd/100-offload-unsupported-xg2010g-2g.patch
fi


if [ "$ARCHITECTURE" = "x86_64" ]; then
    echo ''
fi



