# pm list packages
# pm list packages -s
# pm list packages -d
# pm list packages -u
# pm list packages | grep 'samsung'
# pm disable-user --user 0 
# pm uninstall -k --user 0 

#Android Bloatware on Samsung
#pm disable-user --user 0 com.android.bips // Default Printing Service
pm disable-user --user 0 com.android.bookmarkprovider // Bookmark Provider
pm disable-user --user 0 com.android.browser // Web Browser - Unknown
#pm disable-user --user 0 com.android.calendar // Calendar app
pm disable-user --user 0 com.android.cellbroadcastreceiver // Cell broadcasting
pm disable-user --user 0 com.android.cellbroadcastreceiver.overlay.common // Unknown
#pm disable-user --user 0 com.android.chrome // Chrome Browser
pm disable-user --user 0 com.android.deskclock // Stock Clock app
pm disable-user --user 0 com.android.dreams.basic // Screensaver app
pm disable-user --user 0 com.android.dreams.phototable // Screensaver app
pm disable-user --user 0 com.android.egg // Android Easter Egg
pm disable-user --user 0 com.android.emergency // SOS Calling
pm disable-user --user 0 com.android.hotwordenrollment.okgoogle // OK Google
pm disable-user --user 0 com.android.mms // MMS
pm disable-user --user 0 com.android.mms.service // MMS
pm disable-user --user 0 com.android.providers.partnerbookmarks // Bookmarks Provider
pm disable-user --user 0 com.android.statementservice // Checks APK files
pm disable-user --user 0 com.android.stk // SIM Tool-kit
pm disable-user --user 0 com.android.vpndialogs // VPN Dialog
pm disable-user --user 0 com.android.wallpaper.livepicker // Live wallpaper
pm disable-user --user 0 com.android.wallpaperbackup // Wallpaper backup feature
pm disable-user --user 0 com.android.wallpapercropper // Wallpaper cropping feature
pm disable-user --user 0 com.sec.android.app.chromecustomizations

#Google Bloatware on Samsung
#pm disable-user --user 0 com.google.android.apps.docs // Google Docs
#pm disable-user --user 0 com.google.android.apps.maps // Google Maps
#pm disable-user --user 0 com.google.android.apps.photos // Google Photos
pm disable-user --user 0 com.google.android.apps.tachyon // Google Duo
pm disable-user --user 0 com.google.android.apps.wellbeing // Digital Wellbeing
pm disable-user --user 0 com.google.android.feedback // Feedback app
#pm disable-user --user 0 com.google.android.gm // Gmail
pm disable-user --user 0 com.google.android.googlequicksearchbox // Google Quick Search
#pm disable-user --user 0 com.google.android.inputmethod.latin // Gboard
pm disable-user --user 0 com.google.android.marvin.talkback // Talkback feature
pm disable-user --user 0 com.google.android.printservice.recommendation // Mobile Printing
pm disable-user --user 0 com.google.android.syncadapters.calendar // Calendar Sync
pm disable-user --user 0 com.google.android.tts // Text-to-speech
pm disable-user --user 0 com.google.android.videos // Google Play Movies & TV
pm disable-user --user 0 com.google.android.youtube // Youtube
pm disable-user --user 0 com.google.ar.lens // AR Lens

#General Bloatware on Samsung
pm disable-user --user 0 com.mobeam.barcodeService // Barcode scanner
pm disable-user --user 0 com.samsung.android.app.aodservice // Always on Display
pm disable-user --user 0 com.samsung.android.app.dressroom // Samsung Wallpapers
pm disable-user --user 0 com.samsung.android.app.social // Whats New
pm disable-user --user 0 com.samsung.android.app.watchmanagerstub // Galaxy Watch
pm disable-user --user 0 com.samsung.android.ardrawing // AR Doodle
pm disable-user --user 0 com.samsung.android.beaconmanager // User tracking (sensitive)
pm disable-user --user 0 com.samsung.android.da.daagent // Dual Messenger
pm disable-user --user 0 com.samsung.android.drivelink.stub // Samsung Car Mode
pm disable-user --user 0 com.samsung.android.email.provider // Samsung Email
pm disable-user --user 0 com.samsung.android.mateagent // Galaxy Friends
#pm disable-user --user 0 com.samsung.android.messaging // Message app
pm disable-user --user 0 com.samsung.android.net.wifi.wifiguider // WiFi Tips
pm disable-user --user 0 com.samsung.android.oneconnect // Smart Things
pm disable-user --user 0 com.samsung.android.scloud // Samsung Cloud
pm disable-user --user 0 com.samsung.android.sdk.handwriting // Handwriting
pm disable-user --user 0 com.samsung.android.sdk.professionalaudio.utility.jammonitor
pm disable-user --user 0 com.samsung.android.service.aircommand // Air command (Note series bloat)
pm disable-user --user 0 com.samsung.android.service.livedrawing // Live Message (Note series bloat)
pm disable-user --user 0 com.samsung.android.svoiceime // Samsung Voice Input
pm disable-user --user 0 com.samsung.android.universalswitch // Mobile Universal Switch
pm disable-user --user 0 com.samsung.android.visioncloudagent //  VisionCloudAgent
pm disable-user --user 0 com.samsung.android.voc // Samsung Members
pm disable-user --user 0 com.samsung.android.wellbeing // Digital wellbeing
pm disable-user --user 0 com.samsung.android.widgetapp.yahooedge.finance // Finance widget
pm disable-user --user 0 com.samsung.android.widgetapp.yahooedge.sport // Sports widget
pm disable-user --user 0 com.samsung.app.highlightplayer // Samsung Story Video Editor
pm disable-user --user 0 com.samsung.ecomm.global // Samsung Shop
#pm disable-user --user 0 com.samsung.hidden.china // China Hidden Menu (Chinese Spyware)
pm disable-user --user 0 com.samsung.safetyinformation // Saftey Information
pm disable-user --user 0 com.samsung.SMT // Samsung Speech-to-Text
pm disable-user --user 0 com.samsung.storyservice // Samsung StoryService (Tracks device activity)
pm disable-user --user 0 com.sec.android.app.dexonpc // Samsung Dex
pm disable-user --user 0 com.sec.android.app.popupcalculator // Samsung Calculator
pm disable-user --user 0 com.sec.android.app.sbrowser // Samsung Internet
pm disable-user --user 0 com.sec.android.app.voicenote // Voice Recorder
pm disable-user --user 0 com.sec.android.daemonapp // Samsung Weather
pm disable-user --user 0 com.sec.android.easyMover.Agent // Samsung Smart Switch
pm disable-user --user 0 com.sec.android.easyonehand // One hand mode
pm disable-user --user 0 com.sec.android.splitsound // Samsung Split Sound Service
pm disable-user --user 0 com.sec.android.widgetapp.samsungapps // Homescreen widget
pm disable-user --user 0 com.wsomacp // Samsung Email
pm disable-user --user 0 flipboard.boxer.app // Flipboard app

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
pm disable-user --user 0 com.dsi.ant.plugins.antplus
pm disable-user --user 0 com.dsi.ant.sample.acquirechannels
pm disable-user --user 0 com.dsi.ant.service.socket

