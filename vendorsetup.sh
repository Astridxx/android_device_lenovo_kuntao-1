echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-21 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-21 vendor/lenovo

echo 'Cloning revamped fmradio'
rm -rf packages/apps/RevampedFMRadio && git clone --depth=1 https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning clang r416183b'
rm -rf prebuilts/clang/kernel/linux-x86/clang-r416183b && git clone --depth=1 https://github.com/LineageOS/android_prebuilts_clang_kernel_linux-x86_clang-r416183b -b lineage-20.0 prebuilts/clang/kernel/linux-x86/clang-r416183b

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Bionic'
cd bionic
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/bionic/0001-Implement-per-process-target-SDK-version-override.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/bionic/0002-Squash-of-pre-P-mutex-behavior-restoration.patch
patch -p1 <0001-Implement-per-process-target-SDK-version-override.patch
patch -p1 <0002-Squash-of-pre-P-mutex-behavior-restoration.patch
cd ..

echo 'Adding patch to Frameworks base'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0001-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0003-Ignore-cgroup-creation-errors.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0004-Dont-use-stretch-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0005-Dont-use-patterned-style-ripple-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0006-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0007-allow-to-tune-killing-cached-processes-until-post-boot-completed.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0008-LightsService-Mute-an-annoying-error-message.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0009-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0010-Disable-FP-lockouts.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/framework_base/0011-Optimize-connected-battery-level-scanning.patch
patch -p1 <0001-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0003-Ignore-cgroup-creation-errors.patch
patch -p1 <0004-Dont-use-stretch-effect-by-default.patch
patch -p1 <0005-Dont-use-patterned-style-ripple-effect-by-default.patch
patch -p1 <0006-Disable-vendor-mismatch-warning.patch
patch -p1 <0007-allow-to-tune-killing-cached-processes-until-post-boot-completed.patch
patch -p1 <0008-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0009-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
patch -p1 <0010-Disable-FP-lockouts.patch
patch -p1 <0011-Optimize-connected-battery-level-scanning.patch
cd ../..

echo 'Adding patch to Frameworks av'
cd frameworks/av
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/frameworks_av/0001-Restore-clearkey-hidl-code.patch
patch -p1 <0001-Restore-clearkey-hidl-code.patch
cd ../..

echo 'Adding patch to Frameworks net'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid.patch
patch -p1 <0001-Restore-back-the-behavior-of-isValid.patch
cd ../../..

echo 'Adding patch to System bpf'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_bpf/00001-Support-no-bpf-usecase.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_bpf/00002-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
patch -p1 <00001-Support-no-bpf-usecase.patch
patch -p1 <00002-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
cd ../..

echo 'Adding patch to System netd'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_netd/0001-Support-no-bpf-usecases.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_netd/0003-Disable-bandwidth-control-for-BPF-less-devices.patch
patch -p1 <0001-Support-no-bpf-usecases.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0003-Disable-bandwidth-control-for-BPF-less-devices.patch
cd ../..

echo 'Adding patch to NetworkStack modules'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_NetworkStack/0001-Revert-Save-ip-client-parse-netlink-events-version-flag-value-at-initialization.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_NetworkStack/0002-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_NetworkStack/0003-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Save-ip-client-parse-netlink-events-version-flag-value-at-initialization.patch
patch -p1 <0002-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
patch -p1 <0003-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to System core'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_core/0002-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_core/0003-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_core/0004-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0002-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
patch -p1 <0003-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0004-init-Dont-enable-f2fs-iostat-by-default.patch
cd ../..

echo 'Adding patch to Connectivity modules'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_Connectivity/0002-Dont-delete-UID-rom-BpfMap-on-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_Connectivity/0003-Make-the-use-of-IBpfMaps-optional.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_Connectivity/0004-Fix-BPF-less-devices-to-boot-Android-U.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_modules_Connectivity/0005-check-if-map-is-null-to-prevent-crash-on-BPF-less-devices.patch
patch -p1 <0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
patch -p1 <0002-Dont-delete-UID-rom-BpfMap-on-BPF-less-kernel.patch
patch -p1 <0003-Make-the-use-of-IBpfMaps-optional.patch
patch -p1 <0004-Fix-BPF-less-devices-to-boot-Android-U.patch
patch -p1 <0005-check-if-map-is-null-to-prevent-crash-on-BPF-less-devices.patch
cd ../../..

echo 'Adding patch to System sepolicy'
cd system/sepolicy
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/system_sepolicy/0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
patch -p1 <0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
cd ../..

echo 'Adding patcht to DeskClock'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch to Vendor lineage'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/vendor_lineage/0001-Cleanup-for-Kuntao.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/Matrixx-14/vendor_lineage/0002-Restore-target-process-sdk-version-ovveride.patch
patch -p1 <0001-Cleanup-for-Kuntao.patch
patch -p1 <0002-Restore-target-process-sdk-version-ovveride.patch
cd ../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
