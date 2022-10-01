# pm list packages
# pm list packages -s
# pm list packages -d
# pm list packages -u
# pm enable  # pm enable
# pm uninstall -k --user 0  # pm install-existing 

#Android Bloatware on Samsung
pm enable com.android.bips // Default Printing Service
pm enable com.android.bookmarkprovider // Bookmark Provider
pm enable com.android.browser // Web Browser IllegalArgumentException
pm enable com.android.calendar // Calendar app IllegalArgumentException
pm enable com.android.cellbroadcastreceiver // Cell broadcasting
pm enable com.android.cellbroadcastreceiver.overlay.common
pm enable com.android.chrome // Chrome Browser
pm enable com.android.deskclock // Stock Clock app
pm enable com.android.dreams.basic // Screensaver app
pm enable com.android.dreams.phototable // Screensaver app
pm enable com.android.egg // Android Easter Egg
pm enable com.android.emergency // SOS Calling
pm enable com.android.hotwordenrollment.okgoogle // OK Google
pm enable com.android.mms // MMS app
pm enable com.android.mms.service // MMS
pm enable com.android.providers.partnerbookmarks // Bookmarks Provider
pm enable com.android.statementservice // Checks APK files
pm enable com.android.stk // SIM Tool-kit
pm enable com.android.vpndialogs // VPN Dialog
pm enable com.android.wallpaper.livepicker // Live wallpaper
pm enable com.android.wallpaperbackup // Wallpaper backup feature
pm enable com.android.wallpapercropper // Wallpaper cropping feature
pm enable com.sec.android.app.chromecustomizations

#Google Bloatware on Samsung
pm enable com.google.android.apps.docs // Google Docs
pm enable com.google.android.apps.maps // Google Maps
pm enable com.google.android.apps.photos // Google Photos
pm enable com.google.android.apps.tachyon // Google Duo
pm enable com.google.android.apps.wellbeing // Digital Wellbeing
pm enable com.google.android.feedback // Feedback app
pm enable com.google.android.gm // Gmail
pm enable com.google.android.googlequicksearchbox // Google Quick Search
pm enable com.google.android.inputmethod.latin // Gboard
pm enable com.google.android.marvin.talkback // Talkback feature
pm enable com.google.android.printservice.recommendation // Mobile Printing
pm enable com.google.android.syncadapters.calendar // Calendar Sync
pm enable com.google.android.tts // Text-to-speech
pm enable com.google.android.videos // Google Play Movies & TV
pm enable com.google.android.youtube // Youtube
pm enable com.google.ar.lens // AR Lens

#General Bloatware on Samsung
pm enable com.mobeam.barcodeService // Barcode scanner
pm enable com.samsung.android.app.aodservice // Always on Display
pm enable com.samsung.android.app.dressroom // Samsung Wallpapers
pm enable com.samsung.android.app.social // Whats New
pm enable com.samsung.android.app.watchmanagerstub // Galaxy Watch
pm enable com.samsung.android.ardrawing // AR Doodle
pm enable com.samsung.android.beaconmanager // User tracking app (sensitive)
pm enable com.samsung.android.da.daagent // Dual Messenger
pm enable com.samsung.android.drivelink.stub // Samsung Car Mode
pm enable com.samsung.android.email.provider // Samsung Email
pm enable com.samsung.android.mateagent // Galaxy Friends
pm enable com.samsung.android.messaging // Message app
pm enable com.samsung.android.net.wifi.wifiguider // WiFi Tips
pm enable com.samsung.android.oneconnect // Smart Things
pm enable com.samsung.android.scloud // Samsung Cloud
pm enable com.samsung.android.sdk.handwriting // Galaxy Note series bloat
pm enable com.samsung.android.sdk.professionalaudio.utility.jammonitor
pm enable com.samsung.android.service.aircommand // Air command (Note series bloat)
pm enable com.samsung.android.service.livedrawing // Live Message (Note series bloat)
pm enable com.samsung.android.svoiceime // Samsung Voice Input
pm enable com.samsung.android.universalswitch // Mobile Universal Switch
pm enable com.samsung.android.visioncloudagent //  VisionCloudAgent
pm enable com.samsung.android.voc // Samsung Members
pm enable com.samsung.android.wellbeing // Digital wellbeing
pm enable com.samsung.android.widgetapp.yahooedge.finance // Finance widget
pm enable com.samsung.android.widgetapp.yahooedge.sport // Sports widget
pm enable com.samsung.app.highlightplayer // Samsung Story Video Editor
pm enable com.samsung.ecomm.global // Samsung Shop
pm enable com.samsung.hidden.china // China Hidden Menu (Chinese Spyware)
pm enable com.samsung.safetyinformation // Saftey Information
pm enable com.samsung.SMT // Samsung Speech-to-Text
pm enable com.samsung.storyservice // Samsung StoryService (Tracks device activity)
pm enable com.sec.android.app.dexonpc // Samsung Dex
pm enable com.sec.android.app.popupcalculator // Samsung Calculator
pm enable com.sec.android.app.sbrowser // Samsung Internet
pm enable com.sec.android.app.voicenote // Voice Recorder
pm enable com.sec.android.daemonapp // Samsung Weather
pm enable com.sec.android.easyMover.Agent // Samsung Smart Switch
pm enable com.sec.android.easyonehand // One hand mode
pm enable com.sec.android.splitsound // Samsung Split Sound Service
pm enable com.sec.android.widgetapp.samsungapps // Homescreen widget
pm enable com.wsomacp // Samsung Email
pm enable flipboard.boxer.app // Flipboard app

