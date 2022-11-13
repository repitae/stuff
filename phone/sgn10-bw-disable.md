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

pm disable-user --user 0 com.android.bips # Default Print Service
pm disable-user --user 0 com.android.bookmarkprovider # Bookmark Provider
pm disable-user --user 0 com.android.cellbroadcastreceiver # Wireless Emergency Alerts 
pm disable-user --user 0 com.android.cts.priv.ctsshim # Compatibility Test Suite
pm disable-user --user 0 com.android.egg # Android S Easter Egg
pm disable-user --user 0 com.android.printspooler # Print Spooler
pm disable-user --user 0 com.android.providers.partnerbookmarks # Partners Bookmarks
pm disable-user --user 0 com.android.stk # SIM Toolkit
pm disable-user --user 0 com.android.traceur # System Tracing
pm disable-user --user 0 com.android.wallpaper.livepicker # Live Wallpaper Picker
pm disable-user --user 0 com.facebook.appmanager # Facebook App Manager
pm disable-user --user 0 com.facebook.services # Facebook Services
pm disable-user --user 0 com.facebook.system # Facebook App Installer
pm disable-user --user 0 com.google.android.apps.photos # Google Photos
pm disable-user --user 0 com.google.android.apps.tachyon # Google Meet
pm disable-user --user 0 com.google.android.feedback # Market Feedback Agent
pm disable-user --user 0 com.google.android.googlequicksearchbox # Google Search Box
pm disable-user --user 0 com.google.android.partnersetup # Google Partner Setup
pm disable-user --user 0 com.google.android.printservice.recommendation # Print Service Recommendation Service
pm disable-user --user 0 com.google.android.projection.gearhead # Android Auto
pm disable-user --user 0 com.google.android.videos # Google TV
pm disable-user --user 0 com.google.android.youtube # YouTube
pm disable-user --user 0 com.microsoft.skydrive # OneDrive
pm disable-user --user 0 com.netflix.partner.activation # Partner Netflix Activation
pm disable-user --user 0 com.samsung.android.app.spage # Samsung Free
pm disable-user --user 0 com.samsung.android.arzone # AR Zone
pm disable-user --user 0 com.samsung.android.beaconmanager # Nearby Device Scanning
pm disable-user --user 0 com.samsung.android.bixby.service # Bixby Dictation
pm disable-user --user 0 com.samsung.android.bixby.wakeup # Voice Wakeup
pm disable-user --user 0 com.samsung.android.game.gametools # Game Booster
pm disable-user --user 0 com.samsung.android.kidsinstaller # Samsung Kids Installer
pm disable-user --user 0 com.samsung.android.mateagent # Samsung Galaxy Friends
pm disable-user --user 0 com.samsung.android.networkstack.tethering.overlay
pm disable-user --user 0 com.samsung.android.scloud # Samsung Cloud
pm disable-user --user 0 com.samsung.android.visionintelligence # Bixby Vision
# pm disable-user --user 0 com.sec.android.app.samsungapps # Galaxy Store
pm disable-user --user 0 com.sec.android.daemonapp # Weather

exit
```
