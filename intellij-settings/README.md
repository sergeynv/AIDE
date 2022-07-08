## Configs
- `${__INTELLIJ_IDEA_CONFIGS}` (E.g.: `~/.config/JetBrains/IdeaIC2021.2`)
   - `options/jdk.table.xml` -> `intellij-settings/configs/sdks.xml`
   - `options/path.macros.xml` -> `intellij-settings/configs/paths.xml`
      - `ANDROID_TREE`
         - Custom!
      - `KOTLIN_BUNDLED` 
         - Might depend on version! (E.g.: `~/.local/share/JetBrains/IdeaIC2021.2/Kotlin/kotlinc`)
      - `MAVEN_REPOSITORY`
   - `codestyles/AIDE.xml` -> `intellij-settings/configs/codestyle_AIDE.xml`
   - `colors/AIDE-Dracula.icls` -> `intellij-settings/configs/colors_AIDE-Dracula.icls`
   - `keymaps/'sergeynv _GNOME-based_.xml'` -> `intellij-settings/configs/keymap-sergeynv-linux-gnome-based.xml`
- Run: `. envsetup.sh && idea-link-configs`

## SDKs
- Setup
   - `${__INTELLIJ_IDEA_CONFIGS}/options/jdk.table.xml -> ${__AIDE_HOME}/intellij-settings/configs/sdks.xml`
      - Java 8 (Android): `$ANDROID_TREE$/prebuilts/jdk/jdk8/linux-x86`
      - Java 11 (Android): `$ANDROID_TREE$/prebuilts/jdk/jdk11/linux-x86`
      - Java 11 (usr-lib): `/usr/lib/jvm/java-1.11.0-openjdk-amd64`
      - Android API 31 Platform: `$USER_HOME$/android-sdk`


## Keymaps
- Import `exports/keymaps.zip`
- `Settings > Keymap`
  - IntellijIDEA: `sergeynv (GNOME-based)`
  - ASwB: `sergeynv-as (GNOME-based)` 


## Code Styles
- Setup
   - `Setting > Editor > Code Style > Scheme: > (Stored in IDE) > AIDE`
   - `${__INTELLIJ_IDEA_CONFIGS}/codestyles/AIDE.xml -> ${__AIDE_HOME}/intellij-settings/codestyle_AIDE.xml`
- Fix Java code style
   - `Setting > Editor > Code Style > Java > Set from... (link, on the right side) > Android`
- Android Code Style
   - [development/ide/intellij/codestyles/AndroidStyle.xml](https://source.corp.google.com/android/development/ide/intellij/codestyles/AndroidStyle.xml)
   - [tools/asuite/aidegen/data/AndroidStyle_aidegen.xml](https://source.corp.google.com/android/tools/asuite/aidegen/data/AndroidStyle_aidegen.xml)
- Format Kotlin code (outside of IntellijIDEA/ASwB)
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
   - Template in `${__AIDE_HOME}/intellij-settings/logcat_filters.xml`
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
