#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])

#The following line has the program name, the program version, and the bug report address.
AC_INIT([crimesquad],[4.10.2u],[bitterlyironic@outlook.com])
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

# Defines
# TODO: Conditionally set these depending on build system.
AC_DEFINE([UNIX],[],[Defined if on a UNIX based system])
AC_DEFINE([Linux],[],[Defined if running on Linux])
AC_DEFINE([PDC_WIDE],[],[Defined if we have a wide PDCurses (we always do)])
if test "x$with_xcurses" = "xyes"; then
   AC_DEFINE([XCURSES],[],[Defined if we are using XCurses])
   AC_DEFINE([HAVE_WIDE_PDCURSES],[],[Defined if we want to try to use unicode within LCS (only for XCurses currently because SDL_ttf font handling doesn't like it)])
else
   AC_DEFINE([SDLCURSES],[],[Defined if we are using the SDL port of PDCurses])
fi

# tells PDCurses if it should build the X11 or SDL backends
AM_CONDITIONAL(WITH_XCURSES, [test "x$with_xcurses" = "xyes"])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h string.h sys/time.h unistd.h])

# Include SDL2 and SDL2_mixer, or define DONT_INCLUDE_SDL as a fallback if they aren't available, so it still compiles.
AC_PATH_PROG(SDL_CONFIG, sdl2-config)
if test -n "$SDL_CONFIG"; then
   LIBS="$LIBS `$SDL_CONFIG --libs`"
   CPPFLAGS="$CPPFLAGS `$SDL_CONFIG --cflags`"
fi
AC_CHECK_LIB([SDL2_mixer], [Mix_OpenAudio], ,
   AC_MSG_WARN([ *** Unable to find SDL2_mixer library (http://www.libsdl.org/projects/SDL_mixer/)]) ; LACK_SDL2=1)

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
else
   AC_CHECK_LIB([SDL2_ttf], [TTF_OpenFont], ,
      AC_MSG_WARN([ *** Unable to find SDL2_ttf library (http://www.libsdl.org/projects/SDL_ttf/)]) ; LACK_SDL2=1)
fi

if test "$LACK_SDL2" = 1 && ! test "x$with_xcurses" = "xyes"; then
   AC_MSG_ERROR([ *** Cannot compile without SDL2!])
fi

if test "$LACK_SDL2" = 1; then
   AC_DEFINE(DONT_INCLUDE_SDL, [], [Define to avoid including SDL2 and SDL2_mixer.])
   AC_MSG_WARN([ *** Compiling without SDL2 or SDL2_mixer, and with DONT_INCLUDE_SDL defined.])
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
