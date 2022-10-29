```sh
adb shell pm list packages -s
adb shell pm list packages -d
adb shell pm list packages -u
adb shell pm list packages | grep 'samsung'
adb shell pm list packages | grep 'miui'
adb shell adb shell pm disable-user --user 0 
adb shell pm enable 
adb shell pm uninstall -k --user 0 
adb shell pm install-existing 
```

```sh
# Android Bloatware on Samsung
# adb shell pm disable-user --user 0 com.android.bips # Default Printing Service
adb shell pm disable-user --user 0 com.android.bookmarkprovider # Bookmark Provider
adb shell pm disable-user --user 0 com.android.browser # Web Browser - Unknown
# adb shell pm disable-user --user 0 com.android.calendar # Calendar app
adb shell pm disable-user --user 0 com.android.cellbroadcastreceiver # Cell broadcasting
adb shell pm disable-user --user 0 com.android.cellbroadcastreceiver.overlay.common # Unknown
# adb shell pm disable-user --user 0 com.android.chrome # Chrome Browser
adb shell pm disable-user --user 0 com.android.deskclock # Stock Clock app
adb shell pm disable-user --user 0 com.android.dreams.basic # Screensaver app
adb shell pm disable-user --user 0 com.android.dreams.phototable # Screensaver app
adb shell pm disable-user --user 0 com.android.egg # Android Easter Egg
adb shell pm disable-user --user 0 com.android.emergency # SOS Calling
adb shell pm disable-user --user 0 com.android.hotwordenrollment.okgoogle # OK Google
adb shell pm disable-user --user 0 com.android.mms # MMS
adb shell pm disable-user --user 0 com.android.mms.service # MMS
adb shell pm disable-user --user 0 com.android.providers.partnerbookmarks # Bookmarks Provider
adb shell pm disable-user --user 0 com.android.statementservice # Checks APK files
adb shell pm disable-user --user 0 com.android.stk # SIM Tool-kit
adb shell pm disable-user --user 0 com.android.vpndialogs # VPN Dialog
adb shell pm disable-user --user 0 com.android.wallpaper.livepicker # Live wallpaper
adb shell pm disable-user --user 0 com.android.wallpaperbackup # Wallpaper backup feature
adb shell pm disable-user --user 0 com.android.wallpapercropper # Wallpaper cropping feature
adb shell pm disable-user --user 0 com.sec.android.app.chromecustomizations

# Google Bloatware on Samsung
# adb shell pm disable-user --user 0 com.google.android.apps.docs # Google Docs
# adb shell pm disable-user --user 0 com.google.android.apps.maps # Google Maps
# adb shell pm disable-user --user 0 com.google.android.apps.photos # Google Photos
adb shell pm disable-user --user 0 com.google.android.apps.tachyon # Google Duo
adb shell pm disable-user --user 0 com.google.android.apps.wellbeing # Digital Wellbeing
adb shell pm disable-user --user 0 com.google.android.feedback # Feedback app
# adb shell pm disable-user --user 0 com.google.android.gm # Gmail
adb shell pm disable-user --user 0 com.google.android.googlequicksearchbox # Google Quick Search
# adb shell pm disable-user --user 0 com.google.android.inputmethod.latin # Gboard
adb shell pm disable-user --user 0 com.google.android.marvin.talkback # Talkback feature
adb shell pm disable-user --user 0 com.google.android.printservice.recommendation # Mobile Printing
adb shell pm disable-user --user 0 com.google.android.syncadapters.calendar # Calendar Sync
adb shell pm disable-user --user 0 com.google.android.tts # Text-to-speech
adb shell pm disable-user --user 0 com.google.android.videos # Google Play Movies & TV
adb shell pm disable-user --user 0 com.google.android.youtube # Youtube
adb shell pm disable-user --user 0 com.google.ar.lens # AR Lens

# General Bloatware on Samsung
adb shell pm disable-user --user 0 com.mobeam.barcodeService # Barcode scanner
adb shell pm disable-user --user 0 com.samsung.android.app.aodservice # Always on Display
adb shell pm disable-user --user 0 com.samsung.android.app.dressroom # Samsung Wallpapers
adb shell pm disable-user --user 0 com.samsung.android.app.social # Whats New
adb shell pm disable-user --user 0 com.samsung.android.app.watchmanagerstub # Galaxy Watch
adb shell pm disable-user --user 0 com.samsung.android.ardrawing # AR Doodle
adb shell pm disable-user --user 0 com.samsung.android.beaconmanager # User tracking (sensitive)
adb shell pm disable-user --user 0 com.samsung.android.da.daagent # Dual Messenger
adb shell pm disable-user --user 0 com.samsung.android.drivelink.stub # Samsung Car Mode
adb shell pm disable-user --user 0 com.samsung.android.email.provider # Samsung Email
adb shell pm disable-user --user 0 com.samsung.android.mateagent # Galaxy Friends
# adb shell pm disable-user --user 0 com.samsung.android.messaging # Message app
adb shell pm disable-user --user 0 com.samsung.android.net.wifi.wifiguider # WiFi Tips
adb shell pm disable-user --user 0 com.samsung.android.oneconnect # Smart Things
adb shell pm disable-user --user 0 com.samsung.android.scloud # Samsung Cloud
adb shell pm disable-user --user 0 com.samsung.android.sdk.handwriting # Handwriting
adb shell pm disable-user --user 0 com.samsung.android.sdk.professionalaudio.utility.jammonitor
adb shell pm disable-user --user 0 com.samsung.android.service.aircommand # Air command (Note series bloat)
adb shell pm disable-user --user 0 com.samsung.android.service.livedrawing # Live Message (Note series bloat)
adb shell pm disable-user --user 0 com.samsung.android.svoiceime # Samsung Voice Input
adb shell pm disable-user --user 0 com.samsung.android.universalswitch # Mobile Universal Switch
adb shell pm disable-user --user 0 com.samsung.android.visioncloudagent #  VisionCloudAgent
adb shell pm disable-user --user 0 com.samsung.android.voc # Samsung Members
adb shell pm disable-user --user 0 com.samsung.android.wellbeing # Digital wellbeing
adb shell pm disable-user --user 0 com.samsung.android.widgetapp.yahooedge.finance # Finance widget
adb shell pm disable-user --user 0 com.samsung.android.widgetapp.yahooedge.sport # Sports widget
adb shell pm disable-user --user 0 com.samsung.app.highlightplayer # Samsung Story Video Editor
adb shell pm disable-user --user 0 com.samsung.ecomm.global # Samsung Shop
# adb shell pm disable-user --user 0 com.samsung.hidden.china # China Hidden Menu (Chinese Spyware)
adb shell pm disable-user --user 0 com.samsung.safetyinformation # Saftey Information
adb shell pm disable-user --user 0 com.samsung.SMT # Samsung Speech-to-Text
adb shell pm disable-user --user 0 com.samsung.storyservice # Samsung StoryService (Tracks device activity)
adb shell pm disable-user --user 0 com.sec.android.app.dexonpc # Samsung Dex
adb shell pm disable-user --user 0 com.sec.android.app.popupcalculator # Samsung Calculator
adb shell pm disable-user --user 0 com.sec.android.app.sbrowser # Samsung Internet
adb shell pm disable-user --user 0 com.sec.android.app.voicenote # Voice Recorder
adb shell pm disable-user --user 0 com.sec.android.daemonapp # Samsung Weather
adb shell pm disable-user --user 0 com.sec.android.easyMover.Agent # Samsung Smart Switch
adb shell pm disable-user --user 0 com.sec.android.easyonehand # One hand mode
adb shell pm disable-user --user 0 com.sec.android.splitsound # Samsung Split Sound Service
adb shell pm disable-user --user 0 com.sec.android.widgetapp.samsungapps # Homescreen widget
adb shell pm disable-user --user 0 com.wsomacp # Samsung Email
adb shell pm disable-user --user 0 flipboard.boxer.app # Flipboard app

# Samsung Bixby
adb shell pm disable-user --user 0 com.samsung.android.app.routines # Bixby Routines
adb shell pm disable-user --user 0 com.samsung.android.app.spage # Bixby homepage launcher
adb shell pm disable-user --user 0 com.samsung.android.bixby.agent # Bixby Voice
adb shell pm disable-user --user 0 com.samsung.android.bixby.agent.dummy # Bixby debug app
adb shell pm disable-user --user 0 com.samsung.android.bixby.service # Bixby features
adb shell pm disable-user --user 0 com.samsung.android.bixby.wakeup
adb shell pm disable-user --user 0 com.samsung.android.bixbyvision.framework # Bixby Vision
adb shell pm disable-user --user 0 com.samsung.android.visionintelligence # Bixby Vision

# ANT Service
adb shell pm disable-user --user 0 com.dsi.ant.plugins.antplus
adb shell pm disable-user --user 0 com.dsi.ant.sample.acquirechannels
adb shell pm disable-user --user 0 com.dsi.ant.service.socket

# Samsung PayPass
adb shell pm disable-user --user 0 com.samsung.android.authfw # Samsung Authentication
adb shell pm disable-user --user 0 com.samsung.android.samsungpass # Samsung Pass
adb shell pm disable-user --user 0 com.samsung.android.samsungpassautofill # Samsung Auto fill
adb shell pm disable-user --user 0 com.samsung.android.spay # Samsung Pay (sensitive)
adb shell pm disable-user --user 0 com.samsung.android.spayfw # Samsung Pay Framework (sensitive)

# Samsung AREmoji
adb shell pm disable-user --user 0 com.samsung.android.aremoji # AR Emoji
adb shell pm disable-user --user 0 com.samsung.android.emojiupdater # Emoji updater
adb shell pm disable-user --user 0 com.sec.android.mimage.avatarstickers # Stickers for AR Emoji app

# Samsung StickerCenter
adb shell pm disable-user --user 0 com.samsung.android.app.camera.sticker.facear.preload
adb shell pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearexpression.preload
adb shell pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearframe.preload
adb shell pm disable-user --user 0 com.samsung.android.app.camera.sticker.stamp.preload
adb shell pm disable-user --user 0 com.samsung.android.stickercenter
adb shell pm disable-user --user 0 com.samsung.android.stickerplugin

# Samsung Game
adb shell pm disable-user --user 0 com.samsung.android.game.gamehome
adb shell pm disable-user --user 0 com.samsung.android.game.gametools
adb shell pm disable-user --user 0 com.samsung.android.gametuner.thin
adb shell pm disable-user --user 0 com.samsung.android.game.gos
adb shell pm disable-user --user 0 com.enhance.gameservice

# Samsung Gear
adb shell pm disable-user --user 0 com.google.vr.vrcore
adb shell pm disable-user --user 0 com.samsung.android.app.vrsetupwizardstub
adb shell pm disable-user --user 0 com.samsung.android.hmt.vrshell
adb shell pm disable-user --user 0 com.samsung.android.hmt.vrsvc

# Samsung Kids
adb shell pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearavatar.preload # Camera stickers
adb shell pm disable-user --user 0 com.samsung.android.kidsinstaller # Kids Installer
adb shell pm disable-user --user 0 com.sec.android.app.kidshome # Kids launcher

# Samsung Led
adb shell pm disable-user --user 0 com.samsung.android.app.ledbackcover
adb shell pm disable-user --user 0 com.sec.android.cover.ledcover

# Edge Display
adb shell pm disable-user --user 0 com.cnn.mobile.android.phone.edgepanel # Edge panel
adb shell pm disable-user --user 0 com.samsung.android.app.appsedge # App panel plugin for Edge display
adb shell pm disable-user --user 0 com.samsung.android.app.sbrowseredge # Edge panel plugin for Samsung Internet
adb shell pm disable-user --user 0 com.samsung.android.service.peoplestripe # Edge panel plugin for contacts

# Samsung Dex
adb shell pm disable-user --user 0 com.samsung.desktopsystemui
adb shell pm disable-user --user 0 com.sec.android.app.desktoplauncher
adb shell pm disable-user --user 0 com.sec.android.desktopmode.uiservice

# Miscellaneous Samsung Bloatware
adb shell pm disable-user --user 0 com.android.documentsui
adb shell pm disable-user --user 0 com.google.android.dialer
adb shell pm disable-user --user 0 com.greatbigstory.greatbigstory
adb shell pm disable-user --user 0 com.linkedin.android
adb shell pm disable-user --user 0 com.microsoft.skydrive
adb shell pm disable-user --user 0 com.pandora.android
adb shell pm disable-user --user 0 com.samsung.android.app.contacts
adb shell pm disable-user --user 0 com.samsung.android.calendar
adb shell pm disable-user --user 0 com.samsung.android.service.livedrawing

# Facebook
adb shell pm disable-user --user 0 com.facebook.appmanager
adb shell pm disable-user --user 0 com.facebook.katana
adb shell pm disable-user --user 0 com.facebook.services
adb shell pm disable-user --user 0 com.facebook.system
```