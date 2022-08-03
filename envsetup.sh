# JetBrains
__JETBRAINS_CONFIGS="${HOME}/.config/JetBrains"

alias jb-configs="cd ${__JETBRAINS_CONFIGS}"


# IntelliJ IDEA
__INTELLIJ_IDEA_VERSION="2021.3" # /opt/intellij-ce-2021.3
__INTELLIJ_IDEA_CONFIGS="${__JETBRAINS_CONFIGS}/IdeaIC${__INTELLIJ_IDEA_VERSION}"

alias idea="/opt/intellij-ce-${__INTELLIJ_IDEA_VERSION}/bin/idea.sh"
alias idea-stable="/opt/intellij-ce-stable/bin/idea.sh"

alias idea-version="echo ${__INTELLIJ_IDEA_VERSION}"
alias idea-bins="ls -ld /opt/intellij-ce-*"

alias idea-configs="cd ${__INTELLIJ_IDEA_CONFIGS}"
alias idea-paths="subl ${__INTELLIJ_IDEA_CONFIGS}/options/path.macros.xml"


# Android Studio with Blaze
__ASwB_VERSION="2020.3" # /opt/android-studio-with-blaze-2020.3

alias aswb="/opt/android-studio-with-blaze-${__ASwB_VERSION}/bin/studio.sh"
alias aswb-stable="/opt/android-studio-with-blaze-stable/bin/studio.sh"

alias aswb-version="echo ${__ASwB_VERSION}"
alias aswb-bins="ls -ld /opt/android-studio-with-blaze-*"

alias aswb-configs="echo '\"aswb-configs\" alias not set up'"
alias aswb-paths="echo '\"aswb-paths\" alias not set up'"


# AIDE
__AIDE_HOME="${HOME}/Desktop/AIDE"

alias croot="cd ${__AIDE_HOME}"

# NOTE: may actually want to launch IDEA with `fw-base &> /dev/null &`
alias fw-base="idea ${__AIDE_HOME}/intellij-projects/frameworks-base"
alias cts="idea ${__AIDE_HOME}/intellij-projects/cts"
alias cdm="idea ${__AIDE_HOME}/intellij-projects/cdm"
alias storage="idea ${__AIDE_HOME}/intellij-projects/storage"
