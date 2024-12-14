ifneq ($(KERNELRELEASE),)
include Kbuild
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp hello_lab6.ko hello_lab6.ko.unstripped
	$(CROSS_COMPILE)strip -g hello_lab6.ko				# strip only debugging info

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

%.s %.i: %.clean										# just use make hello_lab6.s instead of objdump
	$(MAKE) -C $(KDIR) M=$$PWD $@

endif
