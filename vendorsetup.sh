echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-21 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-21 vendor/lenovo

echo 'Cloning revamped fmradio'
rm -rf packages/apps/RevampedFMRadio && git clone --depth=1 https://github.com/Astridxx/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

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

echo 'Adding patch to Build make'
cd build/make
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/build_make/0001-Set-Product-Compressed-Apex-false.patch
patch -p1 <0001-Set-Product-Compressed-Apex-false.patch
cd ../..

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
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0016-Revert-Remove-deprecated-Radio-1-4-Apı-and-references.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0017-SettingsProvider-Resolve-google-gms-configurator-denials.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0018-B-service-aging-propagation-on-memory-pressure.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0019-LightsService-Mute-an-annoying-error-message.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0020-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0021-BiometricScheduler-Cancel-operation-if-not-idle.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0022-Fix-exception-when-retrieving-target-SDK-version.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0023-Keystore-Spoof-locked-bootloader-on-local-attestations.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0024-Spoof-build-fingerprint-for-Google-Play-Services.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0025-Update-Spoof-fingerprint-patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0026-fixup-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0027-Disable-deprecated-target-abi-dialog.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0028-Disable-FP-lockouts.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/framework_base/0029-Optimize-notification-expansion-animation.patch
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
patch -p1 <0016-Revert-Remove-deprecated-Radio-1-4-Apı-and-references.patch
patch -p1 <0017-SettingsProvider-Resolve-google-gms-configurator-denials.patch
patch -p1 <0018-B-service-aging-propagation-on-memory-pressure.patch
patch -p1 <0019-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0020-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
patch -p1 <0021-BiometricScheduler-Cancel-operation-if-not-idle.patch
patch -p1 <0022-Fix-exception-when-retrieving-target-SDK-version.patch
patch -p1 <0023-Keystore-Spoof-locked-bootloader-on-local-attestations.patch
patch -p1 <0024-Spoof-build-fingerprint-for-Google-Play-Services.patch
patch -p1 <0025-Update-Spoof-fingerprint-patch
patch -p1 <0026-fixup-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0027-Disable-deprecated-target-abi-dialog.patch
patch -p1 <0028-Disable-FP-lockouts.patch
patch -p1 <0029-Optimize-notification-expansion-animation.patch
cd ../..

echo 'Adding patch to Frameworks av'
cd frameworks/av
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0001-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0002-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0003-Do-not-allow-DAP-effect-to-be-suspended.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0004-Restore-clearkey-hidl-code.patch
patch -p1 <0001-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0002-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
patch -p1 <0003-Do-not-allow-DAP-effect-to-be-suspended.patch
patch -p1 <0004-Restore-clearkey-hidl-code.patch
cd ../..

echo 'Adding patch to Frameworks native'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_native/0001-Disable-gpuservice-on-old-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_native/0002-SurfaceFlinger-Disable-SF-HWC-backpressure.patch
patch -p1 <0001-Disable-gpuservice-on-old-BPF-less-kernel.patch
patch -p1 <0002-SurfaceFlinger-Disable-SF-HWC-backpressure.patch
cd ../..

echo 'Adding patch to Frameworks telephony'
cd frameworks/opt/telephony
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_opt_telephony/0001-Revert-Remove-deprecated-Radio-1-4-API-and-reference.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_opt_telephony/0002-Revert-Remove-deprecated-HAL-versions-for-IRadio.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_opt_telephony/0003-Pass-correct-value-to-setPreferredNetworkType-for-RIL-version-1-4.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_opt_telephony/0004-Fix-NPE-with-1-0-and-1-1-CardStatus.patch
patch -p1 <0001-Revert-Remove-deprecated-Radio-1-4-API-and-reference.patch
patch -p1 <0002-Revert-Remove-deprecated-HAL-versions-for-IRadio.patch
patch -p1 <0003-Pass-correct-value-to-setPreferredNetworkType-for-RIL-version-1-4.patch
patch -p1 <0004-Fix-NPE-with-1-0-and-1-1-CardStatus.patch
cd ../../..

echo 'Adding patch to System bpf'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_bpf/00001-Support-no-bpf-usecase.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_bpf/00002-fixup-Support-no-bpf-usecase.patch
patch -p1 <00001-Support-no-bpf-usecase.patch
patch -p1 <00002-fixup-Support-no-bpf-usecase.patch
cd ../..

