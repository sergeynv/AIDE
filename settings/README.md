### SDKs

`Java 8`
- Type: `JavaSDK`
- Version: `version 1.8.0_152`
- Path: `/android/master/prebuilts/jdk/jdk8/linux-x86`

`Java 11`
- Type: `JavaSDK`
- Version: `version 11.0.12`
- Path: `/usr/lib/jvm/java-1.11.0-openjdk-amd64`

`Android API 31 Platform`
- Type: `Android SDK`
- Version: `version 11.0.12`
- Path: `$USER_HOME$/android-sdk`



### Keymaps
- Import `exports/keymaps.zip`
- `Settings > Keymap`
  - IntelliJ: `sergeynv (GNOME-based)`
  - AS: `sergeynv-as (GNOME-based)`



### Code Styles

#### Setup
`Setting > Editor > Code Style > Scheme: > (Stored in IDE) > AIDE`

```
~/.config/JetBrains/IdeaIC2021.2/codestyles/AIDE.xml -> ~/Desktop/AIDE/settings/codestyle_AIDE.xml
```

#### Fix Java code style
`Setting > Editor > Code Style > Java > Set from... (link, on the right side) > Android`

#### Android Code Style
- [development/ide/intellij/codestyles/AndroidStyle.xml](https://source.corp.google.com/android/development/ide/intellij/codestyles/AndroidStyle.xml)
- [tools/asuite/aidegen/data/AndroidStyle_aidegen.xml](https://source.corp.google.com/android/tools/asuite/aidegen/data/AndroidStyle_aidegen.xml)

#### Kotlin
```
/android/master/prebuilts/ktlint/ktlint.py --format --file \
  tests/tests/companion/src/android/companion/cts/DeviceProfilesTest.kt \ 
  tests/tests/companion/src/android/companion/cts/RecordingCallback.kt
```



### Color Scheme
`Setting > Editor > Color Scheme > AIDE-Dracula`

```
~/.config/JetBrains/IdeaIC2021.2/colors/AIDE-Dracula.icls -> ~/Desktop/AIDE/settings/colors_AIDE-Dracula.icls
```



### Android Logcat

#### Filters
Stored in `$PROJECT_HOME/.idea/workspace.xml`:
```xml
<project version="4">
  <component name="AndroidConfiguredLogFilters">
    <filters>
      <filter>
        <option name="logLevel" value="verbose" />
        <option name="logMessagePattern" value="" />
        <option name="logTagPattern" value="sergeynv" />
        <option name="name" value="sergeynv" />
        <option name="packageNamePattern" value="" />
      </filter>
      ...
    </filters>
  </component>
  ...
</project>  
```
Template stored in `AIDE/settings/logcat_filters.xml`

#### Colors
`Setting > Editor > Color Scheme > Android Logcat > AIDE`

Verbose		`#BBBBBB` (Light Grey)
Debug		  `#5394EC` (Dark Blue)
Info 		  `#5C962C` (Green)
Warning		`#EFC510` (Yellow)
Error		  `#FF6B68` (Red)
Assert		`#D2500B` (Orange)
