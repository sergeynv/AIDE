# TODO: could be a good idea to make sure this matches the value of Idea's $ANDROID_TREE$
#  path variable.
export ANDROID_TREE='/android/master'

# JetBrains
__JETBRAINS_CONFIGS="${HOME}/.config/JetBrains"

alias jb-configs="cd ${__JETBRAINS_CONFIGS}"


# IntelliJ IDEA
__INTELLIJ_IDEA_VERSION="2022.1"
__INTELLIJ_IDEA_PATH="/opt/intellij-ce-${__INTELLIJ_IDEA_VERSION}"
__INTELLIJ_IDEA_CONFIGS="${__JETBRAINS_CONFIGS}/IdeaIC${__INTELLIJ_IDEA_VERSION}"

alias idea="${__INTELLIJ_IDEA_PATH}/bin/idea.sh"
alias idea-stable="/opt/intellij-ce-stable/bin/idea.sh"

alias idea-kill="killall ${__INTELLIJ_IDEA_PATH}/jbr/bin/java"

alias idea-version="echo ${__INTELLIJ_IDEA_VERSION}"
alias idea-ls-installed="ls -ld /opt/intellij-ce-*"

alias idea-cd-configs-dir="cd ${__INTELLIJ_IDEA_CONFIGS}"
alias idea-open-paths-config="open ${__INTELLIJ_IDEA_CONFIGS}/options/path.macros.xml"

# Android Studio with Blaze
__ASwB_VERSION="2020.3" # /opt/android-studio-with-blaze-2020.3

alias aswb="/opt/android-studio-with-blaze-${__ASwB_VERSION}/bin/studio.sh"
alias aswb-stable="/opt/android-studio-with-blaze-stable/bin/studio.sh"

alias aswb-version="echo ${__ASwB_VERSION}"
alias aswb-ls-installed="ls -ld /opt/android-studio-with-blaze-*"

alias idea-cd-configs-dir="echo '\"aswb-configs\" alias not set up'"
alias aswb-open-paths-config="echo '\"aswb-paths\" alias not set up'"

# AIDE
__AIDE_HOME="${HOME}/Desktop/AIDE"

alias cdaide="cd ${__AIDE_HOME}"

alias fw-base="idea ${__AIDE_HOME}/intellij-projects/frameworks-base"
alias cts="idea ${__AIDE_HOME}/intellij-projects/cts"
alias cdm="idea ${__AIDE_HOME}/intellij-projects/cdm"
