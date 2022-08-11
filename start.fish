#!/bin/fish
#example LCS starter script for fish, using the alacritty terminal

#set this to your preferred font, I just like Droid Mono
#keep in mind that the width of the font determines the ultimate size of the window
set -l font_family "droid sans mono"

alacritty \
    #the game always displays in exactly 80x25 cells, so we size the window for that
    -o window.dimensions.columns=80 \
    -o window.dimensions.lines=25 \
    -o font.normal.family=$font_family \
    -o font.bold.family=$font_family \
    -o font.italic.family=$font_family \
    -o font.bold_italic.family=$font_family \
    #set the font size to whatever you'd prefer
    -o font.size=16 \
    #without this, alacritty won't display all the colors correctly
    -o draw_bold_text_with_bright_colors=true \
    -t="Liberal Crime Squad" \
    #set the working directory to the location of crimesquad and uncomment the below
    #--working-directory="/what/ever/the/path/is" \
    #optionally, you can use xseticon (if installed) to set the window icon to an LCS icon
    #-e sh -c "xseticon -id \"\$WINDOWID\" icon.png && ./crimesquad" \
    -e sh -c "./crimesquad" \
    &
