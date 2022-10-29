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

# Android Bloatware on Samsung
pm enable --user 0 com.android.bips # Default Printing Service
pm enable --user 0 com.android.bookmarkprovider # Bookmark Provider
pm enable --user 0 com.android.browser # Web Browser IllegalArgumentException
pm enable --user 0 com.android.calendar # Calendar app IllegalArgumentException
pm enable --user 0 com.android.cellbroadcastreceiver # Cell broadcasting
pm enable --user 0 com.android.cellbroadcastreceiver.overlay.common
pm enable --user 0 com.android.chrome # Chrome Browser
pm enable --user 0 com.android.deskclock # Stock Clock app
pm enable --user 0 com.android.dreams.basic # Screensaver app
pm enable --user 0 com.android.dreams.phototable # Screensaver app
pm enable --user 0 com.android.egg # Android Easter Egg
pm enable --user 0 com.android.emergency # SOS Calling
pm enable --user 0 com.android.hotwordenrollment.okgoogle # OK Google
pm enable --user 0 com.android.mms # MMS app
pm enable --user 0 com.android.mms.service # MMS
pm enable --user 0 com.android.providers.partnerbookmarks # Bookmarks Provider
pm enable --user 0 com.android.statementservice # Checks APK files
pm enable --user 0 com.android.stk # SIM Tool-kit
pm enable --user 0 com.android.vpndialogs # VPN Dialog
pm enable --user 0 com.android.wallpaper.livepicker # Live wallpaper
pm enable --user 0 com.android.wallpaperbackup # Wallpaper backup feature
pm enable --user 0 com.android.wallpapercropper # Wallpaper cropping feature
pm enable --user 0 com.sec.android.app.chromecustomizations

# Google Bloatware on Samsung
pm enable --user 0 com.google.android.apps.docs # Google Docs
pm enable --user 0 com.google.android.apps.maps # Google Maps
pm enable --user 0 com.google.android.apps.photos # Google Photos
pm enable --user 0 com.google.android.apps.tachyon # Google Duo
pm enable --user 0 com.google.android.apps.wellbeing # Digital Wellbeing
pm enable --user 0 com.google.android.feedback # Feedback app
pm enable --user 0 com.google.android.gm # Gmail
pm enable --user 0 com.google.android.googlequicksearchbox # Google Quick Search
pm enable --user 0 com.google.android.inputmethod.latin # Gboard
pm enable --user 0 com.google.android.marvin.talkback # Talkback feature
pm enable --user 0 com.google.android.printservice.recommendation # Mobile Printing
pm enable --user 0 com.google.android.syncadapters.calendar # Calendar Sync
pm enable --user 0 com.google.android.tts # Text-to-speech
pm enable --user 0 com.google.android.videos # Google Play Movies & TV
pm enable --user 0 com.google.android.youtube # Youtube
pm enable --user 0 com.google.ar.lens # AR Lens

# General Bloatware on Samsung
pm enable --user 0 com.mobeam.barcodeService # Barcode scanner
pm enable --user 0 com.samsung.android.app.aodservice # Always on Display
pm enable --user 0 com.samsung.android.app.dressroom # Samsung Wallpapers
pm enable --user 0 com.samsung.android.app.social # Whats New
pm enable --user 0 com.samsung.android.app.watchmanagerstub # Galaxy Watch
pm enable --user 0 com.samsung.android.ardrawing # AR Doodle
pm enable --user 0 com.samsung.android.beaconmanager # User tracking app (sensitive)
pm enable --user 0 com.samsung.android.da.daagent # Dual Messenger
pm enable --user 0 com.samsung.android.drivelink.stub # Samsung Car Mode
pm enable --user 0 com.samsung.android.email.provider # Samsung Email
pm enable --user 0 com.samsung.android.mateagent # Galaxy Friends
pm enable --user 0 com.samsung.android.messaging # Message app
pm enable --user 0 com.samsung.android.net.wifi.wifiguider # WiFi Tips
pm enable --user 0 com.samsung.android.oneconnect # Smart Things
pm enable --user 0 com.samsung.android.scloud # Samsung Cloud
pm enable --user 0 com.samsung.android.sdk.handwriting # Galaxy Note series bloat
pm enable --user 0 com.samsung.android.sdk.professionalaudio.utility.jammonitor
pm enable --user 0 com.samsung.android.service.aircommand # Air command (Note series bloat)
pm enable --user 0 com.samsung.android.service.livedrawing # Live Message (Note series bloat)
pm enable --user 0 com.samsung.android.svoiceime # Samsung Voice Input
pm enable --user 0 com.samsung.android.universalswitch # Mobile Universal Switch
pm enable --user 0 com.samsung.android.visioncloudagent # VisionCloudAgent
pm enable --user 0 com.samsung.android.voc # Samsung Members
pm enable --user 0 com.samsung.android.wellbeing # Digital wellbeing
pm enable --user 0 com.samsung.android.widgetapp.yahooedge.finance # Finance widget
pm enable --user 0 com.samsung.android.widgetapp.yahooedge.sport # Sports widget
pm enable --user 0 com.samsung.app.highlightplayer # Samsung Story Video Editor
pm enable --user 0 com.samsung.ecomm.global # Samsung Shop
pm enable --user 0 com.samsung.hidden.china # China Hidden Menu (Chinese Spyware)
pm enable --user 0 com.samsung.safetyinformation # Saftey Information
pm enable --user 0 com.samsung.SMT # Samsung Speech-to-Text
pm enable --user 0 com.samsung.storyservice # Samsung StoryService (Tracks device activity)
pm enable --user 0 com.sec.android.app.dexonpc # Samsung Dex
pm enable --user 0 com.sec.android.app.popupcalculator # Samsung Calculator
pm enable --user 0 com.sec.android.app.sbrowser # Samsung Internet
pm enable --user 0 com.sec.android.app.voicenote # Voice Recorder
pm enable --user 0 com.sec.android.daemonapp # Samsung Weather
pm enable --user 0 com.sec.android.easyMover.Agent # Samsung Smart Switch
pm enable --user 0 com.sec.android.easyonehand # One hand mode
pm enable --user 0 com.sec.android.splitsound # Samsung Split Sound Service
pm enable --user 0 com.sec.android.widgetapp.samsungapps # Homescreen widget
pm enable --user 0 com.wsomacp # Samsung Email
pm enable --user 0 flipboard.boxer.app # Flipboard app

