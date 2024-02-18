#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=kuntao
VENDOR=lenovo

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        system_ext/lib64/com.qualcomm.qti.imscmservice@1.0.so|system_ext/lib64/com.qualcomm.qti.imscmservice@2.0.so|system_ext/lib64/com.qualcomm.qti.imscmservice@2.1.so)
           "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
        system_ext/lib64/libdpmframework.so)
            grep -q "libcutils_shim.so" "${2}" || "${PATCHELF}" --add-needed "libcutils_shim.so" "${2}"
            ;;
        system_ext/lib64/lib-imscamera.so)
            grep -q "libgui_shim.so" "${2}" || "${PATCHELF}" --add-needed "libgui_shim.so" "${2}"
            ;;
        system_ext/lib64/lib-imsvideocodec.so)
            grep -q "libui_shim.so" "${2}" || "${PATCHELF}" --add-needed "libui_shim.so" "${2}"
            ;;
        system_ext/lib64/lib-imsvt.so)
           "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            grep -q "libgui_shim.so" "${2}" || "${PATCHELF}" --add-needed "libgui_shim.so" "${2}"
            ;;
        vendor/bin/hw/android.hardware.bluetooth@1.0-service-qti|vendor/bin/hw/vendor.display.color@1.0-service|vendor/bin/imsrcsd|vendor/bin/ATFWD-daemon|vendor/bin/ims_rtp_daemon|vendor/bin/cnd|vendor/bin/netmgrd)
            "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
        vendor/bin/imsdatadaemon)
            grep -q "libhidlbase-v32.so" "${2}" || "${PATCHELF}" --add-needed "libhidlbase-v32.so" "${2}"
            ;;
        vendor/bin/pm-service)
            grep -q "libutils-v33.so" "${2}" || "${PATCHELF}" --add-needed "libutils-v33.so" "${2}"
            ;;
        vendor/lib64/com.qualcomm.qti.ant@1.0.so|vendor/lib64/libril-qc-qmi-1.so)
           "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
        system_ext/etc/init/dpmd.rc)
            sed -i "s/\/system\/product\/bin\//\/system\/system_ext\/bin\//g" "${2}"
            ;;
        system_ext/etc/permissions/com.qti.dpmframework.xml)
            ;&
        system_ext/etc/permissions/dpmapi.xml)
            sed -i "s/\/system\/product\/framework\//\/system\/system_ext\/framework\//g" "${2}"
            ;;
        system_ext/etc/permissions/qcrilhook.xml)
            sed -i "s/\/system\/framework\//\/system\/system_ext\/framework\//g" "${2}"
            ;;
        vendor/bin/mm-qcamera-daemon)
            ;&
        vendor/lib/libmmcamera2_cpp_module.so)
            ;&
        vendor/lib/libmmcamera2_cpp_module.so)
            ;&
        vendor/lib/libmmcamera2_dcrf.so)
            ;&
        vendor/lib/libmmcamera2_iface_modules.so)
            ;&
        vendor/lib/libmmcamera2_imglib_modules.so)
            ;&
        vendor/lib/libmmcamera2_mct.so)
            ;&
        vendor/lib/libmmcamera2_pproc_modules.so)
            ;&
        vendor/lib/libmmcamera2_stats_algorithm.so)
            ;&
        vendor/lib/libmmcamera_imglib.so)
            ;&
        vendor/lib/libmmcamera_pdaf.so)
            ;&
        vendor/lib/libmmcamera_pdafcamif.so)
            ;&
        vendor/lib/libmmcamera_tintless_algo.so)
            ;&
        vendor/lib/libmmcamera_tintless_bg_pca_algo.so)
            sed -i 's|/data/misc/camera|/data/vendor/qcam|g' "${2}"
            ;;
        vendor/lib/libmmcamera2_sensor_modules.so)
            sed -i 's|/system/etc/camera|/vendor/etc/camera|g' "${2}"
            sed -i 's|/data/misc/camera|/data/vendor/qcam|g' "${2}"
            ;;
        vendor/lib/libmmcamera2_stats_modules.so)
            sed -i 's|/data/misc/camera|/data/vendor/qcam|g' "${2}"
            sed -i 's|libandroid.so|libcamshim.so|g' "${2}"
            "${PATCHELF}" --replace-needed "libgui.so" "libgui_vendor.so" "${2}"
            ;;
        vendor/lib/libmmcamera_dbg.so)
            sed -i 's|persist.camera.debug.logfile|persist.vendor.camera.dbglog|g' "${2}"
            sed -i 's|/data/misc/camera|/data/vendor/qcam|g' "${2}"
            ;;
         vendor/lib/libchromaflash.so|vendor/lib/libmmcamera_hdr_gb_lib.so|vendor/lib/libtrueportrait.so|vendor/lib/libts_detected_face_hal.so|vendor/lib/libts_face_beautify_hal.so|vendor/lib/liboptizoom.so|vendor/lib/libseemore.so|vendor/lib/libubifocus.so)
           "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
        vendor/bin/vfmService)
           "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;.so
         vendor/lib64/hw/fingerprint.msm8953|vendor/lib64/libvalAuth.so|vendor/lib64/libvcsfp.so|vendor/lib64/libvfmAuth.so|vendor/lib64/libvfmClient.so|)
           "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
        vendor/bin/smart_charger)
            grep -q "liblog.so" "${2}" || "${PATCHELF}" --add-needed "liblog.so" "${2}"
            ;;
        vendor/lib64/libsettings.so)
            "${PATCHELF}" --replace-needed "libprotobuf-cpp-full.so" "libprotobuf-cpp-full-v29.so" "${2}"
            ;;
        vendor/lib64/libwvhidl.so)
            "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v29.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
