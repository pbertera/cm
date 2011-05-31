install:
	mkdir -p $(PREFIX)/etc/cm
	mkdir -p $(PREFIX)/bin
	mkdir -p $(PREFIX)/sbin
	cp $(BUILDDIR)/cmrc $(PREFIX)/etc/cm/cmrc
	cp bin/cm $(PREFIX)/bin/cm
	cp -a sbin/* $(PREFIX)/sbin/
	mkdir -p $(PREFIX)/usr/lib/cm/
	cp -a lib $(PREFIX)/usr/lib/cm/
	#cp -a config-libexec $(PREFIX)/usr/lib/cm/
	cp -a libexec $(PREFIX)/usr/lib/cm/
	mkdir -p $(PREFIX)/var/lib/cm/
	mkdir -p $(PREFIX)/var/lib/cmdb/
