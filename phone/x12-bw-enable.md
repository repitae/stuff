```sh
adb shell
pm list packages -s
pm list packages -d
pm list packages -u
pm list packages | grep 'samsung'
pm list packages | grep 'miui'
pm disable-user --user 0 
pm enable --user 0 
pm uninstall -k --user 0 
pm install-existing 
exit
```

```sh
adb shell

# pm enable --user 0 com.android.bips # Android Print Service
pm enable --user 0 com.android.bookmarkprovider # Android Bookmark Provider
pm enable --user 0 com.android.cellbroadcastreceiver # Android Cell Broadcast Receiver
pm enable --user 0 com.android.cts.priv.ctsshim # Android Compatibility Test Suite
pm enable --user 0 com.android.egg # Android S Easter Egg
pm enable --user 0 com.android.emergency # Emergency information
# pm enable --user 0 com.android.printspooler # Android Print Spooler
pm enable --user 0 com.android.providers.partnerbookmarks # Android Partner Bookmarks
pm enable --user 0 com.android.stk # Android Sim Card Menu
pm enable --user 0 com.android.traceur # Android System Trace
pm enable --user 0 com.android.wallpaper.livepicker # Android Wallpaper Picker
pm enable --user 0 com.facebook.appmanager # Facebook App Manager
pm enable --user 0 com.facebook.services # Facebook Services
pm enable --user 0 com.facebook.system # Facebook App Installer
pm enable --user 0 com.google.android.apps.photos # Google Photo
pm enable --user 0 com.google.android.apps.wellbeing # Google Wellbeing
pm enable --user 0 com.google.android.cellbroadcastreceiver # Google Cell Broadcast Receiver
pm enable --user 0 com.google.android.feedback # Google Feedback
pm enable --user 0 com.google.android.googlequicksearchbox # Google Quick Searchbox
pm enable --user 0 com.google.android.marvin.talkback # Google Talkback
pm enable --user 0 com.google.android.partnersetup # Google Partner Setup
pm enable --user 0 com.google.android.printservice.recommendation # Google Print Service Recommendation
pm enable --user 0 com.google.android.projection.gearhead # Google Auto 
pm enable --user 0 package:com.google.android.apps.subscriptions.red # Google One
pm enable --user 0 com.google.android.youtube # Google YouTube
pm enable --user 0 com.miui.analytics # MI Analytics
pm enable --user 0 com.miui.bugreport # Mi Bug Report 
# pm enable --user 0 com.miui.cleaner # Mi Cleaner 
pm enable --user 0 com.miui.daemon # MIUI Daemon 
pm enable --user 0 com.miui.miservice # Mi Service 
pm enable --user 0 com.miui.msa.global # MI MSA Global
pm enable --user 0 com.miui.phrase # MI Pharases
# pm enable --user 0 com.miui.player # Mi Music Player
# pm enable --user 0 com.miui.videoplayer # Mi Videoplayer 
pm enable --user 0 com.miui.yellowpage # Mi Yellow Page
pm enable --user 0 com.qualcomm.uimremoteclient # Qualcomm UIM Remote Client
pm enable --user 0 com.qualcomm.uimremoteserver # Qualcomm UIM Remote Server
pm enable --user 0 com.xiaomi.joyose # Mi Joyose
pm enable --user 0 com.xiaomi.midrop # Mi ShareMe
# pm enable --user 0 com.xiaomi.mipicks # Mi GetApps
pm enable --user 0 com.xiaomi.payment # Mi Payment 
pm enable --user 0 com.xiaomi.xmsfkeeper # MI Service Framework Keeper

exit
```