echo 'Adding patch to NetworkStack modules'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0001-Disable-parsing-netlink-events-from-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0002-Revert-BR05-Disable-doze-mode-workaround-when-ignore-blocked-uids.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0003-Revert-BR10-Skip-tcp-info-for-uids-which-blocked-by-data-saver.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0004-Revert-BR04-Skip-traffic-of-etworking-blocked-uid-in-data-stall-detection.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0005-Revert-Remove-isTcpInfoParsingSupported-and-Q-test-annotations.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0006-Requesting-tcp-info-via-netlink-socket-is-not-supported.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0007-Revert-BR13-dump-Device-Configs-to-dumpsys.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_NetworkStack/0008-Revert-BR03-2-Implement-NetworkStack-is-uid-networking-blocked-shell-command.patch
patch -p1 <0001-Disable-parsing-netlink-events-from-kernel.patch
patch -p1 <0002-Revert-BR05-Disable-doze-mode-workaround-when-ignore-blocked-uids.patch
patch -p1 <0003-Revert-BR10-Skip-tcp-info-for-uids-which-blocked-by-data-saver.patch
patch -p1 <0004-Revert-BR04-Skip-traffic-of-etworking-blocked-uid-in-data-stall-detection.patch
patch -p1 <0005-Revert-Remove-isTcpInfoParsingSupported-and-Q-test-annotations.patch
patch -p1 <0006-Requesting-tcp-info-via-netlink-socket-is-not-supported.patch
patch -p1 <0007-Revert-BR13-dump-Device-Configs-to-dumpsys.patch
patch -p1 <0008-Revert-BR03-2-Implement-NetworkStack-is-uid-networking-blocked-shell-command.patch
cd ../../..

echo 'Adding patch to System netd'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0001-Support-no-bpf-usecases.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0003-Disable-bandwidth-control-for-BPF-less-devices.patch
patch -p1 <0001-Support-no-bpf-usecases.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0003-Disable-bandwidth-control-for-BPF-less-devices.patch
cd ../..

echo 'Adding patch to Services Telephony'
cd packages/services/Telephony
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_services_Telephony/0001-Revert-Remove-deprecated-Radio-1-4-API-and-references.patch
patch -p1 <0001-Revert-Remove-deprecated-Radio-1-4-API-and-references.patch
cd ../../..

echo 'Adding patch to System core'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0002-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0003-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0005-init-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0006-Panic-into-recovery-rather-than-bootloader.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0002-Camera-Add-feature-extensions.patch
patch -p1 <0003-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
patch -p1 <0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0005-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0006-Panic-into-recovery-rather-than-bootloader.patch
cd ../..

echo 'Adding patch to Connectivity modules'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0002-Support-non-working-BPF-maps-on-old-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0003-More-bpf-errors-ignore-there-are-some-4-14-without-the-bpf-jit-file.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0004-disable-SocketNetlinkMonitor.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0005-dnsresolver-Support-no-bpf-usecase.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0006-clatcoordinator-Support-no-bpf-usecase.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0007-BpfNetMaps-Make-use-of-BpfNetMaps-safe.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_Connectivity/0008-libnetworkstats-Make-use-of-BpfMap-safe.patch
patch -p1 <0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
patch -p1 <0002-Support-non-working-BPF-maps-on-old-BPF-less-kernel.patch
patch -p1 <0003-More-bpf-errors-ignore-there-are-some-4-14-without-the-bpf-jit-file.patch
patch -p1 <0004-disable-SocketNetlinkMonitor.patch
patch -p1 <0005-dnsresolver-Support-no-bpf-usecase.patch
patch -p1 <0006-clatcoordinator-Support-no-bpf-usecase.patch
patch -p1 <0007-BpfNetMaps-Make-use-of-BpfNetMaps-safe.patch
patch -p1 <0008-libnetworkstats-Make-use-of-BpfMap-safe.patch
cd ../../..

echo 'Adding patch to DnsResolver'
cd packages/modules/DnsResolver
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_DnsResolver/0001-Dont-abort-if-the-DnsHelper-failed-to-init-on-BPF-less-kernel.patch
patch -p1 <0001-Dont-abort-if-the-DnsHelper-failed-to-init-on-BPF-less-kernel.patch
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
wget https://github.com/Astridxx/android_frameworks_base/commit/3f623be42e51cc89ca8eeb8f6738be9a7f232ccb.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/782d87d56b6ae0152cbdd87ebb69ff4291c6ec52.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/46b452a5f07c74d47e91d124fa61b3d9a3267e2c.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/483576c33811b4b6034943f3ee5fef7c5b14077a.patch
patch -p1 <3f623be42e51cc89ca8eeb8f6738be9a7f232ccb.patch
patch -p1 <782d87d56b6ae0152cbdd87ebb69ff4291c6ec52.patch
patch -p1 <46b452a5f07c74d47e91d124fa61b3d9a3267e2c.patch
patch -p1 <483576c33811b4b6034943f3ee5fef7c5b14077a.patch
cd ../..

cd packages/apps/Settings
wget https://github.com/Astridxx/android_packages_apps_Settings/commit/12c2570e75373fd903e2691e4f08a283c3681ce9.patch
wget https://github.com/Astridxx/android_packages_apps_Settings/commit/91baabb9eeb08e02486777704e8e5f3ec00e2523.patch
patch -p1 <12c2570e75373fd903e2691e4f08a283c3681ce9.patch
patch -p1 <91baabb9eeb08e02486777704e8e5f3ec00e2523.patch
cd ../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
