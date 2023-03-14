# Source AIDE/envsetup.sh before running this
function link-aide-configs() {
    src="${__AIDE_HOME}/intellij-settings/configs"
    
    dest="${__INTELLIJ_IDEA_CONFIGS}/options"
    __exec mkdir -p ${dest}
    __exec ln -sf \
        ${src}/sdks.xml \
        ${dest}/jdk.table.xml
    __exec ln -sf \
        ${src}/paths.xml \
        ${dest}/path.macros.xml
    __exec ln -sf \
        ${src}/editor.xml \
        ${dest}/editor.xml
    __exec ln -sf \
        ${src}/editor-font.xml \
        ${dest}/editor-font.xml

    dest="${__INTELLIJ_IDEA_CONFIGS}"
    __exec mkdir -p ${dest}/codestyles
    __exec ln -sf \
        ${src}/codestyle_AIDE.xml \
        ${dest}/codestyles/AIDE.xml

    __exec mkdir -p ${dest}/colors
    __exec ln -sf \
        ${src}/colors_AIDE-Dracula.icls \
        ${dest}/colors/AIDE-Dracula.icls

    __exec mkdir -p ${dest}/keymaps
    __exec ln -sf \
        ${src}/keymap-sergeynv-linux-gnome-based.xml \
        ${dest}/keymaps/'sergeynv\ _GNOME-based_.xml'
}


__EXEC_DRY_RUN=1
function __exec() {
   cmd="$@"
   echo $cmd
}

link-aide-configs()
