Build OpenWRT Firmware for Linksys WRT1900ACSv2

Repo.: Lienol's
Branch: main
Lan_IP: 192.168.1.1
Acc.: root
pswd.: password

# Build-in Apps
```luci-app-advancedreboot
luci-app-arpbind
luci-app-firewall [168.3 KB]
luci-app-passwall2
luci-app-openclash [only all dependencies, Main app not build-in]
luci-app-hd-idle [381 KB]
luci-app-socat [84.8 KB]
luci-app-transmission [Tr: 2.3 MB]
luci-app-ttyd [460 KB]
luci-app-turboacc
luci-app-iptvhelper [453 KiB]
luci-app-udpxy [30.9 KB]
luci-app-vlmcsd
luci-app-watchcat [10 KB]
luci-proto-wireguard; wireguard-tools,kmod-wireguard [109.8 KB]
luci-app-wol [10 KB]
luci-app-vsftpd
luci-theme-argon
[X] luci-app-*control*
[X] luci-app-ksmbd/kmod ver.3.5.1/6.1.81
[X] luci-app-ddns
[X] luci-app-bypass
[X] luci-app-rclone
[X] luci-app-ssr-plus```

# Addtional Build-in
openssh-sftp-server [53.5 KB]
zsh [1.84 MiB]

# Extending /overlay to /mnt/sdb1
mount /dev/sda1 /overlay  # in fstab

# opkg and feeds modification
vi /etc/opkg.conf 
# option check_signature

vi /etc/opkg/distfeeds.conf
src/gz kiddin9 https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/kiddin9
src/gz luci https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/luci
src/gz base https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/base
src/gz packages https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/packages
src/gz routing https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/routing
src/gz telephony https://dl.openwrt.ai/latest/packages/arm_cortex-a9_vfpv3-d16/telephony

cat /usr/lib/opkg/status
sed -i 's/a1ab2a9bcf9f21fac4fa28fd0375ed28/7e9d72c9afec89ed924865cc82184791/' /usr/lib/opkg/status

# Manually installed apps
luci-app-openclash [5.7 MiB]
luci-app-vssr-plus
luci-app-samba4 [10 MiB]
luci-app-adguardhome
luci-app-ddns-go [3.47 MiB]
luci-app-docker [192.48 MiB, Docker: 11.1 MB; Dockerd: 58.1 MB]
luci-app-dockerman
luci-app-diskman
luci-app-istorex
luci-app-lucky [Docker]
luci-app-xteve [4.7 KiB] [Docker]
Transmission-Web-Control [4.5 MiB]
# Dependencies for Openclash & Passwall2
haproxy [1.05 MiB]
Xray-Core [9.10 MiB]
hysteria [5.2 MiB]
sing-box [24.91 MiB]

# Personalize Settings in /files folder
files/etc/config
  dhcp
  firewall
  network
  wireless

# files/etc/uci-defaults/
#   99-custom

# files/root/.ssh
#   authorized_keys

