#!/bin/bash
#
# Copyright (C) 2021 Arjun Ingole
#

read -p "Please Input Tag/Branch to Merge: " TAG

# Merge
echo "Starting Merging"
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $TAG && git merge -X subtree=drivers/staging/qcacld-3.0 FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/fw-api $TAG && git merge -X subtree=drivers/staging/fw-api FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $TAG && git merge -X subtree=drivers/staging/qca-wifi-host-cmn FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/opensource/audio-kernel $TAG && git merge -X subtree=techpack/audio FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/kernel/msm-4.14 $TAG && git merge FETCH_HEAD

echo "Merge Was Successful"
