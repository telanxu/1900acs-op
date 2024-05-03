#!/bin/bash
# Copyright (c) 2022-2023 Curious <https://www.curious.host>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
# 
# https://github.com/Curious-r/OpenWrtBuildWorkflows
# Description: Automatically check OpenWrt source code update and build it. No additional keys are required.
#-------------------------------------------------------------------------------------------------------
#
#
# Patching is generally recommended.
# # Here's a template for patching:
#touch example.patch
#cat>example.patch<<EOF
#patch content
#EOF
#git apply example.patch

# Modify WiFi ON
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default SSID
# sed -i 's/ssid=OpenWrt/ssid=AirPort/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# ttyd 自动登录
sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# Change Host Name (Pure Numbers or Chinese)
sed -i 's/OpenWrt/router/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-argon）
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
