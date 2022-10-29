```sh
adb shell pm list packages -s
adb shell pm list packages -d
adb shell pm list packages -u
adb shell pm list packages | grep 'samsung'
adb shell pm list packages | grep 'miui'
adb shell pm disable-user --user 0 
adb shell pm enable 
adb shell pm uninstall -k --user 0 
adb shell pm install-existing 
```

```sh
# adb shell pm disable-user --user 0 com.android.bips # Android Print Service
adb shell pm disable-user --user 0 com.android.bookmarkprovider # Android Bookmark Provider
adb shell pm disable-user --user 0 com.android.cellbroadcastreceiver # Android Cell Broadcast Receiver
adb shell pm disable-user --user 0 com.android.cts.priv.ctsshim # Android Compatibility Test Suite
adb shell pm disable-user --user 0 com.android.egg # Android S Easter Egg
adb shell pm disable-user --user 0 com.android.emergency # Emergency information
# adb shell pm disable-user --user 0 com.android.printspooler # Android Print Spooler
adb shell pm disable-user --user 0 com.android.providers.partnerbookmarks # Android Partner Bookmarks
adb shell pm disable-user --user 0 com.android.stk # Android Sim Card Menu
adb shell pm disable-user --user 0 com.android.traceur # Android System Trace
adb shell pm disable-user --user 0 com.android.wallpaper.livepicker # Android Wallpaper Picker
adb shell pm disable-user --user 0 com.facebook.appmanager # Facebook App Manager
adb shell pm disable-user --user 0 com.facebook.services # Facebook Services
adb shell pm disable-user --user 0 com.facebook.system # Facebook App Installer
adb shell pm disable-user --user 0 com.google.android.apps.photos # Google Photo
adb shell pm disable-user --user 0 com.google.android.apps.wellbeing # Google Wellbeing
adb shell pm disable-user --user 0 com.google.android.cellbroadcastreceiver # Google Cell Broadcast Receiver
adb shell pm disable-user --user 0 com.google.android.feedback # Google Feedback
adb shell pm disable-user --user 0 com.google.android.googlequicksearchbox # Google Quick Searchbox
adb shell pm disable-user --user 0 com.google.android.marvin.talkback # Google Talkback
adb shell pm disable-user --user 0 com.google.android.partnersetup # Google Partner Setup
adb shell pm disable-user --user 0 com.google.android.printservice.recommendation # Google Print Service Recommendation
adb shell pm disable-user --user 0 com.google.android.projection.gearhead # Google Auto 
adb shell pm disable-user --user 0 com.google.android.youtube # Google YouTube
adb shell pm disable-user --user 0 com.miui.analytics # MI Analytics
adb shell pm disable-user --user 0 com.miui.bugreport # Mi Bug Report 
# adb shell pm disable-user --user 0 com.miui.cleaner # Mi Cleaner 
adb shell pm disable-user --user 0 com.miui.daemon # MIUI Daemon 
adb shell pm disable-user --user 0 com.miui.miservice # Mi Service 
adb shell pm disable-user --user 0 com.miui.msa.global # MI MSA Global
adb shell pm disable-user --user 0 com.miui.phrase # MI Pharases
# adb shell pm disable-user --user 0 com.miui.player # Mi Music Player
# adb shell pm disable-user --user 0 com.miui.videoplayer # Mi Videoplayer 
adb shell pm disable-user --user 0 com.miui.yellowpage # Mi Yellow Page
adb shell pm disable-user --user 0 com.qualcomm.uimremoteclient # Qualcomm UIM Remote Client
adb shell pm disable-user --user 0 com.qualcomm.uimremoteserver # Qualcomm UIM Remote Server
adb shell pm disable-user --user 0 com.xiaomi.joyose # Mi Joyose
adb shell pm disable-user --user 0 com.xiaomi.midrop # Mi ShareMe
# adb shell pm disable-user --user 0 com.xiaomi.mipicks # Mi GetApps
adb shell pm disable-user --user 0 com.xiaomi.payment # Mi Payment 
adb shell pm disable-user --user 0 com.xiaomi.xmsfkeeper # MI Service Framework Keeper
```