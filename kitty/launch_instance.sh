#!/bin/bash

if [[ "$OSTYPE" == 'darwin'* ]]; then
    PATH="/Applications/kitty.app/Contents/MacOS:$PATH"

    # Adapted a few changes from @yanzhang0219's script to leverage yabai
    # signals to move the new kitty window to the focused display, rather than
    # the display the first kitty window was launched from.
    # - https://github.com/koekeishiya/yabai/issues/413#issuecomment-604072616
    # - https://github.com/koekeishiya/yabai/wiki/Commands#automation-with-rules-and-signals
    FOCUSED_WINDOW=$(yabai -m query --windows --window)
    FOCUSED_WINDOW_DISPLAY=$(<<< "$FOCUSED_WINDOW" jq '.display')
    FOCUSED_WINDOW_ID=$(<<< "$FOCUSED_WINDOW" jq '.id')
    yabai -m signal --add \
        action="yabai -m signal --remove temp_move_kitty;
                YABAI_WINDOW_DISPLAY=\$(yabai -m query --windows --window $YABAI_WINDOW_ID | jq '.display');
                if ! [[ \$YABAI_WINDOW_DISPLAY == $FOCUSED_WINDOW_DISPLAY ]]; then
                    yabai -m window \$YABAI_WINDOW_ID --warp $FOCUSED_WINDOW_ID;
                    yabai -m window --focus \$YABAI_WINDOW_ID;
                fi" \
        app=kitty \
        event=window_created \
        label=temp_move_kitty
fi

kitty --single-instance --directory ~

