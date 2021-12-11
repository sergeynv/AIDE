### Launch

Launch `stable`
```
/opt/intellij-ce-stable/bin/idea.sh

# With "master/framework+services" project
/opt/intellij-ce-stable/bin/idea.sh /usr/local/google/home/sergeynv/Desktop/AIDE/master/core+services

# With "master/cdm" project
/opt/intellij-ce-stable/bin/idea.sh /usr/local/google/home/sergeynv/Desktop/AIDE/master/cdm

# With "master/cts" project
/opt/intellij-ce-stable/bin/idea.sh /usr/local/google/home/sergeynv/Desktop/AIDE/master/cts
```


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


### Code Styles

#### Setup

`Setting > Editor > Code Style > Scheme: > (Stored in IDE) > AIDE`

```
~/.config/JetBrains/IdeaIC2021.2/codestyles/AIDE.xml -> ~/Desktop/AIDE/codestyle_AIDE.xml
```

#### Fix Java code style
`Setting > Editor > Code Style > Java > Set from... (link, on the right side) > Android`

#### Android Code Style
- [development/ide/intellij/codestyles/AndroidStyle.xml](https://source.corp.google.com/android/development/ide/intellij/codestyles/AndroidStyle.xml)
- [tools/asuite/aidegen/data/AndroidStyle_aidegen.xml](https://source.corp.google.com/android/tools/asuite/aidegen/data/AndroidStyle_aidegen.xml)
