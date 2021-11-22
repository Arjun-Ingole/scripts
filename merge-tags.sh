#!/bin/bash
#
# Copyright (C) 2021 Arjun Ingole
#

read -p "Please Input Tag/Branch to Merge: " TAG
read -p "Please Enter your kernel version followed by Patch level eg (4.14, 4.19) : " VERSION

# Merge
echo "<===========< Starting To Merge >===========>"
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $TAG && git merge -X subtree=drivers/staging/qcacld-3.0 FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/fw-api $TAG && git merge -X subtree=drivers/staging/fw-api FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $TAG && git merge -X subtree=drivers/staging/qca-wifi-host-cmn FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/platform/vendor/opensource/audio-kernel $TAG && git merge -X subtree=techpack/audio FETCH_HEAD
      git fetch https://source.codeaurora.org/quic/la/kernel/msm-$VERSION $TAG && git merge FETCH_HEAD

echo "Merge Was Successful"
