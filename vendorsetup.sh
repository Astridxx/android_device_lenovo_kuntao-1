echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-21 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-21 vendor/lenovo

echo 'Cloning dolby atmos'
git clone --depth=1 https://github.com/Astridxx/vendor_dolby -b lineage-21.0 vendor/dolby

echo 'Cloning faceunlock'
git clone --depth=1 https://gitlab.com/crdroidandroid/android_packages_apps_FaceUnlock.git -b 14.0 packages/apps/FaceUnlock

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Bionic'
cd bionic
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/bionic/0001-Implement-per-process-target-SDK-version-override.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/bionic/0002-Squash-of-pre-P-mutex-behavior-restoration.patch
patch -p1 <0001-Implement-per-process-target-SDK-version-override.patch
patch -p1 <0002-Squash-of-pre-P-mutex-behavior-restoration.patch
cd ..

echo 'Adding patch to Frameworks base'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0001-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0003-Ignore-cgroup-creation-errors.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0004-Dont-use-stretch-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0005-Dont-use-patterned-style-ripple-effect-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0006-Implement-activity-boost-optimization.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0007-Implement-transition-boosting.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0008-Boost-gesture-flings.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0009-Implement-exit-app-animation-boost.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0010-QS-fling-animation-boost.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0011-Optimize-connected-battery-level-scanning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0012-Optimize-window-transition-animation-scaling.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0013-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0014-allow-to-tune-killing-cached-processes-until-post-boot-completed.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0015-Optimize-AbsListView-to-reduce-click-operation-latency.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0017-SettingsProvider-Resolve-google-gms-configurator-denials.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0018-Remove-read-device-config-checks.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0019-B-service-aging-propagation-on-memory-pressure.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0020-LightsService-Mute-an-annoying-error-message.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0021-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0022-BiometricScheduler-Cancel-operation-if-not-idle.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0023-Optimize-notificiation-expansion-animation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0024-Disable-FP-lockouts.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0025-Fix-exception-when-retrieving-target-SDK-version.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0026-Keystore-Spoof-locked-bootloader-on-local-attestations.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0027-Spoof-build-fingerprint-for-Google-Play-Services.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0028-Update-Spoof-fingerprint-patch
patch -p1 <0001-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0002-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0003-Ignore-cgroup-creation-errors.patch
patch -p1 <0004-Dont-use-stretch-effect-by-default.patch
patch -p1 <0005-Dont-use-patterned-style-ripple-effect-by-default.patch
patch -p1 <0006-Implement-activity-boost-optimization.patch
patch -p1 <0007-Implement-transition-boosting.patch
patch -p1 <0008-Boost-gesture-flings.patch
patch -p1 <0009-Implement-exit-app-animation-boost.patch
patch -p1 <0010-QS-fling-animation-boost.patch
patch -p1 <0011-Optimize-connected-battery-level-scanning.patch
patch -p1 <0012-Optimize-window-transition-animation-scaling.patch
patch -p1 <0013-Disable-vendor-mismatch-warning.patch
patch -p1 <0014-allow-to-tune-killing-cached-processes-until-post-boot-completed.patch
patch -p1 <0015-Optimize-AbsListView-to-reduce-click-operation-latency.patch
patch -p1 <0017-SettingsProvider-Resolve-google-gms-configurator-denials.patch
patch -p1 <0018-Remove-read-device-config-checks.patch
patch -p1 <0019-B-service-aging-propagation-on-memory-pressure.patch
patch -p1 <0020-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0021-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
patch -p1 <0022-BiometricScheduler-Cancel-operation-if-not-idle.patch
patch -p1 <0023-Optimize-notificiation-expansion-animation.patch
patch -p1 <0024-Disable-FP-lockouts.patch
patch -p1 <0025-Fix-exception-when-retrieving-target-SDK-version.patch
patch -p1 <0026-Keystore-Spoof-locked-bootloader-on-local-attestations.patch
patch -p1 <0027-Spoof-build-fingerprint-for-Google-Play-Services.patch
patch -p1 <0028-Update-Spoof-fingerprint-patch
cd ../..

echo 'Adding patch to Frameworks av'
cd frameworks/av
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0001-Restore-clearkey-hidl-code.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0002-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0003-Import-Dolby-Effects-initialization.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0004-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0005-Do-not-allow-DAP-effect-to-be-suspended.patch
patch -p1 <0001-Restore-clearkey-hidl-code.patch
patch -p1 <0002-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0003-Import-Dolby-Effects-initialization.patch
patch -p1 <0004-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
patch -p1 <0005-Do-not-allow-DAP-effect-to-be-suspended.patch
cd ../..

echo 'Adding patch to Frameworks net'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid.patch
patch -p1 <0001-Restore-back-the-behavior-of-isValid.patch
cd ../../..

echo 'Adding patch to System bpf'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_bpf/00001-Support-no-bpf-usecase.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_bpf/00002-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
patch -p1 <00001-Support-no-bpf-usecase.patch
patch -p1 <00002-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
cd ../..

echo 'Adding patch to System netd'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0001-Support-no-bpf-usecases.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0003-Disable-bandwidth-control-for-BPF-less-devices.patch
patch -p1 <0001-Support-no-bpf-usecases.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0003-Disable-bandwidth-control-for-BPF-less-devices.patch
cd ../..