#Samsung Bixby
pm uninstall -k --user 0 com.samsung.android.app.routines // Bixby Routines
pm uninstall -k --user 0 com.samsung.android.app.spage // Bixby homepage launcher
pm uninstall -k --user 0 com.samsung.android.bixby.agent // Bixby Voice
pm uninstall -k --user 0 com.samsung.android.bixby.agent.dummy // Bixby debug app
pm uninstall -k --user 0 com.samsung.android.bixby.service // Bixby features
pm uninstall -k --user 0 com.samsung.android.bixby.wakeup
pm uninstall -k --user 0 com.samsung.android.bixbyvision.framework // Bixby Vision
pm uninstall -k --user 0 com.samsung.android.visionintelligence // Bixby Vision

#ANT Service
pm enable com.dsi.ant.plugins.antplus
pm enable com.dsi.ant.sample.acquirechannels
pm enable com.dsi.ant.service.socket

#Samsung PayPass
pm enable com.samsung.android.authfw // Samsung Authentication
pm enable com.samsung.android.samsungpass // Samsung Pass
pm enable com.samsung.android.samsungpassautofill // Samsung Auto fill
pm enable com.samsung.android.spay // Samsung Pay (sensitive)
pm enable com.samsung.android.spayfw // Samsung Pay Framework (sensitive)

#Samsung AREmoji
pm enable com.samsung.android.aremoji // AR Emoji
pm enable com.samsung.android.emojiupdater // Emoji updater
pm enable com.sec.android.mimage.avatarstickers // Stickers for AR Emoji app

#Samsung StickerCenter
pm enable com.samsung.android.app.camera.sticker.facear.preload
pm enable com.samsung.android.app.camera.sticker.facearexpression.preload
pm enable com.samsung.android.app.camera.sticker.facearframe.preload
pm enable com.samsung.android.app.camera.sticker.stamp.preload
pm enable com.samsung.android.stickercenter
pm enable com.samsung.android.stickerplugin

#Samsung Game
pm enable com.samsung.android.game.gamehome
pm enable com.samsung.android.game.gametools
pm enable com.samsung.android.gametuner.thin
pm enable com.samsung.android.game.gos
pm enable com.enhance.gameservice

#Samsung Gear
pm enable com.google.vr.vrcore
pm enable com.samsung.android.app.vrsetupwizardstub
pm enable com.samsung.android.hmt.vrshell
pm enable com.samsung.android.hmt.vrsvc

#Samsung Kids
pm enable com.samsung.android.app.camera.sticker.facearavatar.preload // Camera stickers
pm enable com.samsung.android.kidsinstaller // Kids Installer
pm enable com.sec.android.app.kidshome // Kids launcher

#Samsung Led
pm enable com.samsung.android.app.ledbackcover
pm enable com.sec.android.cover.ledcover

#Edge Display
pm enable com.cnn.mobile.android.phone.edgepanel // Edge panel
pm enable com.samsung.android.app.appsedge // App panel plugin for Edge display
pm enable com.samsung.android.app.sbrowseredge // Edge panel plugin for Samsung Internet
pm enable com.samsung.android.service.peoplestripe // Edge panel plugin for contacts

#Samsung Dex
pm enable com.samsung.desktopsystemui
pm enable com.sec.android.app.desktoplauncher
pm enable com.sec.android.desktopmode.uiservice

#Miscellaneous Samsung Bloatware
pm enable com.android.documentsui
pm enable com.google.android.dialer
pm enable com.greatbigstory.greatbigstory
pm enable com.linkedin.android
pm enable com.microsoft.skydrive
pm enable com.pandora.android
pm enable com.samsung.android.app.contacts
pm enable com.samsung.android.calendar
pm enable com.samsung.android.service.livedrawing

#Facebook
pm uninstall -k --user 0 com.facebook.appmanager
pm uninstall -k --user 0 com.facebook.katana
pm uninstall -k --user 0 com.facebook.services
pm uninstall -k --user 0 com.facebook.system
