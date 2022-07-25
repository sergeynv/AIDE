# JetBrains
__JETBRAINS_CONFIGS="${HOME}/.config/JetBrains"

alias jb-configs="cd ${__JETBRAINS_CONFIGS}"


# IntelliJ IDEA
__INTELLIJ_IDEA_VERSION="2021.3" # /opt/intellij-ce-2021.3
__INTELLIJ_IDEA_CONFIGS="${__JETBRAINS_CONFIGS}/IdeaIC${__INTELLIJ_IDEA_VERSION}"

alias idea="/opt/intellij-ce-${__INTELLIJ_IDEA_VERSION}/bin/idea.sh"
alias idea-version="echo ${__INTELLIJ_IDEA_VERSION}"
alias idea-configs="cd ${__INTELLIJ_IDEA_CONFIGS}"
alias idea-paths="subl ${__INTELLIJ_IDEA_CONFIGS}/options/path.macros.xml"

alias idea-bins="ls -ld /opt/intellij-ce-*"
alias idea-stable="/opt/intellij-ce-stable/bin/idea.sh"

function idea-link-configs() {
    __exec mkdir -p ${__INTELLIJ_IDEA_CONFIGS}/options
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/sdks.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/options/jdk.table.xml
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/paths.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/options/path.macros.xml
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/editor.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/options/editor.xml
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/editor-font.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/options/editor-font.xml

    __exec mkdir -p ${__INTELLIJ_IDEA_CONFIGS}/codestyles
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/codestyle_AIDE.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/codestyles/AIDE.xml

    __exec mkdir -p ${__INTELLIJ_IDEA_CONFIGS}/colors
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/colors_AIDE-Dracula.icls \
        ${__INTELLIJ_IDEA_CONFIGS}/colors/AIDE-Dracula.icls

    __exec mkdir -p ${__INTELLIJ_IDEA_CONFIGS}/keymaps
    __exec ln -sf \
        ${__AIDE_HOME}/intellij-settings/configs/keymap-sergeynv-linux-gnome-based.xml \
        ${__INTELLIJ_IDEA_CONFIGS}/keymaps/'sergeynv\ _GNOME-based_.xml'
}

# Android Studio with Blaze
__ASwB_VERSION="2020.3" # /opt/android-studio-with-blaze-2020.3

alias aswb="/opt/android-studio-with-blaze-${__ASwB_VERSION}/bin/studio.sh"
alias aswb-version="echo ${__ASwB_VERSION}"
alias aswb-configs="echo '\"aswb-configs\" alias not set up'"
alias aswb-paths="echo '\"aswb-paths\" alias not set up'"

alias aswb-bins="ls -ld /opt/android-studio-with-blaze-*"
alias aswb-stable="/opt/android-studio-with-blaze-stable/bin/studio.sh"


# AIDE
__AIDE_HOME="${HOME}/Desktop/AIDE"

alias croot="cd ${__AIDE_HOME}"

alias base="idea ${__AIDE_HOME}/intellij-projects/core+services"
alias cdm="idea ${__AIDE_HOME}/intellij-projects/cdm"
alias cts="idea ${__AIDE_HOME}/intellij-projects/cts"


# Utilities
__EXEC_DRY_RUN=0
function __exec() {
   cmd="$@"
   echo $cmd

   if [[ __EXEC_DRY_RUN -eq 0 ]]; then
      $cmd
   fi
}
