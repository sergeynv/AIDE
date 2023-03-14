# First source AIDE/envsetup.sh and then execute this 
# in the current(!) environment - `. ./link-aide-configs`
__DRY_RUN=1

function link-aide-configs() {
    src="${__AIDE_HOME}/intellij-settings/configs"
    
    dest="${__INTELLIJ_IDEA_CONFIGS}"
    # codestyles/codestyle_AIDE.xml
    __exec mkdir -p ${dest}/codestyles
    __exec ln -sf \
        ${src}/codestyle_AIDE.xml \
        ${dest}/codestyles/AIDE.xml

    # colors/colors_AIDE-Dracula.icls
    __exec mkdir -p ${dest}/colors
    __exec ln -sf \
        ${src}/colors_AIDE-Dracula.icls \
        ${dest}/colors/AIDE-Dracula.icls

    # keymaps/'sergeynv\ _GNOME-based_.xml'
    __exec mkdir -p ${dest}/keymaps
    __exec ln -sf \
        ${src}/keymap-sergeynv-linux-gnome-based.xml \
        ${dest}/keymaps/'sergeynv\ _GNOME-based_.xml'

    dest="${__INTELLIJ_IDEA_CONFIGS}/options"
    __exec mkdir -p ${dest}
    
    # options/jdk.table.xml
    __exec ln -sf \
        ${src}/sdks.xml \
        ${dest}/jdk.table.xml
    
    # options/path.macros.xml
    __exec ln -sf \
        ${src}/paths.xml \
        ${dest}/path.macros.xml
    
    # options/editor.xml
    __exec ln -sf \
        ${src}/editor.xml \
        ${dest}/editor.xml
    
    # options/editor-font.xml
    __exec ln -sf \
        ${src}/editor-font.xml \
        ${dest}/editor-font.xml

}

function __exec() {
    cmd="$@"
    echo
    echo $cmd
    if [[ __DRY_RUN -eq 0 ]] then $cmd; fi
}

link-aide-configs
