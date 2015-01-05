# define the C source files
SRCS = CApp.cpp CApp_OnInit.cpp CApp_OnEvent.cpp CApp_OnLoop.cpp CApp_OnRender.cpp CApp_OnCleanup.cpp CSurface.cpp CEvent.cpp

# define the C compiler to use
CC = g++

# define any compile-time flags
CFLAGS = -Wall 

# define any directories containing header files other than /usr/include
#
INCLUDES = -I.

# define library paths in addition to /usr/lib
#LFLAGS = -L/home/newhall/lib  -L../lib

# define any libraries to link into executable:
LIBS = -lSDL -lSDL_image -lSDL_ttf

# define the C object files 
#   This uses Suffix Replacement within a macro:
#   $(name:string1=string2) For each word in 'name' replace 'string1' with 'string2'
OBJS = $(SRCS:.cpp=.o)

# define the package file (*.tar)
MAIN = myprog

# define target name (for source and executable files
TARFILE = $(MAIN).tar

# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'

.PHONY: depend clean

all:    $(MAIN)
	@echo Tutorial: www.sdltutorials.com/sdl-tutorial-tic-tac-toe

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) $(OBJS) *.bak *~ $(TARFILE) $(MAIN)

run: $(MAIN)
	./$(MAIN)

# make an archived tar holding all .c .h and Makefile for distribution
pkg: 
	tar cvf $(TARFILE) $(SRCS) *.h makefile ./gfx/*.bmp

# view the contents of the tar file
viewpkg: 
	tar tvf $(TARFILE)

# extract the contents of the tar file (if it exists)
openpkg: 
	tar xvf $(TARFILE)

depend: $(SRCS)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it

CApp.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
CApp.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
CApp.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
CApp.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
CApp.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
CApp.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
CApp.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
CApp.o: /usr/include/stdlib.h /usr/include/alloca.h /usr/include/string.h
CApp.o: /usr/include/xlocale.h /usr/include/strings.h /usr/include/inttypes.h
CApp.o: /usr/include/stdint.h /usr/include/bits/wchar.h /usr/include/ctype.h
CApp.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CApp.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h CEvent.h
CApp.o: CSurface.h
CApp_OnInit.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnInit.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnInit.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp_OnInit.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp_OnInit.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp_OnInit.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp_OnInit.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp_OnInit.o: /usr/include/time.h /usr/include/endian.h
CApp_OnInit.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CApp_OnInit.o: /usr/include/sys/select.h /usr/include/bits/select.h
CApp_OnInit.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CApp_OnInit.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
CApp_OnInit.o: /usr/include/stdio.h /usr/include/libio.h
CApp_OnInit.o: /usr/include/_G_config.h /usr/include/wchar.h
CApp_OnInit.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
CApp_OnInit.o: /usr/include/stdlib.h /usr/include/alloca.h
CApp_OnInit.o: /usr/include/string.h /usr/include/xlocale.h
CApp_OnInit.o: /usr/include/strings.h /usr/include/inttypes.h
CApp_OnInit.o: /usr/include/stdint.h /usr/include/bits/wchar.h
CApp_OnInit.o: /usr/include/ctype.h /usr/include/iconv.h
CApp_OnInit.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CApp_OnInit.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CApp_OnInit.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CApp_OnInit.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CApp_OnInit.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CApp_OnInit.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp_OnInit.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CApp_OnInit.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CApp_OnInit.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp_OnInit.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp_OnInit.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CApp_OnEvent.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnEvent.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnEvent.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp_OnEvent.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp_OnEvent.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp_OnEvent.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp_OnEvent.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp_OnEvent.o: /usr/include/time.h /usr/include/endian.h
CApp_OnEvent.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CApp_OnEvent.o: /usr/include/sys/select.h /usr/include/bits/select.h
CApp_OnEvent.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CApp_OnEvent.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
CApp_OnEvent.o: /usr/include/stdio.h /usr/include/libio.h
CApp_OnEvent.o: /usr/include/_G_config.h /usr/include/wchar.h
CApp_OnEvent.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
CApp_OnEvent.o: /usr/include/stdlib.h /usr/include/alloca.h
CApp_OnEvent.o: /usr/include/string.h /usr/include/xlocale.h
CApp_OnEvent.o: /usr/include/strings.h /usr/include/inttypes.h
CApp_OnEvent.o: /usr/include/stdint.h /usr/include/bits/wchar.h
CApp_OnEvent.o: /usr/include/ctype.h /usr/include/iconv.h
CApp_OnEvent.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CApp_OnEvent.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CApp_OnEvent.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CApp_OnEvent.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CApp_OnEvent.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CApp_OnEvent.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp_OnEvent.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CApp_OnEvent.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CApp_OnEvent.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp_OnEvent.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp_OnEvent.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CApp_OnLoop.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnLoop.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnLoop.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp_OnLoop.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp_OnLoop.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp_OnLoop.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp_OnLoop.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp_OnLoop.o: /usr/include/time.h /usr/include/endian.h
CApp_OnLoop.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CApp_OnLoop.o: /usr/include/sys/select.h /usr/include/bits/select.h
CApp_OnLoop.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CApp_OnLoop.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
CApp_OnLoop.o: /usr/include/stdio.h /usr/include/libio.h
CApp_OnLoop.o: /usr/include/_G_config.h /usr/include/wchar.h
CApp_OnLoop.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
CApp_OnLoop.o: /usr/include/stdlib.h /usr/include/alloca.h
CApp_OnLoop.o: /usr/include/string.h /usr/include/xlocale.h
CApp_OnLoop.o: /usr/include/strings.h /usr/include/inttypes.h
CApp_OnLoop.o: /usr/include/stdint.h /usr/include/bits/wchar.h
CApp_OnLoop.o: /usr/include/ctype.h /usr/include/iconv.h
CApp_OnLoop.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CApp_OnLoop.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CApp_OnLoop.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CApp_OnLoop.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CApp_OnLoop.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CApp_OnLoop.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp_OnLoop.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CApp_OnLoop.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CApp_OnLoop.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp_OnLoop.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp_OnLoop.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CApp_OnRender.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnRender.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnRender.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp_OnRender.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp_OnRender.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp_OnRender.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp_OnRender.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp_OnRender.o: /usr/include/time.h /usr/include/endian.h
CApp_OnRender.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CApp_OnRender.o: /usr/include/sys/select.h /usr/include/bits/select.h
CApp_OnRender.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CApp_OnRender.o: /usr/include/sys/sysmacros.h
CApp_OnRender.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
CApp_OnRender.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnRender.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
CApp_OnRender.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
CApp_OnRender.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnRender.o: /usr/include/xlocale.h /usr/include/strings.h
CApp_OnRender.o: /usr/include/inttypes.h /usr/include/stdint.h
CApp_OnRender.o: /usr/include/bits/wchar.h /usr/include/ctype.h
CApp_OnRender.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnRender.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnRender.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnRender.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnRender.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnRender.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp_OnRender.o: /usr/include/SDL/SDL_active.h
CApp_OnRender.o: /usr/include/SDL/SDL_keyboard.h
CApp_OnRender.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnRender.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp_OnRender.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp_OnRender.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CApp_OnRender.o: CEvent.h CSurface.h
CApp_OnCleanup.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CApp_OnCleanup.o: /usr/include/features.h /usr/include/bits/predefs.h
CApp_OnCleanup.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CApp_OnCleanup.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CApp_OnCleanup.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CApp_OnCleanup.o: /usr/include/time.h /usr/include/endian.h
CApp_OnCleanup.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CApp_OnCleanup.o: /usr/include/sys/select.h /usr/include/bits/select.h
CApp_OnCleanup.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CApp_OnCleanup.o: /usr/include/sys/sysmacros.h
CApp_OnCleanup.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
CApp_OnCleanup.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnCleanup.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
CApp_OnCleanup.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
CApp_OnCleanup.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnCleanup.o: /usr/include/xlocale.h /usr/include/strings.h
CApp_OnCleanup.o: /usr/include/inttypes.h /usr/include/stdint.h
CApp_OnCleanup.o: /usr/include/bits/wchar.h /usr/include/ctype.h
CApp_OnCleanup.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnCleanup.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_cpuinfo.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_keyboard.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_video.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CSurface.o: CSurface.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CSurface.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CSurface.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CSurface.o: /usr/include/features.h /usr/include/bits/predefs.h
CSurface.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CSurface.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CSurface.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CSurface.o: /usr/include/time.h /usr/include/endian.h
CSurface.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CSurface.o: /usr/include/sys/select.h /usr/include/bits/select.h
CSurface.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CSurface.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
CSurface.o: /usr/include/stdio.h /usr/include/libio.h
CSurface.o: /usr/include/_G_config.h /usr/include/wchar.h
CSurface.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
CSurface.o: /usr/include/stdlib.h /usr/include/alloca.h /usr/include/string.h
CSurface.o: /usr/include/xlocale.h /usr/include/strings.h
CSurface.o: /usr/include/inttypes.h /usr/include/stdint.h
CSurface.o: /usr/include/bits/wchar.h /usr/include/ctype.h
CSurface.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CSurface.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CSurface.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CSurface.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CSurface.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CSurface.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CSurface.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CSurface.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CSurface.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CSurface.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CSurface.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CEvent.o: CEvent.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CEvent.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CEvent.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
CEvent.o: /usr/include/features.h /usr/include/bits/predefs.h
CEvent.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
CEvent.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
CEvent.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
CEvent.o: /usr/include/time.h /usr/include/endian.h
CEvent.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
CEvent.o: /usr/include/sys/select.h /usr/include/bits/select.h
CEvent.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
CEvent.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
CEvent.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
CEvent.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
CEvent.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
CEvent.o: /usr/include/alloca.h /usr/include/string.h /usr/include/xlocale.h
CEvent.o: /usr/include/strings.h /usr/include/inttypes.h
CEvent.o: /usr/include/stdint.h /usr/include/bits/wchar.h
CEvent.o: /usr/include/ctype.h /usr/include/iconv.h
CEvent.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CEvent.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CEvent.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CEvent.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CEvent.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CEvent.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CEvent.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CEvent.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CEvent.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CEvent.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CEvent.o: /usr/include/SDL/SDL_version.h
