#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
# Copyright (C) 2023 PhoenixAOSP
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=redfin
VENDOR=google_devices

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

PHOENIX_ROOT="$MY_DIR"/../../..

HELPER="$PHOENIX_ROOT"/vendor/phoenix/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${PHOENIX_ROOT}"

# Warning headers and guards
write_headers

write_makefiles "${MY_DIR}/proprietary-files.txt" true
write_makefiles "${MY_DIR}/proprietary-files-vendor.txt" true

# Finish
write_footers
