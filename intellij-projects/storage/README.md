[TOC]

# Team

- Android Framework Overground - [go/android-framework-overground](https://goto.google.com/android-framework-overground) - [Moma](https://moma.corp.google.com/team/1176659909980)
- Android Storage - [go/android-storage](https://goto.google.com/android-storage) - [Moma](https://moma.corp.google.com/team/1711826357704)
    + Corina Grigoras - corinac@ - [Moma](https://moma.corp.google.com/person/corinac)
    + Roxanna Aliabadi - roxy@ - [Moma](http://who/roxy)
- Photo Picker - [go/photo-picker](https://goto.google.com/photo-picker)
    + Krishang Garodia - krishang@ - [Moma](http://who/krishang) - [Gerrit](https://googleplex-android-review.git.corp.google.com/dashboard/1111151)
    + Shubhi Saxena - shubhisaxena@ - [Moma](http://who/shubhisaxena) - [Gerrit](https://googleplex-android-review.git.corp.google.com/dashboard/1114561)



# MediaProvider

## Packages
`c.a.p.m`=`com.android.providers.media`
<br>
`c.G.a.p.m`=`com.google.android.providers.media` 

### MediaProvider(Google)
**`com.google.android.providers.media.module`**
<br>
*`com.android.providers.media.overlay.pixel`* (`overlayTarget=com.google.android.providers.media.module`)

```
adb shell pm list packages -f -U com.google.android.providers.media.module
# package:
#     /apex/com.android.mediaprovider/priv-app/MediaProviderGoogle@MASTER/MediaProviderGoogle.apk=
#     com.google.android.providers.media.module
#     uid:10249

adb shell pm list packages -f -U com.android.providers.media.overlay.pixel
# package:
#     /product/overlay/MediaProviderOverlay/MediaProviderOverlay.apk=
#     com.android.providers.media.overlay.pixel
#     uid:10059
```

[`adb shell dumpsys package com.google.android.providers.media.module`](https://paste.googleplex.com/5544748222775296?raw)
<br>
[`adb shell dumpsys package com.android.providers.media.overlay.pixel`](https://paste.googleplex.com/6653690317373440?raw)

#### Activities

##### `c.a.p.m.photopicker.PhotoPickerActivity`
- `priority="100"`
- `android.provider.action.PICK_IMAGES`
    * `image/*`
    * `video/*`
- `android.provider.action.PICK_IMAGES`

##### `c.a.p.m.photopicker.PhotoPickerGetContentActivity`
- **`<activity-alias>`**
    + `targetActivity=c.a.p.m.photopicker.PhotoPickerActivity`
- `android.provider.action.PICK_IMAGES`
    * `image/*`
    * `video/*`
    * **`priority="101"`**

##### `c.a.p.m.CacheClearingActivity`
- `priority="100"`
- `android.os.storage.action.CLEAR_APP_CACHE`


#### ContentProviders

| Authority | CP<br>(package=`c.G.a.p.m.module`) |
| --------- | ---------------------------------- |
| `media` | `c.a.p.m.MediaProvider` |
| `c.a.p.m.documents` | `c.a.p.m.MediaDocumentsProvider` |
| `c.a.p.m.photopicker` | `c.a.p.m.photopicker.PhotoPickerProvider` |
| `c.a.p.m.remote_video_preview` | `c.a.p.m.photopicker.RemoteVideoPreviewProvider` |
| `c.a.p.m.module.androidx-startup` | `androidx.startup.InitializationProvider` |

#### Services
- `c.G.a.p.m.module/c.a.p.m.fuse.ExternalStorageServiceImpl`
    + Action: `android.service.storage.ExternalStorageService`
    + Permission: `android.permission.BIND_EXTERNAL_STORAGE_SERVICE`



### MediaProviderLegacy
**`com.android.providers.media`**

```
adb shell pm list packages -f -U com.android.providers.media

# package:
#    /system/priv-app/MediaProviderLegacy/MediaProviderLegacy.apk=
#    com.android.providers.media
#    uid:10072
```

[`adb shell dumpsys package com.android.providers.media`](https://paste.googleplex.com/5307404834045952?raw)

#### CP Authorities / CPs

| Authority | CP |
| --------- | -- |
| `media_legacy` | `com.android.providers.media/.LegacyMediaProvider` |



### MediaProvider APEX Package
**`com.google.android.mediaprovider`**

``` 
adb shell pm list packages --apex-only -f -U com.google.android.mediaprovider

# package:
#     /data/apex/decompressed/com.android.mediaprovider@990090000.decompressed.apex=
#     com.google.android.mediaprovider
```

[`adb shell dumpsys package com.google.android.mediaprovider`](https://paste.googleplex.com/6213197129318400?raw)



## Building and Deploying

### MediaProvider Priv-App Only
This method is suitable for quickly deploying light-weight changes to MediaProvider app (e.g. UI changes).

The idea is to buld and install `MediaProviderGoogle.apk`, whithout even so much as restarting the plarform (`abd shell stop && adb shell start`).
```
m MediaProviderGoogle && \
    installmod MediaProviderGoogle

# Alternatively call adb install "directly":
# adb install $ANDROID_PRODUCT_OUT/system/priv-app/MediaProviderGoogle/MediaProviderGoogle.apk 
```

However, this installs the APK to `/data/` which means that the app is no longer able to access `/system/lib64`, resulting in:
```
E/linker: library "/system/lib64/libfuse_jni.so" ("/system/lib64/libfuse_jni.so") needed or dlopened by "/apex/com.android.art/lib64/libnativeloader.so" is not accessible for the namespace: [name="classloader-namespace", ld_library_paths="", default_library_paths="", permitted_paths="/data:/mnt/expand:/data/data/com.google.android.providers.media.module"]
E/AndroidRuntime: FATAL EXCEPTION: main
    Process: com.google.android.providers.media.module, PID: 1579
    java.lang.UnsatisfiedLinkError: dlopen failed: library "/system/lib64/libfuse_jni.so" needed or dlopened by "/apex/com.android.art/lib64/libnativeloader.so" is not accessible for the namespace "classloader-namespace"
        at java.lang.Runtime.loadLibrary0(Runtime.java:1077)
        ...
```
Same for `libfuse.so` and `libc++.so`.

Workaround:<br>
`cp` `libfuse.so`, `libfuse_jni.so` and `libc++.so` from `/system/lib64/` to where our (now installed to `/data/`) app will be able to access them, namely `/data/app/<our-pkg-code-dir>/lib/<arch>/`.

Full solution:
```
pkg="com.google.android.providers.media.module"

m MediaProviderGoogle && \
    installmod MediaProviderGoogle

lib_path=$(adb shell dumpsys package $pkg | grep "codePath=" | head -1 | sed 's/^.*codePath=//g')/lib/arm64/
adb shell mkdir -p $lib_path
adb shell cp /system/lib64/libfuse* /system/lib64/libc++.so $lib_path
```

### MediaProvider APEX Module

#### Method 1. Run `deploy.sh` script
- Builds `com.google.android.mediaprovider` (`.capex`) `MediaProviderLegacy` (`.apk`)
- `adb sync`-s (as well as `remount`-s and `stop`/`start`-s)
- Remounts `/apex/com.android.mediaprovider*`

```
croot && packages/providers/MediaProvider/deploy.sh
```

#### Method 2: Build and install APEX package then... reboot(!)
- Builds and installs APEX package
- Requires `reboot`!

```
OVERRIDE_PRODUCT_COMPRESSED_APEX=false m com.google.android.mediaprovider &&\
adb install $OUT/system/apex/com.google.android.mediaprovider.apex &&\

adb reboot
```

##### Notes
- Need to set `OVERRIDE_PRODUCT_COMPRESSED_APEX=false` because otherwise we'll get `.capex` (compressed apex), which `adb` won't know how to `install`
    + Alternatively may look for `.apex` in `out/soong/.intermediates/packages/providers/MediaProvider` and install that one
```
adb install out/soong/.intermediates/packages/providers/MediaProvider/apex/com.android.mediaprovider/android_common_com.google.android.mediaprovider_com.android.mediaprovider_image/com.google.android.mediaprovider.apex
```
- Could NOT use `installmod com.google.android.mediaprovider` since it always points to a `.capex` file.


#### Method 3: Use `banchan` and... reboot(!)
- The recommended way to build and install APEX packages - [go/mainline-local-build#build-install-local-module](https://goto.google.com/mainline-local-build#build-install-local-module)
- Requires `reboot`!

```
banchan com.google.android.mediaprovider mainline_modules_arm64
UNBUNDLED_BUILD_SDKS_FROM_SOURCE=true m apps_only dist # UNBUNDLED_BUILD_SDKS_FROM_SOURCE for b/214342201
adb install out/dist/com.google.android.mediaprovider.apex
adb reboot
```

### Flash OS with `flashall.sh`
The safest method, but... may take the time in the world...

```
croot && m && vendor/google/tools/flashall
```



# Testing

TODO



# DocumentsUI

## Packages
**com.google.android.documentsui**
<br>
*com.google.android.documentsui.theme.pixel*

```
adb shell pm list package -f -U com.google.android.documentsui
# package:
#    /system/priv-app/DocumentsUIGoogle/DocumentsUIGoogle.apk=
#   com.google.android.documentsui 
#   uid:10083
#
# package:
#   /product/overlay/PixelDocumentsUIGoogleOverlay/PixelDocumentsUIGoogleOverlay.apk=
#   com.google.android.documentsui.theme.pixel 
#   uid:10013
```

[`adb shell dumpsys package com.google.android.documentsui`](https://paste.googleplex.com/5554791668252672?raw)
<br>
[`adb shell dumpsys package com.google.android.documentsui.theme.pixel`](https://paste.googleplex.com/5321275034566656?raw)

#### Activities

##### `c.a.p.m.photopicker.PhotoPickerActivity`
- `android.intent.action.GET_CONTENT`
    + **`priority="100"`**
    + `*/*`
- 5x`<activity>` + 2x`<activity-alias>` more



## Building and Deploying

### Method 1: `adb install` to `/data/app`
```bash
m DocumentsUIGoogle && \
    installmod DocumentsUIGoogle
# Aternatively:
# adb install $ANDROID_PRODUCT_OUT/system/priv-app/DocumentsUIGoogle/DocumentsUIGoogle.apk
```

### Method 2: `adb sync`
- Requires `adb remount` (`syswrite`)

```bash
# optionally:
# m installclean

m DocumentsUIGoogle && \
    adb shell stop && \
    adb sync system && \
    adb shell start
```


# Launching PhotoPicker and DocumentsUI

#### `PICK_IMAGES`
```
adb shell am start \
    -a android.provider.action.PICK_IMAGES
```

- `com.google.android.documentsui/com.android.documentsui.picker.PickActivity`

#### `PICK_IMAGES` + `image/*`
```
adb shell am start \
    -a android.provider.action.PICK_IMAGES \
    -t image/*
```

- `com.google.android.documentsui/com.android.documentsui.picker.PickActivity`

#### `PICK_IMAGES` + `video/*`
```
adb shell am start \
    -a android.provider.action.PICK_IMAGES \
    -t video/*
```

- `com.google.android.documentsui/com.android.documentsui.picker.PickActivity`

#### `GET_CONTENT`
```
adb shell am start \
    -a android.intent.action.GET_CONTENT
```
```
adb shell am start \
    -a android.intent.action.GET_CONTENT \
    -c android.intent.category.OPENABLE \
```

- `Error: Activity not started, unable to resolve Intent { act=android.intent.action.GET_CONTENT flg=0x10000000 }`

#### `GET_CONTENT` + `image/*`
```
adb shell am start \
    -a android.intent.action.GET_CONTENT \
    -t image/*
```
```
adb shell am start \
    -a android.intent.action.GET_CONTENT \
    -c android.intent.category.OPENABLE \
    -t image/*
```

- `com.google.android.documentsui/com.android.documentsui.picker.PickActivity`

#### `GET_CONTENT` + `video/*`
```
adb shell am start \
    -a android.intent.action.GET_CONTENT \
    -t video/*
```
```
adb shell am start \
    -a android.intent.action.GET_CONTENT \
    -c android.intent.category.OPENABLE \
    -t video/*
```

- `com.google.android.documentsui/com.android.documentsui.picker.PickActivity`



# Env Setup
```bash
# MediaProviderGoogle package name:
mpgapp="com.google.android.providers.media.module"
# DocumentsUI package name:
docsui="com.google.android.documentsui"

# Make-push MediaProvider app
function mp-mpapp() {
    pkg="com.google.android.providers.media.module"

    m MediaProviderGoogle && \
        installmod MediaProviderGoogle

    lib_path=$(adb shell dumpsys package $pkg | grep "codePath=" | head -1 | sed 's/^.*codePath=//g')/lib/arm64/
    adb shell mkdir -p $lib_path
    adb shell cp /system/lib64/libfuse* /system/lib64/libc++.so $lib_path
}

# Make-push DocumentsUI
function mp-docsui() {
    m DocumentsUIGoogle && \
        adb shell stop && \
        adb sync system && \
        adb shell start
}

# Launch PICK_IMAGES:images/* intent
alias start-pick-images="
    adb shell am start \
        -a android.provider.action.PICK_IMAGES \
        -t image/*"
alias startpi="start-pick-images"

# Launch GET_CONTENT:images/* intent
alias start-get-content="\
    adb shell am start \
        -a android.intent.action.GET_CONTENT \
        -t image/*"
alias startgc="start-get-content"

# Force-stop MediaProvider
alias force-stop-mp="adb shell am force-stop com.google.android.providers.media.module"

# Enable/Disable GET_CONTENT takeover:
alias take-over-get-content="adb shell device_config put storage_native_boot take_over_get_content"
# usage:
# take-over-get-content true
# take-over-get-content false
```
