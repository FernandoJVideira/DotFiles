#!/usr/bin/env sh

sketchybar --add   space          space_template left                \
           --set   space_template icon.highlight_color=0xff9dd274    \
                                  label.drawing=off                  \
                                  drawing=off                        \
                                  updates=on                         \
                                  associated_display=1               \
                                  label.font="$FONT:Black:13.0"      \
                                  icon.font="$FONT:Bold:17.0"        \
                                  script="$PLUGIN_DIR/space.sh"      \
                                  icon.padding_right=6               \
                                  icon.padding_left=2                \
                                  background.padding_left=2          \
                                  background.padding_right=2         \
                                  icon.background.height=2           \
                                  icon.background.color=$ICON_COLOR  \
                                  icon.background.color=$ICON_COLOR  \
                                  icon.background.y_offset=-13       \
                                  click_script="$SPACE_CLICK_SCRIPT" \
                                                                     \
           --clone spaces_1.label label_template                     \
           --set   spaces_1.label label=spc                          \
                                  label.width=38                     \
                                  label.align=center                 \
                                  associated_display=1               \
                                  position=left                      \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.code  space_template                     \
           --set   spaces_1.code  associated_space=1                 \
                                  icon=$SPACES_CODE                  \
                                  icon.highlight_color=$GREEN        \
                                  icon.background.color=$GREEN       \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.term  space_template                     \
           --set   spaces_1.term  associated_space=2                 \
                                  icon=$SPACES_TERM                  \
                                  icon.highlight_color=$ORANGE       \
                                  icon.background.color=$ORANGE      \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.web   space_template                     \
           --set   spaces_1.web   associated_space=3                 \
                                  icon=$SPACES_WEB                   \
                                  icon.highlight_color=$BLUE         \
                                  icon.background.color=$BLUE        \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.doc   space_template                     \
           --set   spaces_1.doc   associated_space=4                 \
                                  icon=$SPACES_DOC                   \
                                  icon.highlight_color=$RED          \
                                  icon.background.color=$RED         \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.music space_template                     \
           --set   spaces_1.music associated_space=5                 \
                                  icon=$SPACES_MUSIC                 \
                                  icon.highlight_color=$YELLOW       \
                                  icon.background.color=$YELLOW      \
                                  drawing=on                         \
                                                                     \
           --clone spaces_1.misc  space_template                     \
           --set   spaces_1.misc  associated_space=6                 \
                                  icon=$SPACES_MISC                  \
                                  icon.highlight_color=$MAGENTA      \
                                  icon.background.color=$MAGENTA     \
                                  drawing=on                         \
