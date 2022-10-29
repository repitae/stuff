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
# Android Bloatware on Samsung
adb shell pm enable com.android.bips # Default Printing Service
adb shell pm enable com.android.bookmarkprovider # Bookmark Provider
adb shell pm enable com.android.browser # Web Browser IllegalArgumentException
adb shell pm enable com.android.calendar # Calendar app IllegalArgumentException
adb shell pm enable com.android.cellbroadcastreceiver # Cell broadcasting
adb shell pm enable com.android.cellbroadcastreceiver.overlay.common
adb shell pm enable com.android.chrome # Chrome Browser
adb shell pm enable com.android.deskclock # Stock Clock app
adb shell pm enable com.android.dreams.basic # Screensaver app
adb shell pm enable com.android.dreams.phototable # Screensaver app
adb shell pm enable com.android.egg # Android Easter Egg
adb shell pm enable com.android.emergency # SOS Calling
adb shell pm enable com.android.hotwordenrollment.okgoogle # OK Google
adb shell pm enable com.android.mms # MMS app
adb shell pm enable com.android.mms.service # MMS
adb shell pm enable com.android.providers.partnerbookmarks # Bookmarks Provider
adb shell pm enable com.android.statementservice # Checks APK files
adb shell pm enable com.android.stk # SIM Tool-kit
adb shell pm enable com.android.vpndialogs # VPN Dialog
adb shell pm enable com.android.wallpaper.livepicker # Live wallpaper
adb shell pm enable com.android.wallpaperbackup # Wallpaper backup feature
adb shell pm enable com.android.wallpapercropper # Wallpaper cropping feature
adb shell pm enable com.sec.android.app.chromecustomizations

# Google Bloatware on Samsung
adb shell pm enable com.google.android.apps.docs # Google Docs
adb shell pm enable com.google.android.apps.maps # Google Maps
adb shell pm enable com.google.android.apps.photos # Google Photos
adb shell pm enable com.google.android.apps.tachyon # Google Duo
adb shell pm enable com.google.android.apps.wellbeing # Digital Wellbeing
adb shell pm enable com.google.android.feedback # Feedback app
adb shell pm enable com.google.android.gm # Gmail
adb shell pm enable com.google.android.googlequicksearchbox # Google Quick Search
adb shell pm enable com.google.android.inputmethod.latin # Gboard
adb shell pm enable com.google.android.marvin.talkback # Talkback feature
adb shell pm enable com.google.android.printservice.recommendation # Mobile Printing
adb shell pm enable com.google.android.syncadapters.calendar # Calendar Sync
adb shell pm enable com.google.android.tts # Text-to-speech
adb shell pm enable com.google.android.videos # Google Play Movies & TV
adb shell pm enable com.google.android.youtube # Youtube
adb shell pm enable com.google.ar.lens # AR Lens

# General Bloatware on Samsung
adb shell pm enable com.mobeam.barcodeService # Barcode scanner
adb shell pm enable com.samsung.android.app.aodservice # Always on Display
adb shell pm enable com.samsung.android.app.dressroom # Samsung Wallpapers
adb shell pm enable com.samsung.android.app.social # Whats New
adb shell pm enable com.samsung.android.app.watchmanagerstub # Galaxy Watch
adb shell pm enable com.samsung.android.ardrawing # AR Doodle
adb shell pm enable com.samsung.android.beaconmanager # User tracking app (sensitive)
adb shell pm enable com.samsung.android.da.daagent # Dual Messenger
adb shell pm enable com.samsung.android.drivelink.stub # Samsung Car Mode
adb shell pm enable com.samsung.android.email.provider # Samsung Email
adb shell pm enable com.samsung.android.mateagent # Galaxy Friends
adb shell pm enable com.samsung.android.messaging # Message app
adb shell pm enable com.samsung.android.net.wifi.wifiguider # WiFi Tips
adb shell pm enable com.samsung.android.oneconnect # Smart Things
adb shell pm enable com.samsung.android.scloud # Samsung Cloud
adb shell pm enable com.samsung.android.sdk.handwriting # Galaxy Note series bloat
adb shell pm enable com.samsung.android.sdk.professionalaudio.utility.jammonitor
adb shell pm enable com.samsung.android.service.aircommand # Air command (Note series bloat)
adb shell pm enable com.samsung.android.service.livedrawing # Live Message (Note series bloat)
adb shell pm enable com.samsung.android.svoiceime # Samsung Voice Input
adb shell pm enable com.samsung.android.universalswitch # Mobile Universal Switch
adb shell pm enable com.samsung.android.visioncloudagent # VisionCloudAgent
adb shell pm enable com.samsung.android.voc # Samsung Members
adb shell pm enable com.samsung.android.wellbeing # Digital wellbeing
adb shell pm enable com.samsung.android.widgetapp.yahooedge.finance # Finance widget
adb shell pm enable com.samsung.android.widgetapp.yahooedge.sport # Sports widget
adb shell pm enable com.samsung.app.highlightplayer # Samsung Story Video Editor
adb shell pm enable com.samsung.ecomm.global # Samsung Shop
adb shell pm enable com.samsung.hidden.china # China Hidden Menu (Chinese Spyware)
adb shell pm enable com.samsung.safetyinformation # Saftey Information
adb shell pm enable com.samsung.SMT # Samsung Speech-to-Text
adb shell pm enable com.samsung.storyservice # Samsung StoryService (Tracks device activity)
adb shell pm enable com.sec.android.app.dexonpc # Samsung Dex
adb shell pm enable com.sec.android.app.popupcalculator # Samsung Calculator
adb shell pm enable com.sec.android.app.sbrowser # Samsung Internet
adb shell pm enable com.sec.android.app.voicenote # Voice Recorder
adb shell pm enable com.sec.android.daemonapp # Samsung Weather
adb shell pm enable com.sec.android.easyMover.Agent # Samsung Smart Switch
adb shell pm enable com.sec.android.easyonehand # One hand mode
adb shell pm enable com.sec.android.splitsound # Samsung Split Sound Service
adb shell pm enable com.sec.android.widgetapp.samsungapps # Homescreen widget
adb shell pm enable com.wsomacp # Samsung Email
adb shell pm enable flipboard.boxer.app # Flipboard app

