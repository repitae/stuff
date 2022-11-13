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

pm enable --user 0 com.android.bips # Default Print Service
pm enable --user 0 com.android.bookmarkprovider # Bookmark Provider
pm enable --user 0 com.android.cellbroadcastreceiver # Wireless Emergency Alerts 
pm enable --user 0 com.android.cts.priv.ctsshim # Compatibility Test Suite
pm enable --user 0 com.android.egg # Android S Easter Egg
pm enable --user 0 com.android.printspooler # Print Spooler
pm enable --user 0 com.android.providers.partnerbookmarks # Partners Bookmarks
pm enable --user 0 com.android.stk # SIM Toolkit
pm enable --user 0 com.android.traceur # System Tracing
pm enable --user 0 com.android.wallpaper.livepicker # Live Wallpaper Picker
pm enable --user 0 com.facebook.appmanager # Facebook App Manager
pm enable --user 0 com.facebook.services # Facebook Services
pm enable --user 0 com.facebook.system # Facebook App Installer
pm enable --user 0 com.google.android.apps.photos # Google Photos
pm enable --user 0 com.google.android.apps.tachyon # Google Meet
pm enable --user 0 com.google.android.feedback # Market Feedback Agent
pm enable --user 0 com.google.android.googlequicksearchbox # Google Search Box
pm enable --user 0 com.google.android.partnersetup # Google Partner Setup
pm enable --user 0 com.google.android.printservice.recommendation # Print Service Recommendation Service
pm enable --user 0 com.google.android.projection.gearhead # Android Auto
pm enable --user 0 com.google.android.videos # Google TV
pm enable --user 0 com.google.android.youtube # YouTube
pm enable --user 0 com.microsoft.skydrive # OneDrive
pm enable --user 0 com.netflix.partner.activation # Partner Netflix Activation
pm enable --user 0 com.samsung.android.app.spage # Samsung Free
pm enable --user 0 com.samsung.android.arzone # AR Zone
pm enable --user 0 com.samsung.android.beaconmanager # Nearby Device Scanning
pm enable --user 0 com.samsung.android.bixby.service # Bixby Dictation
pm enable --user 0 com.samsung.android.bixby.wakeup # Voice Wakeup
pm enable --user 0 com.samsung.android.game.gametools # Game Booster
pm enable --user 0 com.samsung.android.kidsinstaller # Samsung Kids Installer
pm enable --user 0 com.samsung.android.mateagent # Samsung Galaxy Friends
pm enable --user 0 com.samsung.android.networkstack.tethering.overlay
pm enable --user 0 com.samsung.android.scloud # Samsung Cloud
pm enable --user 0 com.samsung.android.visionintelligence # Bixby Vision
# pm enable --user 0 com.sec.android.app.samsungapps # Galaxy Store
pm enable --user 0 com.sec.android.daemonapp # Weather

exit
```
