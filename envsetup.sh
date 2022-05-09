__AIDE_HOME="/usr/local/google/home/sergeynv/Desktop/AIDE"

# /opt/intellij-ce-2021.2
__INTELLIJ_CE_VERSION="2021.2"
# /opt/android-studio-with-blaze-2020.3
__ANDROID_STUDIO_WITH_BLAZE_VERSION="2020.3"

__JETBRAINS_CONFIGS="/usr/local/google/home/sergeynv/.config/JetBrains"
__INTELLIJ_IDEA_CONFIGS="${__JETBRAINS_CONFIGS}/IdeaIC${__INTELLIJ_CE_VERSION}"



alias croot="cd ${__AIDE_HOME}"
alias cconfig="cd ${__JETBRAINS_CONFIGS}"
alias paths="subl ${__INTELLIJ_IDEA_CONFIGS}/options/path.macros.xml"



alias idea="/opt/intellij-ce-${__INTELLIJ_CE_VERSION}/bin/idea.sh"
alias idea-stable="/opt/intellij-ce-stable/bin/idea.sh"

alias ast="/opt/android-studio-with-blaze-${__ANDROID_STUDIO_WITH_BLAZE_VERSION}/bin/studio.sh"
alias ast-stable="/opt/android-studio-with-blaze-stable/bin/studio.sh"



alias base="idea ${__AIDE_HOME}/master/core+services"
alias cdm="idea ${__AIDE_HOME}/master/cdm"
alias cts="idea ${__AIDE_HOME}/master/cts"
