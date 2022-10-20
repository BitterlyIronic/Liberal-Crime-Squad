## Liberal Crime Squad

Welcome to Liberal Crime Squad! The Conservatives have taken the Executive, Legislative, and Judicial branches of government. Over time, the Liberal laws of this nation will erode and turn the country into a BACKWOODS YET CORPORATE NIGHTMARE. To prevent this from happening, the Liberal Crime Squad was established. The mood of the country is shifting, and we need to turn things around. Go out on the streets and indoctrinate Conservative automatons. That is, let them see their True Liberal Nature. Then arm them and send them forth to Stop Evil.

This version of Liberal Crime Squad is an unofficial transfer from SourceForge. A full list of authors is available in AUTHORS.

Read [COMPILE_README.txt](COMPILE_README.txt) for instructions on how to compile on all platforms.

## This Repo

This repo is a fork of [4.10.1](https://github.com/Kamal-Sadek/Liberal-Crime-Squad), which is the last version/fork of vanilla LCS that compiles for Linux. There are a few Linux specific tweaks and whatever other little changes I thought would be nice.

The changes so far:

- The game respects the XDG Base Directory specification
    - The default save directory is now ~/.local/share/lcs
    - If the XDG_DATA_HOME environment variable is set it'll be stored there instead
- When your Liberals are studying, it displays what topic they're actually studying.
    - Pulled from a pull request on the 4.10.1 repository
- Defaults to [PDCurses](https://www.pdcurses.org) over ncurses
    - This means the game will run in its own window instead of running inside a terminal
    - Source for PDCurses is included in the repo and automagically built and statically linked in using autotools
        - Bundled source is from PDCurses 3.9, with a backported fix for window focus in XCurses
    - Builds against the SDL2 port of PDCurses by default
        - Running `./configure --with-xcurses` after bootstrapping will build and link the X11 port of PDCurses instead
            - XCurses is a bit snappier, but doesn't have TTF font support
    - The code within the /src/pdcurses directory is in the public domain, with the exception of the files called out in the /src/pdcurses/x11 README file
    - Running `./configure --with-ncurses` will build the ncurses version of the game against ncurses6
        - This also skips building PDCurses entirely
- Music can be disabled at compile time with `./configure --disable-music`
    - This will also remove all the music options
- Probably doesn't compile for Windows anymore, but the original repo will work fine for that anyway

## Augmentations

This version of Liberal Crime Squad includes changes such as small bug fixes, game mechanic tweaks so that it plays better, and new features, such as the new Augmentation system!

The fight against the Conservative Swine is a long and dangerous one, and Liberals need every advantage they can get. As we turn to modern technology, we find yet another way to help the Liberal Cause: We can make our Liberals faster, stronger, and better than ever before through the use of Augmentations!

To tap into this newfound science, Activate a Liberal who has a science skill of 1 or greater, go into the 'D - Recruitment' menu, and '5 - Augment' task. From here, you can select a Brave Liberal Pioneer to test this new technology and advance the Liberal Cause.

## Save Files

You can now have multiple save files! When you load up LCS, you have the option to choose from previous save files or make a new one. So you can now hold the battle against the Conservative Swine in multiple dimensions!

Go Forth, and Pursue your Liberal Agenda!
