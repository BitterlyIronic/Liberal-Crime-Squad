#!/bin/fish
#example LCS starter script for fish, using the kitty terminal
kitty \
    -o initial_window_width=80c \
    -o initial_window_height=25c \
    -o font_family="source code pro" \
    -o font_size=16 \
    -T="Liberal Crime Squad" \
    fish -c "xseticon -id \"\$WINDOWID\" icon.png && ./crimesquad" &
