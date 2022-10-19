noinst_LIBRARIES = libpdcurses.a
libpdcurses_a_SOURCES = pdcurses/addch.c pdcurses/addchstr.c pdcurses/addstr.c pdcurses/attr.c \
    pdcurses/beep.c pdcurses/bkgd.c pdcurses/border.c pdcurses/clear.c pdcurses/color.c pdcurses/debug.c \
    pdcurses/delch.c pdcurses/deleteln.c pdcurses/getch.c pdcurses/getstr.c \
    pdcurses/getyx.c pdcurses/inch.c pdcurses/inchstr.c pdcurses/initscr.c pdcurses/inopts.c \
    pdcurses/insch.c pdcurses/insstr.c pdcurses/instr.c pdcurses/kernel.c pdcurses/keyname.c \
    pdcurses/mouse.c pdcurses/move.c pdcurses/outopts.c pdcurses/overlay.c pdcurses/pad.c \
    pdcurses/panel.c pdcurses/printw.c pdcurses/refresh.c pdcurses/scanw.c pdcurses/scr_dump.c \
    pdcurses/scroll.c pdcurses/slk.c pdcurses/termattr.c pdcurses/touch.c pdcurses/util.c pdcurses/window.c \
    curspriv.h

libpdcurses_a_CFLAGS = -DPDC_WIDE

if WITH_XCURSES
    libpdcurses_a_CFLAGS += -DXCURSES -I/usr/include/X11
    libpdcurses_a_SOURCES += x11/pdcclip.c x11/pdcdisp.c x11/pdcgetsc.c x11/pdckbd.c x11/pdcscrn.c x11/pdcsetsc.c x11/pdcutil.c x11/sb.c x11/scrlbox.c
else
    libpdcurses_a_SOURCES += sdl2/pdcclip.c sdl2/pdcdisp.c sdl2/pdcgetsc.c sdl2/pdckbd.c sdl2/pdcscrn.c sdl2/pdcsetsc.c sdl2/pdcutil.c
endif