echo 'Adding patch to NetworkStack modules'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0001-Revert-Save-ip-client-parse-netlink-events-version-flag-value-at-initialization.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0002-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0003-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Save-ip-client-parse-netlink-events-version-flag-value-at-initialization.patch
patch -p1 <0002-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
patch -p1 <0003-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to System core'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0002-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0003-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0004-init-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0005-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0006-Panic-into-recovery-rather-than-bootloader.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0002-Camera-Add-feature-extensions.patch
patch -p1 <0003-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0004-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0005-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
patch -p1 <0006-Panic-into-recovery-rather-than-bootloader.patch
cd ../..

echo 'Adding patch to Connectivity modules'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0002-Dont-delete-UID-rom-BpfMap-on-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0003-Make-the-use-of-IBpfMaps-optional.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0004-Fix-BPF-less-devices-to-boot-Android-U.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0005-check-if-map-is-null-to-prevent-crash-on-BPF-less-devices.patch
patch -p1 <0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
patch -p1 <0002-Dont-delete-UID-rom-BpfMap-on-BPF-less-kernel.patch
patch -p1 <0003-Make-the-use-of-IBpfMaps-optional.patch
patch -p1 <0004-Fix-BPF-less-devices-to-boot-Android-U.patch
patch -p1 <0005-check-if-map-is-null-to-prevent-crash-on-BPF-less-devices.patch
cd ../../..

echo 'Adding patch to System sepolicy'
cd system/sepolicy
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_sepolicy/0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
patch -p1 <0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
cd ../..

echo 'Adding patch to Trebuchet'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_Trebuchet/0001-Show-clear-all-button-in-recents-overview.patch
patch -p1 <0001-Show-clear-all-button-in-recents-overview.patch
cd ../../..

echo 'Adding patcht to DeskClock'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch to Settings'
cd packages/apps/Settings
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_Settings/0001-Add-a-preference-to-battery-optimization-page.patch
patch -p1 <0001-Add-a-preference-to-battery-optimization-page.patch
cd ../../..

echo 'Adding patch to Vendor lineage'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/vendor_lineage/0001-Restore-target-process-sdk-version-ovveride.patch
patch -p1 <0001-Restore-target-process-sdk-version-ovveride.patch
cd ../..

echo 'Adding FaceUnlock Support'
cd frameworks/base
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/a193f15dc4e32a2641487b46a878a0211db5cdec.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/7ce122b533510967a61911f52c6b4096b5c471ab.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/379a4ca08db9c5f1e687141c768883fd307f51a1.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/d42d77e2366229cbb14075c5f860a3f115365b72.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/847d99b8dfb15d3d96ca63ebc1c1fc3d2df7e4f2.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/785b39d4c56e5f8fd0e5ed45be0722ae25ee4996.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/ac0d2c6ddefdc0f47ce0dff4244e6fcf44f842cd.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/7eb62a9e1ce44bf0c50eccc48627fd73b07f6818.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/ddc6d3b6fd85e0a57e0c15d893b25d579c214670.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/7c342b7b2dad4303264a34b2153bb10c5ded18ae.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/17072a00176a28474314791d96ebe1c5e0a904fb.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/f5fc49ff5fba0fae791c14bf90a7ba89302e62a9.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/0d7fa217ccad037ee904fd26e9ca60787533a3eb.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/704cc61da797a6610a8ff27d1eeacc7a0403289e.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/b6e8164fe532a79636e4dab5753ba4e49a14ae45.patch
wget https://github.com/kuntao-development/android_frameworks_base-2/commit/13ada2f471185a6599fe7f4055ad7d971d170f09.patch
patch -p1 <a193f15dc4e32a2641487b46a878a0211db5cdec.patch
patch -p1 <7ce122b533510967a61911f52c6b4096b5c471ab.patch
patch -p1 <379a4ca08db9c5f1e687141c768883fd307f51a1.patch
patch -p1 <d42d77e2366229cbb14075c5f860a3f115365b72.patch
patch -p1 <847d99b8dfb15d3d96ca63ebc1c1fc3d2df7e4f2.patch
patch -p1 <785b39d4c56e5f8fd0e5ed45be0722ae25ee4996.patch
patch -p1 <ac0d2c6ddefdc0f47ce0dff4244e6fcf44f842cd.patch
patch -p1 <7eb62a9e1ce44bf0c50eccc48627fd73b07f6818.patch
patch -p1 <ddc6d3b6fd85e0a57e0c15d893b25d579c214670.patch
patch -p1 <7c342b7b2dad4303264a34b2153bb10c5ded18ae.patch
patch -p1 <17072a00176a28474314791d96ebe1c5e0a904fb.patch
patch -p1 <f5fc49ff5fba0fae791c14bf90a7ba89302e62a9.patch
patch -p1 <0d7fa217ccad037ee904fd26e9ca60787533a3eb.patch
patch -p1 <704cc61da797a6610a8ff27d1eeacc7a0403289e.patch
patch -p1 <b6e8164fe532a79636e4dab5753ba4e49a14ae45.patch
patch -p1 <13ada2f471185a6599fe7f4055ad7d971d170f09.patch
cd ../..

cd packages/apps/Settings
wget https://github.com/kuntao-development/android_packages_apps_Settings/commit/4e37f405948465108642bc8d5ed51eab94b5eb2b.patch
wget https://github.com/kuntao-development/android_packages_apps_Settings/commit/f134ca19e81a98eac05da73b12a20dfbc7db17a1.patch
patch -p1 <4e37f405948465108642bc8d5ed51eab94b5eb2b.patch
patch -p1 <f134ca19e81a98eac05da73b12a20dfbc7db17a1.patch
cd ../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
