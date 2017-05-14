TARGET = ncurses1
CC     = gcc
WARN   = -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wconversion
CFLAGS = -g3 -O1 $(WARN) -std=c99
LDLIBS = -lm -lncurses
CFILES = $(wildcard *.c)
OFILES = $(patsubst %.c, %.o, $(CFILES))
DFILES = $(patsubst %.c, .deps/%.d, $(CFILES))

all: $(TARGET)
	ctags *.c

.deps/%.d: %.c
	$(shell if [ ! -d deps/ ]; then mkdir .deps/; fi )
	@$(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; rm $@.$$$$

ifneq ($(MAKECMDGOALS),clean)
-include $(DFILES)
endif


.PHONY: clean bz2

clean:
	$(RM) $(TARGET) *.o .deps/* core tags

bz2:
	make clean
	cd ..; tar jcv ./$(TARGET) > $(TARGET)/$(TARGET).tar.bz2
