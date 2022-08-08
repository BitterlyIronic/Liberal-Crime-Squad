#!/bin/fish
#example LCS starter script for fish, using the alacritty terminal
set -l font_family "droid sans mono"

alacritty \
    -o window.dimensions.columns=80 \
    -o window.dimensions.lines=25 \
    -o font.normal.family=$font_family \
    -o font.bold.family=$font_family \
    -o font.italic.family=$font_family \
    -o font.bold_italic.family=$font_family \
    -o font.size=16 \
    -o draw_bold_text_with_bright_colors=true \
    -t="Liberal Crime Squad" \
    -e sh -c "seticon -id \"\$WINDOWID\" icon.png && ./crimesquad" &
