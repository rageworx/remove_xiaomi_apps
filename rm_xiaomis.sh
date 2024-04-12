#!/bin/bash

# Set your platform-tool path with "adb".
#ADB="platform-tools/adb"
#ADB="/opt/homebrew/bin/adb"
ADB=`which adb`

if [ ! -e ${ADB} ];then
    echo "Error, ${ADB} not existed."
    exit 0
fi

# Test device listed ?
testadb=`${ADB} devices`
devlists=(${testadb})

if [ "${devlists[4]}" == "" ];then
    echo "Error, no device found."
    exit 0
fi

uninstall_items=(
com.android.browser
com.android.chrome
com.android.wallpaper.livepicker
com.android.hotwordenrollment.okgoogle
com.android.hotwordenrollment.xgoogle
com.google.android.apps.googleassistant
com.google.android.googlequicksearchbox
com.google.android.onetimeinitializer
com.google.android.apps.tachyon
com.google.android.feedback
com.google.android.music
com.google.android.videos
com.google.android.apps.subscriptions.red
com.google.android.apps.podcasts
com.google.android.apps.magazines
com.miui.analytics
com.miui.bugreport
com.miui.cloudbackup
com.miui.cloudservice
com.miui.daemon
com.miui.hybrid
com.miui.msa.global
com.miui.player
com.miui.userguide
com.miui.videoplayer
com.miui.yellowpage
com.miui.android.fashiongallery
com.xiaomi.glgm
com.xiaomi.joyose
com.xiaomi.mipicks
com.xiaomi.payment
com.xiaomi.simactivate.service
com.xiaomi.micloud.sdk
com.mi.android.globalminusscreen
com.mi.android.globalpersonalassistant
com.mi.globalbrowser
com.mi.dlabs.vr
com.mi.global.bbs
com.mi.global.shop
com.mipay.wallet.in
com.micredit.in
com.mipay.wallet.id
com.miui.miservice
com.xiaomi.mirecycle
com.facebook.appmanager
com.facebook.services
com.facebook.system
com.facebook.katana
com.swiftkey.languageprovider
com.swiftkey.swiftkeyconfigurator
com.cmcm.indianews_for_oem
com.dsi.ant.server
com.newsdog
com.touchtype.swiftkey
com.tencent.soter.soterserver
com.amazon.mShop.android.shopping
com.netflix.mediaclient
com.spotify.music
com.tencent.igxiaomi
org.ifaa.aidl.manager
)

for item in ${uninstall_items[@]}
do
    echo "Removing package [$item] ... "
    ${ADB} shell pm uninstall $item > /dev/null
    ${ADB} shell pm uninstall --user 0 $item > /dev/null
done
