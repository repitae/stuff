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
# adb shell pm enable com.android.bips # Android Print Service
adb shell pm enable com.android.bookmarkprovider # Android Bookmark Provider
adb shell pm enable com.android.cellbroadcastreceiver # Android Cell Broadcast Receiver
adb shell pm enable com.android.cts.priv.ctsshim # Android Compatibility Test Suite
adb shell pm enable com.android.egg # Android S Easter Egg
adb shell pm enable com.android.emergency # Emergency information
# adb shell pm enable com.android.printspooler # Android Print Spooler
adb shell pm enable com.android.providers.partnerbookmarks # Android Partner Bookmarks
adb shell pm enable com.android.stk # Android Sim Card Menu
adb shell pm enable com.android.traceur # Android System Trace
adb shell pm enable com.android.wallpaper.livepicker # Android Wallpaper Picker
adb shell pm enable com.facebook.appmanager # Facebook App Manager
adb shell pm enable com.facebook.services # Facebook Services
adb shell pm enable com.facebook.system # Facebook App Installer
adb shell pm enable com.google.android.apps.photos # Google Photo
adb shell pm enable com.google.android.apps.wellbeing # Google Wellbeing
adb shell pm enable com.google.android.cellbroadcastreceiver # Google Cell Broadcast Receiver
adb shell pm enable com.google.android.feedback # Google Feedback
adb shell pm enable com.google.android.googlequicksearchbox # Google Quick Searchbox
adb shell pm enable com.google.android.marvin.talkback # Google Talkback
adb shell pm enable com.google.android.partnersetup # Google Partner Setup
adb shell pm enable com.google.android.printservice.recommendation # Google Print Service Recommendation
adb shell pm enable com.google.android.projection.gearhead # Google Auto 
adb shell pm enable com.google.android.youtube # Google YouTube
adb shell pm enable com.miui.analytics # MI Analytics
adb shell pm enable com.miui.bugreport # Mi Bug Report 
# adb shell pm enable com.miui.cleaner # Mi Cleaner 
adb shell pm enable com.miui.daemon # MIUI Daemon 
adb shell pm enable com.miui.miservice # Mi Service 
adb shell pm enable com.miui.msa.global # MI MSA Global
adb shell pm enable com.miui.phrase # MI Pharases
# adb shell pm enable com.miui.player # Mi Music Player
# adb shell pm enable com.miui.videoplayer # Mi Videoplayer 
adb shell pm enable com.miui.yellowpage # Mi Yellow Page
adb shell pm enable com.qualcomm.uimremoteclient # Qualcomm UIM Remote Client
adb shell pm enable com.qualcomm.uimremoteserver # Qualcomm UIM Remote Server
adb shell pm enable com.xiaomi.joyose # Mi Joyose
adb shell pm enable com.xiaomi.midrop # Mi ShareMe
# adb shell pm enable com.xiaomi.mipicks # Mi GetApps
adb shell pm enable com.xiaomi.payment # Mi Payment 
adb shell pm enable com.xiaomi.xmsfkeeper # MI Service Framework Keeper
```