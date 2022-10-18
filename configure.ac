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

# Defines
# TODO: Conditionally set these depending on build system.
AC_DEFINE([UNIX],[],[Defined if on a UNIX based system])
AC_DEFINE([Linux],[],[Defined if running on Linux])
#AC_DEFINE([HAVE_WIDE_PDCURSES],[],[Defined if we have a wide PDCurses (we always do)])
AC_DEFINE([PDC_WIDE],[],[Defined if we have a wide PDCurses (we always do)])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h string.h sys/time.h unistd.h])

# Include SDL2 and SDL2_mixer, or define DONT_INCLUDE_SDL as a fallback if they aren't available, so it still compiles.
AC_PATH_PROG(SDL_CONFIG, sdl2-config)
if test -n "$SDL_CONFIG"; then
   LIBS="$LIBS `$SDL_CONFIG --libs`"
   CPPFLAGS="$CPPFLAGS `$SDL_CONFIG --cflags`"
fi
AC_CHECK_LIB([SDL2], [SDL_Init], ,
   AC_MSG_WARN([ *** Unable to find SDL2 library (http://www.libsdl.org/)]) ; LACK_SDL2=1)
AC_CHECK_LIB([SDL2_mixer], [Mix_OpenAudio], ,
   AC_MSG_WARN([ *** Unable to find SDL2_mixer library (http://www.libsdl.org/projects/SDL_mixer/)]) ; LACK_SDL2=1)
AC_CHECK_LIB([SDL2_ttf], [TTF_OpenFont], ,
   AC_MSG_WARN([ *** Unable to find SDL2_ttf library (http://www.libsdl.org/projects/SDL_ttf/)]) ; LACK_SDL2=1)
if test "$LACK_SDL2" = 1; then
   AC_MSG_ERROR([ *** Cannot compile without SDL2!])
fi

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T
m4_warn([obsolete],
[Update your code to rely only on HAVE_SYS_TIME_H,
then remove this warning and the obsolete code below it.
All current systems provide time.h; it need not be checked for.
Not all systems provide sys/time.h, but those that do, all allow
you to include it and time.h simultaneously.])dnl
AC_CHECK_HEADERS_ONCE([sys/time.h])
# Obsolete code to be removed.
if test $ac_cv_header_sys_time_h = yes; then
  AC_DEFINE([TIME_WITH_SYS_TIME],[1],[Define to 1 if you can safely include both <sys/time.h>
	     and <time.h>.  This macro is obsolete.])
fi
# End of obsolete code.


# Checks for library functions.
AC_FUNC_MALLOC
m4_warn([obsolete],
[your code may safely assume C89 semantics that RETSIGTYPE is void.
Remove this warning and the `AC_CACHE_CHECK' when you adjust the code.])dnl
AC_CACHE_CHECK([return type of signal handlers],[ac_cv_type_signal],[AC_COMPILE_IFELSE(
[AC_LANG_PROGRAM([#include <sys/types.h>
#include <signal.h>
],
		 [return *(signal (0, 0)) (0) == 1;])],
		   [ac_cv_type_signal=int],
		   [ac_cv_type_signal=void])])
AC_DEFINE_UNQUOTED([RETSIGTYPE],[$ac_cv_type_signal],[Define as the return type of signal handlers
		    (`int' or `void').])

AC_FUNC_STAT


AC_CHECK_FUNCS([memset mkdir strchr])
AC_CONFIG_FILES([Makefile src/Makefile src/pdcurses/Makefile])
AC_OUTPUT
