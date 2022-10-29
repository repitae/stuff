```sh
adb shell
pm list packages -s
pm list packages -d
pm list packages -u
pm list packages | grep 'samsung'
pm list packages | grep 'miui'
pm disable-user --user 0 
pm enable 
pm uninstall -k --user 0 
pm install-existing 
exit
```

```sh
adb shell

# pm enable com.android.bips # Android Print Service
pm enable com.android.bookmarkprovider # Android Bookmark Provider
pm enable com.android.cellbroadcastreceiver # Android Cell Broadcast Receiver
pm enable com.android.cts.priv.ctsshim # Android Compatibility Test Suite
pm enable com.android.egg # Android S Easter Egg
pm enable com.android.emergency # Emergency information
# pm enable com.android.printspooler # Android Print Spooler
pm enable com.android.providers.partnerbookmarks # Android Partner Bookmarks
pm enable com.android.stk # Android Sim Card Menu
pm enable com.android.traceur # Android System Trace
pm enable com.android.wallpaper.livepicker # Android Wallpaper Picker
pm enable com.facebook.appmanager # Facebook App Manager
pm enable com.facebook.services # Facebook Services
pm enable com.facebook.system # Facebook App Installer
pm enable com.google.android.apps.photos # Google Photo
pm enable com.google.android.apps.wellbeing # Google Wellbeing
pm enable com.google.android.cellbroadcastreceiver # Google Cell Broadcast Receiver
pm enable com.google.android.feedback # Google Feedback
pm enable com.google.android.googlequicksearchbox # Google Quick Searchbox
pm enable com.google.android.marvin.talkback # Google Talkback
pm enable com.google.android.partnersetup # Google Partner Setup
pm enable com.google.android.printservice.recommendation # Google Print Service Recommendation
pm enable com.google.android.projection.gearhead # Google Auto 
pm enable package:com.google.android.apps.subscriptions.red # Google One
pm enable com.google.android.youtube # Google YouTube
pm enable com.miui.analytics # MI Analytics
pm enable com.miui.bugreport # Mi Bug Report 
# pm enable com.miui.cleaner # Mi Cleaner 
pm enable com.miui.daemon # MIUI Daemon 
pm enable com.miui.miservice # Mi Service 
pm enable com.miui.msa.global # MI MSA Global
pm enable com.miui.phrase # MI Pharases
# pm enable com.miui.player # Mi Music Player
# pm enable com.miui.videoplayer # Mi Videoplayer 
pm enable com.miui.yellowpage # Mi Yellow Page
pm enable com.qualcomm.uimremoteclient # Qualcomm UIM Remote Client
pm enable com.qualcomm.uimremoteserver # Qualcomm UIM Remote Server
pm enable com.xiaomi.joyose # Mi Joyose
pm enable com.xiaomi.midrop # Mi ShareMe
# pm enable com.xiaomi.mipicks # Mi GetApps
pm enable com.xiaomi.payment # Mi Payment 
pm enable com.xiaomi.xmsfkeeper # MI Service Framework Keeper

exit
```
