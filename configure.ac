#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])

#The following line has the program name, the program version, and the bug report address.
AC_INIT([crimesquad],[4.10.4u],[bitterlyironic@outlook.com])
AC_CONFIG_SRCDIR([src/cursesgraphics.cpp])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([subdir-objects foreign])
# Checks for programs.
AC_PROG_CC
AC_PROG_CXX
# Since we're building PDCurses
AC_PROG_RANLIB

# We're moving to the future, to C++11!
AC_CONFIG_MACRO_DIR([.])
AX_CXX_COMPILE_STDCXX_11([noext],[mandatory])

AC_ARG_WITH([xcurses],
   AS_HELP_STRING([--with-xcurses], [Build with XCurses instead of SDL PDCurses]))

AC_ARG_WITH([ncurses],
   AS_HELP_STRING([--with-ncurses], [Build with ncurses instead of SDL PDCurses]))

AC_ARG_ENABLE([resizing],
   AS_HELP_STRING([--enable-resizing], [Allow resizing the window (LCS doesn't react to window resizing)]))

AC_ARG_ENABLE([music],
   AS_HELP_STRING([--disable-music], [Disable the bundled music]))

if test "x$with_xcurses" = "xyes" && test "x$with_ncurses" = "xyes"; then
   AC_MSG_ERROR([*** Only one of XCurses and ncurses can be enabled])
fi

# Defines
# TODO: Conditionally set these depending on build system.
AC_DEFINE([UNIX],[],[Defined if on a UNIX based system])
AC_DEFINE([Linux],[],[Defined if running on Linux])
if test "x$with_xcurses" = "xyes"; then
   AC_DEFINE([XCURSES],[],[Defined if we are using XCurses])
   AC_DEFINE([PDC_WIDE],[],[Defined if we have a wide PDCurses (we always do)])
   AC_DEFINE([HAVE_WIDE_CURSES],[],[Defined if we want to try to use unicode within LCS])
elif test "x$with_ncurses" = "xyes"; then
   AC_DEFINE([NCURSES], [], [Defined if we are using ncurses])
   AC_DEFINE([HAVE_WIDE_CURSES],[],[Defined if we want to try to use unicode within LCS])
else
   AC_DEFINE([PDC_WIDE],[],[Defined if we have a wide PDCurses (we always do)])
   AC_DEFINE([SDLCURSES],[],[Defined if we are using the SDL port of PDCurses])
fi

if test "x$enable_resizing" = "xyes"; then
   AC_DEFINE([ALLOW_RESIZING], [], [Defined if the user is allowed to resize the window])
fi

# tells PDCurses if it should build the X11 or SDL backends
AM_CONDITIONAL(WITH_XCURSES, [test "x$with_xcurses" = "xyes"])

# disables PDCurses compilation if true
AM_CONDITIONAL(WITH_NCURSES, [test "x$with_ncurses" = "xyes"])

# disables music file installation if true
AM_CONDITIONAL(DISABLED_MUSIC, [test "x$enable_music" = "xno"])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h string.h sys/time.h unistd.h])

# check for ncursesw
if test "x$with_ncurses" = "xyes"; then
   AC_PATH_PROG(NCURSES_CONFIG, ncursesw6-config)
   if test -n "$NCURSES_CONFIG"; then
      LIBS="$LIBS `$NCURSES_CONFIG --libs`"
      CPPFLAGS="$CPPFLAGS `$NCURSES_CONFIG --cflags`"
   else
      AC_MSG_ERROR([*** Unable to find ncurses])
   fi
fi

# Include SDL2 and SDL2_mixer, or define DISABLE_MUSIC as a fallback if they aren't available, so it still compiles.
if test "x$enable_music" != "xno" || (test "x$with_ncurses" != "xyes" && test "x$with_xcurses" != "xyes"); then
   AC_PATH_PROG(SDL_CONFIG, sdl2-config)
   if test -n "$SDL_CONFIG"; then
      LIBS="$LIBS `$SDL_CONFIG --libs`"
      CPPFLAGS="$CPPFLAGS `$SDL_CONFIG --cflags`"
   else
      AC_MSG_ERROR([*** Unable to find SDL2])
   fi
fi

if test "x$enable_music" != "xno"; then
   AC_CHECK_LIB([SDL2_mixer], [Mix_OpenAudio], ,
      AC_MSG_WARN([ *** Unable to find SDL2_mixer library (http://www.libsdl.org/projects/SDL_mixer/)]) ; LACK_SDL2=1)
fi

if test "x$with_xcurses" = "xyes"; then
   AC_CHECK_LIB([X11], [XOpenDisplay], ,
      AC_MSG_ERROR([ *** Unable to find libX11]))
   AC_CHECK_LIB([Xt], [XtVaAppInitialize], ,
      AC_MSG_ERROR([ *** Unable to find libXt]))
   AC_CHECK_LIB([Xmu], [XmuMakeAtom], ,
      AC_MSG_ERROR([ *** Unable to find libXmu]))
   AC_CHECK_LIB([Xpm], [XpmReadFileToPixmap], ,
      AC_MSG_ERROR([ *** Unable to find libXpm]))
   AC_CHECK_LIB([Xaw], [XawScrollbarSetThumb], ,
      AC_MSG_ERROR([ *** Unable to find libXaw]))
elif test "x$with_ncurses" != "xyes"; then
   AC_CHECK_LIB([SDL2_ttf], [TTF_OpenFont], ,
      AC_MSG_WARN([ *** Unable to find SDL2_ttf library (http://www.libsdl.org/projects/SDL_ttf/)]) ; LACK_SDL2=1)
fi

if test "$LACK_SDL2" = 1 && ! test "x$with_xcurses" = "xyes"; then
   AC_MSG_ERROR([ *** Cannot compile without SDL2!])
fi

if test "$LACK_SDL2" = 1 || test "x$enable_music" = "xno"; then
   AC_DEFINE(DISABLE_MUSIC, [], [Define to avoid including SDL2_mixer.])
   AC_MSG_RESULT([ *** Compiling without SDL2_mixer, and with DISABLE_MUSIC defined.])
fi

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T


# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_STAT


AC_CHECK_FUNCS([memset mkdir strchr])
AC_CONFIG_FILES([Makefile src/Makefile src/pdcurses/Makefile])
AC_OUTPUT
