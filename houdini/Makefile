# GNU Makefile
# Copyright (C) 2012 Przemyslaw Pawelczyk <przemoc@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

SRCS := buffer.c houdini_href_e.c houdini_html_e.c houdini_html_u.c houdini_js_e.c houdini_js_u.c houdini_uri_e.c houdini_uri_u.c houdini_xml_e.c
OBJS := $(addsuffix .o,$(basename $(SRCS)))
DEPS := $(addsuffix .d,$(basename $(SRCS)))
NAME := houdini

SRCDIR := $(dir $(lastword $(MAKEFILE_LIST)))
OBJDIR ?= ./
OBJS := $(addprefix $(OBJDIR),$(OBJS))
SLIB := lib$(NAME).a

UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
	DYLIB := lib$(NAME).dylib
else
	DYLIB := lib$(NAME).so
endif

vpath %.c $(SRCDIR)
vpath %.h $(SRCDIR)

AR ?= ar
CC ?= gcc
GPERF ?= gperf

CFLAGS ?= -O2
# -Wno-missing-field-initializers - gperf's header doesn't pass on -Wextra
MANDATORY_FLAGS := -Wall -Wextra -Wno-missing-field-initializers -fPIC
override CFLAGS := $(MANDATORY_FLAGS) $(CFLAGS)

CC_PARAMS = $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH)

.PHONY: all clean objects package

all: package

objects: $(OBJS)
package: $(SLIB) $(DYLIB)

$(SLIB): $(OBJS)
	$(AR) rcs $@ $^

$(DYLIB): $(OBJS)
ifeq ($(UNAME),Darwin)
	$(CC) -dynamiclib $^ -o $@
else
	$(CC) -shared -Wl,-soname,$@ -o $@ $^
endif

$(OBJS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $@

$(OBJDIR)%.o: %.c
	$(CC) $(CC_PARAMS) -c -o $@ $<

%.d: %.c
	@$(CC) $(CC_PARAMS) -MT "\$$(OBJDIR)$(basename $^).o $@" -MM $< -o $@

html_unescape.h: html_unescape.gperf
	$(GPERF) -t -N find_entity -H hash_entity -K entity -C -l --null-strings -m100 $< >$@

clean:
	$(RM) $(DYLIB) $(SLIB) $(OBJS) $(DEPS)

ifneq ($(MAKECMDGOALS),clean)
-include $(DEPS)
endif
