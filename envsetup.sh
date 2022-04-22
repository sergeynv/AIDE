__AIDE_HOME="/usr/local/google/home/sergeynv/Desktop/AIDE"

__CONFIG_JETBRAINS="/usr/local/google/home/sergeynv/.config/JetBrains"

__IDEA_VERSION="IdeaIC2021.3"
__CONFIG_IDEA="${__CONFIG_JETBRAINS}/${__IDEA_VERSION}"

alias croot="cd ${__AIDE_HOME}"
alias cconfig="cd ${__CONFIG_JETBRAINS}"
alias paths="subl ${__CONFIG_IDEA}/options/path.macros.xml"

alias idea="/opt/intellij-ce-stable/bin/idea.sh"
alias ast="/opt/android-studio-with-blaze-stable/bin/studio.sh"

alias base="idea ${__AIDE_HOME}/master/core+services"
alias cdm="idea ${__AIDE_HOME}/master/cdm"
alias cts="idea ${__AIDE_HOME}/master/cts"
