```sh
adb shell
pm list packages -s
pm list packages -d
pm list packages -u
list packages | grep 'samsung'
pm list packages | grep 'miui'
pm disable-user --user 0 
pm enable 
pm uninstall -k --user 0 
pm install-existing 
exit
```

```sh
adb shell
# pm disable-user --user 0 com.android.bips # Android Print Service
pm disable-user --user 0 com.android.bookmarkprovider # Android Bookmark Provider
pm disable-user --user 0 com.android.cellbroadcastreceiver # Android Cell Broadcast Receiver
pm disable-user --user 0 com.android.cts.priv.ctsshim # Android Compatibility Test Suite
pm disable-user --user 0 com.android.egg # Android S Easter Egg
pm disable-user --user 0 com.android.emergency # Emergency information
# pm disable-user --user 0 com.android.printspooler # Android Print Spooler
pm disable-user --user 0 com.android.providers.partnerbookmarks # Android Partner Bookmarks
pm disable-user --user 0 com.android.stk # Android Sim Card Menu
pm disable-user --user 0 com.android.traceur # Android System Trace
pm disable-user --user 0 com.android.wallpaper.livepicker # Android Wallpaper Picker
pm disable-user --user 0 com.facebook.appmanager # Facebook App Manager
pm disable-user --user 0 com.facebook.services # Facebook Services
pm disable-user --user 0 com.facebook.system # Facebook App Installer
pm disable-user --user 0 com.google.android.apps.photos # Google Photo
pm disable-user --user 0 com.google.android.apps.wellbeing # Google Wellbeing
pm disable-user --user 0 com.google.android.cellbroadcastreceiver # Google Cell Broadcast Receiver
pm disable-user --user 0 com.google.android.feedback # Google Feedback
pm disable-user --user 0 com.google.android.googlequicksearchbox # Google Quick Searchbox
pm disable-user --user 0 com.google.android.marvin.talkback # Google Talkback
pm disable-user --user 0 com.google.android.partnersetup # Google Partner Setup
pm disable-user --user 0 com.google.android.printservice.recommendation # Google Print Service Recommendation
pm disable-user --user 0 com.google.android.projection.gearhead # Google Auto 
pm disable-user --user 0 com.google.android.apps.subscriptions.red # Google One
pm disable-user --user 0 com.google.android.youtube # Google YouTube
pm disable-user --user 0 com.miui.analytics # MI Analytics
pm disable-user --user 0 com.miui.bugreport # Mi Bug Report 
# pm disable-user --user 0 com.miui.cleaner # Mi Cleaner 
pm disable-user --user 0 com.miui.daemon # MIUI Daemon 
pm disable-user --user 0 com.miui.miservice # Mi Service 
pm disable-user --user 0 com.miui.msa.global # MI MSA Global
pm disable-user --user 0 com.miui.phrase # MI Pharases
# pm disable-user --user 0 com.miui.player # Mi Music Player
# pm disable-user --user 0 com.miui.videoplayer # Mi Videoplayer 
pm disable-user --user 0 com.miui.yellowpage # Mi Yellow Page
pm disable-user --user 0 com.qualcomm.uimremoteclient # Qualcomm UIM Remote Client
pm disable-user --user 0 com.qualcomm.uimremoteserver # Qualcomm UIM Remote Server
pm disable-user --user 0 com.xiaomi.joyose # Mi Joyose
pm disable-user --user 0 com.xiaomi.midrop # Mi ShareMe
# pm disable-user --user 0 com.xiaomi.mipicks # Mi GetApps
pm disable-user --user 0 com.xiaomi.payment # Mi Payment 
pm disable-user --user 0 com.xiaomi.xmsfkeeper # MI Service Framework Keeper
exit
```