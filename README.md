# devitworld-flutter-basic

flutter basic tutorial repository (https://devitworld.com/)

### 1. create project

```
devitworld-flutter-basic
├─ .git
│  ├─ config
│  ├─ description
│  ├─ FETCH_HEAD
│  ├─ HEAD
│  ├─ hooks
│  │  ├─ applypatch-msg.sample
│  │  ├─ commit-msg.sample
│  │  ├─ fsmonitor-watchman.sample
│  │  ├─ post-update.sample
│  │  ├─ pre-applypatch.sample
│  │  ├─ pre-commit.sample
│  │  ├─ pre-merge-commit.sample
│  │  ├─ pre-push.sample
│  │  ├─ pre-rebase.sample
│  │  ├─ pre-receive.sample
│  │  ├─ prepare-commit-msg.sample
│  │  ├─ push-to-checkout.sample
│  │  └─ update.sample
│  ├─ index
│  ├─ info
│  │  └─ exclude
│  ├─ logs
│  │  ├─ HEAD
│  │  └─ refs
│  │     ├─ heads
│  │     │  └─ main
│  │     └─ remotes
│  │        └─ origin
│  │           └─ HEAD
│  ├─ objects
│  │  ├─ info
│  │  └─ pack
│  │     ├─ pack-88b750b2fe178b478f89a7ac8e18ba9ccaf24985.idx
│  │     └─ pack-88b750b2fe178b478f89a7ac8e18ba9ccaf24985.pack
│  ├─ packed-refs
│  └─ refs
│     ├─ heads
│     │  └─ main
│     ├─ remotes
│     │  └─ origin
│     │     └─ HEAD
│     └─ tags
├─ .gitignore
├─ .vscode
│  └─ launch.json
├─ README.md
└─ _1_create_project
   ├─ .gitignore
   ├─ .metadata
   ├─ analysis_options.yaml
   ├─ android
   │  ├─ .gitignore
   │  ├─ .gradle
   │  │  ├─ 7.5
   │  │  │  ├─ checksums
   │  │  │  │  ├─ checksums.lock
   │  │  │  │  ├─ md5-checksums.bin
   │  │  │  │  └─ sha1-checksums.bin
   │  │  │  ├─ dependencies-accessors
   │  │  │  │  ├─ dependencies-accessors.lock
   │  │  │  │  └─ gc.properties
   │  │  │  ├─ executionHistory
   │  │  │  │  ├─ executionHistory.bin
   │  │  │  │  └─ executionHistory.lock
   │  │  │  ├─ fileChanges
   │  │  │  │  └─ last-build.bin
   │  │  │  ├─ fileHashes
   │  │  │  │  ├─ fileHashes.bin
   │  │  │  │  ├─ fileHashes.lock
   │  │  │  │  └─ resourceHashesCache.bin
   │  │  │  ├─ gc.properties
   │  │  │  └─ vcsMetadata
   │  │  ├─ buildOutputCleanup
   │  │  │  ├─ buildOutputCleanup.lock
   │  │  │  ├─ cache.properties
   │  │  │  └─ outputFiles.bin
   │  │  ├─ file-system.probe
   │  │  └─ vcs-1
   │  │     └─ gc.properties
   │  ├─ app
   │  │  ├─ build.gradle
   │  │  └─ src
   │  │     ├─ debug
   │  │     │  └─ AndroidManifest.xml
   │  │     ├─ main
   │  │     │  ├─ AndroidManifest.xml
   │  │     │  ├─ java
   │  │     │  │  └─ io
   │  │     │  │     └─ flutter
   │  │     │  │        └─ plugins
   │  │     │  │           └─ GeneratedPluginRegistrant.java
   │  │     │  ├─ kotlin
   │  │     │  │  └─ com
   │  │     │  │     └─ example
   │  │     │  │        └─ u_1_create_project
   │  │     │  │           └─ MainActivity.kt
   │  │     │  └─ res
   │  │     │     ├─ drawable
   │  │     │     │  └─ launch_background.xml
   │  │     │     ├─ drawable-v21
   │  │     │     │  └─ launch_background.xml
   │  │     │     ├─ mipmap-hdpi
   │  │     │     │  └─ ic_launcher.png
   │  │     │     ├─ mipmap-mdpi
   │  │     │     │  └─ ic_launcher.png
   │  │     │     ├─ mipmap-xhdpi
   │  │     │     │  └─ ic_launcher.png
   │  │     │     ├─ mipmap-xxhdpi
   │  │     │     │  └─ ic_launcher.png
   │  │     │     ├─ mipmap-xxxhdpi
   │  │     │     │  └─ ic_launcher.png
   │  │     │     ├─ values
   │  │     │     │  └─ styles.xml
   │  │     │     └─ values-night
   │  │     │        └─ styles.xml
   │  │     └─ profile
   │  │        └─ AndroidManifest.xml
   │  ├─ build.gradle
   │  ├─ gradle
   │  │  └─ wrapper
   │  │     ├─ gradle-wrapper.jar
   │  │     └─ gradle-wrapper.properties
   │  ├─ gradle.properties
   │  ├─ gradlew
   │  ├─ gradlew.bat
   │  ├─ local.properties
   │  └─ settings.gradle
   ├─ ios
   │  ├─ .gitignore
   │  ├─ Flutter
   │  │  ├─ AppFrameworkInfo.plist
   │  │  ├─ Debug.xcconfig
   │  │  ├─ flutter_export_environment.sh
   │  │  ├─ Generated.xcconfig
   │  │  └─ Release.xcconfig
   │  ├─ Runner
   │  │  ├─ AppDelegate.swift
   │  │  ├─ Assets.xcassets
   │  │  │  ├─ AppIcon.appiconset
   │  │  │  │  ├─ Contents.json
   │  │  │  │  ├─ Icon-App-1024x1024@1x.png
   │  │  │  │  ├─ Icon-App-20x20@1x.png
   │  │  │  │  ├─ Icon-App-20x20@2x.png
   │  │  │  │  ├─ Icon-App-20x20@3x.png
   │  │  │  │  ├─ Icon-App-29x29@1x.png
   │  │  │  │  ├─ Icon-App-29x29@2x.png
   │  │  │  │  ├─ Icon-App-29x29@3x.png
   │  │  │  │  ├─ Icon-App-40x40@1x.png
   │  │  │  │  ├─ Icon-App-40x40@2x.png
   │  │  │  │  ├─ Icon-App-40x40@3x.png
   │  │  │  │  ├─ Icon-App-60x60@2x.png
   │  │  │  │  ├─ Icon-App-60x60@3x.png
   │  │  │  │  ├─ Icon-App-76x76@1x.png
   │  │  │  │  ├─ Icon-App-76x76@2x.png
   │  │  │  │  └─ Icon-App-83.5x83.5@2x.png
   │  │  │  └─ LaunchImage.imageset
   │  │  │     ├─ Contents.json
   │  │  │     ├─ LaunchImage.png
   │  │  │     ├─ LaunchImage@2x.png
   │  │  │     ├─ LaunchImage@3x.png
   │  │  │     └─ README.md
   │  │  ├─ Base.lproj
   │  │  │  ├─ LaunchScreen.storyboard
   │  │  │  └─ Main.storyboard
   │  │  ├─ GeneratedPluginRegistrant.h
   │  │  ├─ GeneratedPluginRegistrant.m
   │  │  ├─ Info.plist
   │  │  └─ Runner-Bridging-Header.h
   │  ├─ Runner.xcodeproj
   │  │  ├─ project.pbxproj
   │  │  ├─ project.xcworkspace
   │  │  │  ├─ contents.xcworkspacedata
   │  │  │  └─ xcshareddata
   │  │  │     ├─ IDEWorkspaceChecks.plist
   │  │  │     └─ WorkspaceSettings.xcsettings
   │  │  └─ xcshareddata
   │  │     └─ xcschemes
   │  │        └─ Runner.xcscheme
   │  ├─ Runner.xcworkspace
   │  │  ├─ contents.xcworkspacedata
   │  │  └─ xcshareddata
   │  │     ├─ IDEWorkspaceChecks.plist
   │  │     └─ WorkspaceSettings.xcsettings
   │  └─ RunnerTests
   │     └─ RunnerTests.swift
   ├─ lib
   │  └─ main.dart
   ├─ linux
   │  ├─ .gitignore
   │  ├─ CMakeLists.txt
   │  ├─ flutter
   │  │  ├─ CMakeLists.txt
   │  │  ├─ generated_plugins.cmake
   │  │  ├─ generated_plugin_registrant.cc
   │  │  └─ generated_plugin_registrant.h
   │  ├─ main.cc
   │  ├─ my_application.cc
   │  └─ my_application.h
   ├─ macos
   │  ├─ .gitignore
   │  ├─ Flutter
   │  │  ├─ ephemeral
   │  │  │  ├─ Flutter-Generated.xcconfig
   │  │  │  └─ flutter_export_environment.sh
   │  │  ├─ Flutter-Debug.xcconfig
   │  │  ├─ Flutter-Release.xcconfig
   │  │  └─ GeneratedPluginRegistrant.swift
   │  ├─ Runner
   │  │  ├─ AppDelegate.swift
   │  │  ├─ Assets.xcassets
   │  │  │  └─ AppIcon.appiconset
   │  │  │     ├─ app_icon_1024.png
   │  │  │     ├─ app_icon_128.png
   │  │  │     ├─ app_icon_16.png
   │  │  │     ├─ app_icon_256.png
   │  │  │     ├─ app_icon_32.png
   │  │  │     ├─ app_icon_512.png
   │  │  │     ├─ app_icon_64.png
   │  │  │     └─ Contents.json
   │  │  ├─ Base.lproj
   │  │  │  └─ MainMenu.xib
   │  │  ├─ Configs
   │  │  │  ├─ AppInfo.xcconfig
   │  │  │  ├─ Debug.xcconfig
   │  │  │  ├─ Release.xcconfig
   │  │  │  └─ Warnings.xcconfig
   │  │  ├─ DebugProfile.entitlements
   │  │  ├─ Info.plist
   │  │  ├─ MainFlutterWindow.swift
   │  │  └─ Release.entitlements
   │  ├─ Runner.xcodeproj
   │  │  ├─ project.pbxproj
   │  │  ├─ project.xcworkspace
   │  │  │  └─ xcshareddata
   │  │  │     └─ IDEWorkspaceChecks.plist
   │  │  └─ xcshareddata
   │  │     └─ xcschemes
   │  │        └─ Runner.xcscheme
   │  ├─ Runner.xcworkspace
   │  │  ├─ contents.xcworkspacedata
   │  │  └─ xcshareddata
   │  │     └─ IDEWorkspaceChecks.plist
   │  └─ RunnerTests
   │     └─ RunnerTests.swift
   ├─ pubspec.lock
   ├─ pubspec.yaml
   ├─ README.md
   ├─ test
   │  └─ widget_test.dart
   ├─ web
   │  ├─ favicon.png
   │  ├─ icons
   │  │  ├─ Icon-192.png
   │  │  ├─ Icon-512.png
   │  │  ├─ Icon-maskable-192.png
   │  │  └─ Icon-maskable-512.png
   │  ├─ index.html
   │  └─ manifest.json
   └─ windows
      ├─ .gitignore
      ├─ CMakeLists.txt
      ├─ flutter
      │  ├─ CMakeLists.txt
      │  ├─ generated_plugins.cmake
      │  ├─ generated_plugin_registrant.cc
      │  └─ generated_plugin_registrant.h
      └─ runner
         ├─ CMakeLists.txt
         ├─ flutter_window.cpp
         ├─ flutter_window.h
         ├─ main.cpp
         ├─ resource.h
         ├─ resources
         │  └─ app_icon.ico
         ├─ runner.exe.manifest
         ├─ Runner.rc
         ├─ utils.cpp
         ├─ utils.h
         ├─ win32_window.cpp
         └─ win32_window.h

```