# Samsung Bixby
pm enable --user 0 com.samsung.android.app.routines # Bixby Routines
pm enable --user 0 com.samsung.android.app.spage # Bixby homepage launcher
pm enable --user 0 com.samsung.android.bixby.agent # Bixby Voice
pm enable --user 0 com.samsung.android.bixby.agent.dummy # Bixby debug app
pm enable --user 0 com.samsung.android.bixby.service # Bixby features
pm enable --user 0 com.samsung.android.bixby.wakeup
pm enable --user 0 com.samsung.android.bixbyvision.framework # Bixby Vision
pm enable --user 0 com.samsung.android.visionintelligence # Bixby Vision

# ANT Service
pm enable --user 0 com.dsi.ant.plugins.antplus
pm enable --user 0 com.dsi.ant.sample.acquirechannels
pm enable --user 0 com.dsi.ant.service.socket

# Samsung PayPass
pm enable --user 0 com.samsung.android.authfw # Samsung Authentication
pm enable --user 0 com.samsung.android.samsungpass # Samsung Pass
pm enable --user 0 com.samsung.android.samsungpassautofill # Samsung Auto fill
pm enable --user 0 com.samsung.android.spay # Samsung Pay (sensitive)
pm enable --user 0 com.samsung.android.spayfw # Samsung Pay Framework (sensitive)

# Samsung AREmoji
pm enable --user 0 com.samsung.android.aremoji # AR Emoji
pm enable --user 0 com.samsung.android.emojiupdater # Emoji updater
pm enable --user 0 com.sec.android.mimage.avatarstickers # Stickers for AR Emoji app

# Samsung StickerCenter
pm enable --user 0 com.samsung.android.app.camera.sticker.facear.preload
pm enable --user 0 com.samsung.android.app.camera.sticker.facearexpression.preload
pm enable --user 0 com.samsung.android.app.camera.sticker.facearframe.preload
pm enable --user 0 com.samsung.android.app.camera.sticker.stamp.preload
pm enable --user 0 com.samsung.android.stickercenter
pm enable --user 0 com.samsung.android.stickerplugin

# Samsung Game
pm enable --user 0 com.samsung.android.game.gamehome
pm enable --user 0 com.samsung.android.game.gametools
pm enable --user 0 com.samsung.android.gametuner.thin
pm enable --user 0 com.samsung.android.game.gos
pm enable --user 0 com.enhance.gameservice

# Samsung Gear
pm enable --user 0 com.google.vr.vrcore
pm enable --user 0 com.samsung.android.app.vrsetupwizardstub
pm enable --user 0 com.samsung.android.hmt.vrshell
pm enable --user 0 com.samsung.android.hmt.vrsvc

# Samsung Kids
pm enable --user 0 com.samsung.android.app.camera.sticker.facearavatar.preload # Camera stickers
pm enable --user 0 com.samsung.android.kidsinstaller # Kids Installer
pm enable --user 0 com.sec.android.app.kidshome # Kids launcher

# Samsung Led
pm enable --user 0 com.samsung.android.app.ledbackcover
pm enable --user 0 com.sec.android.cover.ledcover

# Edge Display
pm enable --user 0 com.cnn.mobile.android.phone.edgepanel # Edge panel
pm enable --user 0 com.samsung.android.app.appsedge # App panel plugin for Edge display
pm enable --user 0 com.samsung.android.app.sbrowseredge # Edge panel plugin for Samsung Internet
pm enable --user 0 com.samsung.android.service.peoplestripe # Edge panel plugin for contacts

# Samsung Dex
pm enable --user 0 com.samsung.desktopsystemui
pm enable --user 0 com.sec.android.app.desktoplauncher
pm enable --user 0 com.sec.android.desktopmode.uiservice

# Miscellaneous Samsung Bloatware
pm enable --user 0 com.android.documentsui
pm enable --user 0 com.google.android.dialer
pm enable --user 0 com.greatbigstory.greatbigstory
pm enable --user 0 com.linkedin.android
pm enable --user 0 com.microsoft.skydrive
pm enable --user 0 com.pandora.android
pm enable --user 0 com.samsung.android.app.contacts
pm enable --user 0 com.samsung.android.calendar
pm enable --user 0 com.samsung.android.service.livedrawing

# Facebook
pm enable --user 0 com.facebook.appmanager
pm enable --user 0 com.facebook.katana
pm enable --user 0 com.facebook.services
pm enable --user 0 com.facebook.system

exit
```
