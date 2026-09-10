# 🚀 OpenWrt Firmware Builder

基于 GitHub Actions 的 OpenWrt / ImmortalWrt 自动化固件构建框架。

本项目提供完整的 CI/CD 编译流程，用于快速构建个人定制 OpenWrt 固件。

支持多平台、多发行版、多配置文件以及自定义插件集成。

---

## ✨ Features

- ✅ GitHub Actions 自动编译
- ✅ 支持多个 OpenWrt 系发行版
- ✅ 支持多种硬件平台
- ✅ 支持多个独立 Workflow
- ✅ 支持自定义 feeds
- ✅ 支持第三方软件包集成
- ✅ 支持 DIY 脚本扩展
- ✅ 支持自定义默认配置
- ✅ 支持自动生成 Release
- ✅ 支持 Actions Cache 加速
- ✅ 支持 SSH 在线调试


---

# 📦 Supported Targets

当前支持：

| 平台 | 架构 | 状态 |
|-|-|-|
| x86_64 | x86_64 | ✅ |
| ARM64 | aarch64 | 🚧 |
| Other | - | 可扩展 |
