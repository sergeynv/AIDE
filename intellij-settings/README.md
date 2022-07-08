## SDKs
- Table
   - `Java 8 (Android)`
      - `$ANDROID_TREE$/prebuilts/jdk/jdk8/linux-x86`
   - `Java 11 (Android)`
      - `$ANDROID_TREE$/prebuilts/jdk/jdk11/linux-x86`
   - `Java 11 (usr-lib)`
      - `/usr/lib/jvm/java-1.11.0-openjdk-amd64`
   - `Android API 31 Platform`
      - Path: `$USER_HOME$/android-sdk`
- Setup
  - `${__INTELLIJ_IDEA_CONFIGS}/options/jdk.table.xml -> ${__AIDE_HOME}/intellij-settings/sdks.xml`

## Keymaps
- Import `exports/keymaps.zip`
- `Settings > Keymap`
  - IntelliJ: `sergeynv (GNOME-based)`
  - AS: `sergeynv-as (GNOME-based)`
  

## Code Styles
- Setup
   - `Setting > Editor > Code Style > Scheme: > (Stored in IDE) > AIDE`
   - `${__INTELLIJ_IDEA_CONFIGS}/codestyles/AIDE.xml -> ${__AIDE_HOME}/intellij-settings/codestyle_AIDE.xml`
- Fix Java code style
   - `Setting > Editor > Code Style > Java > Set from... (link, on the right side) > Android`
- Android Code Style
   - [development/ide/intellij/codestyles/AndroidStyle.xml](https://source.corp.google.com/android/development/ide/intellij/codestyles/AndroidStyle.xml)
   - [tools/asuite/aidegen/data/AndroidStyle_aidegen.xml](https://source.corp.google.com/android/tools/asuite/aidegen/data/AndroidStyle_aidegen.xml)
- Format Kotlin code (outside of IntellijIdea/ASwB)
   - `<android-tree>/prebuilts/ktlint/ktlint.py --format --file <file-pahts>`


## Appearance
- General
   - `Setting > Appearance & Behavior > Appearance`
      - Theme: *Dracula*
      - User custom font: *Cantarell*, Size: *15*
- Color Scheme
   - `${__INTELLIJ_IDEA_CONFIGS}/colors/AIDE-Dracula.icls -> ${__AIDE_HOME}/intellij-settings/colors_AIDE-Dracula.icls`
   - `Setting > Editor > Color Scheme > AIDE-Dracula`

## Android Logcat
- Filters 
   - Stored in `$PROJECT_HOME/.idea/workspace.xml`:
   - Template in `intellij-settings/logcat_filters.xml`

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

- Colors
   - `Setting > Editor > Color Scheme > Android Logcat > AIDE`
      - Verbose		`#BBBBBB` (Light Grey)
      - Debug		  `#5394EC` (Dark Blue)
      - Info 		  `#5C962C` (Green)
      - Warning		`#EFC510` (Yellow)
      - Error		  `#FF6B68` (Red)
      - Assert		`#D2500B` (Orange)