#Samsung PayPass
pm disable-user --user 0 com.samsung.android.authfw // Samsung Authentication
pm disable-user --user 0 com.samsung.android.samsungpass // Samsung Pass
pm disable-user --user 0 com.samsung.android.samsungpassautofill // Samsung Auto fill
pm disable-user --user 0 com.samsung.android.spay // Samsung Pay (sensitive)
pm disable-user --user 0 com.samsung.android.spayfw // Samsung Pay Framework (sensitive)

#Samsung AREmoji
pm disable-user --user 0 com.samsung.android.aremoji // AR Emoji
pm disable-user --user 0 com.samsung.android.emojiupdater // Emoji updater
pm disable-user --user 0 com.sec.android.mimage.avatarstickers // Stickers for AR Emoji app

#Samsung StickerCenter
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facear.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearexpression.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearframe.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.stamp.preload
pm disable-user --user 0 com.samsung.android.stickercenter
pm disable-user --user 0 com.samsung.android.stickerplugin

#Samsung Game
pm disable-user --user 0 com.samsung.android.game.gamehome
pm disable-user --user 0 com.samsung.android.game.gametools
pm disable-user --user 0 com.samsung.android.gametuner.thin
pm disable-user --user 0 com.samsung.android.game.gos
pm disable-user --user 0 com.enhance.gameservice

#Samsung Gear
pm disable-user --user 0 com.google.vr.vrcore
pm disable-user --user 0 com.samsung.android.app.vrsetupwizardstub
pm disable-user --user 0 com.samsung.android.hmt.vrshell
pm disable-user --user 0 com.samsung.android.hmt.vrsvc

#Samsung Kids
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearavatar.preload // Camera stickers
pm disable-user --user 0 com.samsung.android.kidsinstaller // Kids Installer
pm disable-user --user 0 com.sec.android.app.kidshome // Kids launcher

#Samsung Led
pm disable-user --user 0 com.samsung.android.app.ledbackcover
pm disable-user --user 0 com.sec.android.cover.ledcover

#Edge Display
pm disable-user --user 0 com.cnn.mobile.android.phone.edgepanel // Edge panel
pm disable-user --user 0 com.samsung.android.app.appsedge // App panel plugin for Edge display
pm disable-user --user 0 com.samsung.android.app.sbrowseredge // Edge panel plugin for Samsung Internet
pm disable-user --user 0 com.samsung.android.service.peoplestripe // Edge panel plugin for contacts

#Samsung Dex
pm disable-user --user 0 com.samsung.desktopsystemui
pm disable-user --user 0 com.sec.android.app.desktoplauncher
pm disable-user --user 0 com.sec.android.desktopmode.uiservice

#Miscellaneous Samsung Bloatware
pm disable-user --user 0 com.android.documentsui
pm disable-user --user 0 com.google.android.dialer
pm disable-user --user 0 com.greatbigstory.greatbigstory
pm disable-user --user 0 com.linkedin.android
pm disable-user --user 0 com.microsoft.skydrive
pm disable-user --user 0 com.pandora.android
pm disable-user --user 0 com.samsung.android.app.contacts
pm disable-user --user 0 com.samsung.android.calendar
pm disable-user --user 0 com.samsung.android.service.livedrawing

#Facebook
pm uninstall -k --user 0 com.facebook.appmanager
pm uninstall -k --user 0 com.facebook.katana
pm uninstall -k --user 0 com.facebook.services
pm uninstall -k --user 0 com.facebook.system
