echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-19.1 vendor/lenovo

echo 'Cloning system netd'
rm -rf system/netd && git clone --depth=1 https://github.com/Astridxx/android_system_netd -b lineage-19.1 system/netd

echo 'Cloning system bpf'
rm -rf system/bpf && git clone --depth=1 https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning revamped fmradio'
rm -rf packages/apps/RevampedFMRadio && git clone --depth=1 https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning dolby atmos'
git clone --depth=1 https://github.com/Astridxx/vendor_dolby -b lineage-19.1 vendor/dolby

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Frameworks base'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0001-SettingsProvider-Handle-write-device-config-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0003-Fix-error-com-google-android-gms-persistent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0004-LightsService-Mute-an-annoying-error-message.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0005-Disable-magnifier-position-animation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0006-touch-response-optimizations.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0007-Opportunistically-create-views-directly-for-performance.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0008-PackageInfo-Optimize-AppInfo-parsing.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0009-Disable-FP-lockouts.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0010-Dont-use-stretch-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0011-Dont-use-patterned-style-ripple-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0012-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/framework_base/0013-Update-AttestationHooks.patch
patch -p1 <0001-SettingsProvider-Handle-write-device-config-permission.patch
patch -p1 <0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0003-Fix-error-com-google-android-gms-persistent.patch
patch -p1 <0004-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0005-Disable-magnifier-position-animation.patch
patch -p1 <0006-touch-response-optimizations.patch
patch -p1 <0007-Opportunistically-create-views-directly-for-performance.patch
patch -p1 <0008-PackageInfo-Optimize-AppInfo-parsing.patch
patch -p1 <0009-Disable-FP-lockouts.patch
patch -p1 <0010-Dont-use-stretch-effect-by-default.patch
patch -p1 <0011-Dont-use-patterned-style-ripple-effect-by-default.patch
patch -p1 <0012-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
patch -p1 <0013-Update-AttestationHooks.patch
cd ../..

echo 'Adding patch to Frameworks av'
cd frameworks/av
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/frameworks_av/0001-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/frameworks_av/0002-Import-Dolby-Effects-initialization.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/frameworks_av/0003-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/frameworks_av/0004-Do-not-allow-DAP-effect-to-be-suspended.patch
patch -p1 <0001-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0002-Import-Dolby-Effects-initialization.patch
patch -p1 <0003-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
patch -p1 <0004-Do-not-allow-DAP-effect-to-be-suspended.patch
cd ../..

echo 'Adding patch to Frameworks native'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/frameworks_native/0001-native-touch-response-optimizations.patch
patch -p1 <0001-native-touch-response-optimizations.patch
cd ../..

echo 'Adding patch to DeskClock'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/packages_apps_DeskClock/0002-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/packages_apps_DeskClock/0003-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/packages_apps_DeskClock/0004-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0002-DeskClock-Remove-night-mode.patch
patch -p1 <0003-DeskClock-Adapt-digital-clocks-to-S-style.patch
patch -p1 <0004-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
cd ../../..

echo 'Adding patch to System core'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_core/0001-init-reboot-to-recovery-on-panic-by-default-to-allow-reading-pstore.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_core/0002-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_core/0003-init-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_core/0004-init-Fix-f2fs-symlink-for-kuntao.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_core/0005-libprocessgroup-switch-freezer-to-cgroup-v1.patch
patch -p1 <0001-init-reboot-to-recovery-on-panic-by-default-to-allow-reading-pstore.patch
patch -p1 <0002-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0003-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0004-init-Fix-f2fs-symlink-for-kuntao.patch
patch -p1 <0005-libprocessgroup-switch-freezer-to-cgroup-v1.patch
cd ../..

echo 'Adding patch to System sepolicy'
cd system/sepolicy
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/system_sepolicy/0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
patch -p1 <0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
cd ../..

echo 'Adding patch to Vendor aicp'
cd vendor/aicp
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/s12.1/vendor_aicp/0001-Update-overlay-for-kuntao.patch
patch -p1 <0001-Update-overlay-for-kuntao.patch
cd ../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