# Samsung Bixby
adb shell pm enable com.samsung.android.app.routines # Bixby Routines
adb shell pm enable com.samsung.android.app.spage # Bixby homepage launcher
adb shell pm enable com.samsung.android.bixby.agent # Bixby Voice
adb shell pm enable com.samsung.android.bixby.agent.dummy # Bixby debug app
adb shell pm enable com.samsung.android.bixby.service # Bixby features
adb shell pm enable com.samsung.android.bixby.wakeup
adb shell pm enable com.samsung.android.bixbyvision.framework # Bixby Vision
adb shell pm enable com.samsung.android.visionintelligence # Bixby Vision

# ANT Service
adb shell pm enable com.dsi.ant.plugins.antplus
adb shell pm enable com.dsi.ant.sample.acquirechannels
adb shell pm enable com.dsi.ant.service.socket

# Samsung PayPass
adb shell pm enable com.samsung.android.authfw # Samsung Authentication
adb shell pm enable com.samsung.android.samsungpass # Samsung Pass
adb shell pm enable com.samsung.android.samsungpassautofill # Samsung Auto fill
adb shell pm enable com.samsung.android.spay # Samsung Pay (sensitive)
adb shell pm enable com.samsung.android.spayfw # Samsung Pay Framework (sensitive)

# Samsung AREmoji
adb shell pm enable com.samsung.android.aremoji # AR Emoji
adb shell pm enable com.samsung.android.emojiupdater # Emoji updater
adb shell pm enable com.sec.android.mimage.avatarstickers # Stickers for AR Emoji app

# Samsung StickerCenter
adb shell pm enable com.samsung.android.app.camera.sticker.facear.preload
adb shell pm enable com.samsung.android.app.camera.sticker.facearexpression.preload
adb shell pm enable com.samsung.android.app.camera.sticker.facearframe.preload
adb shell pm enable com.samsung.android.app.camera.sticker.stamp.preload
adb shell pm enable com.samsung.android.stickercenter
pm enable com.samsung.android.stickerplugin

# Samsung Game
pm enable com.samsung.android.game.gamehome
pm enable com.samsung.android.game.gametools
pm enable com.samsung.android.gametuner.thin
pm enable com.samsung.android.game.gos
pm enable com.enhance.gameservice

# Samsung Gear
pm enable com.google.vr.vrcore
pm enable com.samsung.android.app.vrsetupwizardstub
pm enable com.samsung.android.hmt.vrshell
pm enable com.samsung.android.hmt.vrsvc

# Samsung Kids
pm enable com.samsung.android.app.camera.sticker.facearavatar.preload # Camera stickers
pm enable com.samsung.android.kidsinstaller # Kids Installer
pm enable com.sec.android.app.kidshome # Kids launcher

# Samsung Led
pm enable com.samsung.android.app.ledbackcover
pm enable com.sec.android.cover.ledcover

# Edge Display
pm enable com.cnn.mobile.android.phone.edgepanel # Edge panel
pm enable com.samsung.android.app.appsedge # App panel plugin for Edge display
pm enable com.samsung.android.app.sbrowseredge # Edge panel plugin for Samsung Internet
pm enable com.samsung.android.service.peoplestripe # Edge panel plugin for contacts

# Samsung Dex
pm enable com.samsung.desktopsystemui
pm enable com.sec.android.app.desktoplauncher
pm enable com.sec.android.desktopmode.uiservice

# Miscellaneous Samsung Bloatware
pm enable com.android.documentsui
pm enable com.google.android.dialer
pm enable com.greatbigstory.greatbigstory
pm enable com.linkedin.android
pm enable com.microsoft.skydrive
pm enable com.pandora.android
pm enable com.samsung.android.app.contacts
pm enable com.samsung.android.calendar
pm enable com.samsung.android.service.livedrawing

# Facebook
pm enable com.facebook.appmanager
pm enable com.facebook.katana
pm enable com.facebook.services
pm enable com.facebook.system
```
