export PREFIX=/opt/cm
export BUILDDIR=/tmp/cmbb

build:
	mkdir -p $(BUILDDIR)
	echo "export __cm_base_dir=$(PREFIX)" > $(BUILDDIR)/cmrc
	echo "export __cm_libexec_dir=${__cm_base_dir}/usr/lib/cm/libexec" >> $(BUILDDIR)/cmrc
	echo "export __cm_db_dir=${__cm_base_dir}/var/lib/cmdb" >> $(BUILDDIR)/cmrc
	echo "export __cm_lib_dir=${__cm_base_dir}/usr/lib/cm/lib" >> $(BUILDDIR)/cmrc
	echo "export __cm_bin_dir=${__cm_base_dir}/bin" >> $(BUILDDIR)/cmrc
	echo "export __cm_bin=cm" >> $(BUILDDIR)/cmrc
	echo "export __cm_prompt=\"> \"" >> $(BUILDDIR)/cmrc
	echo "export __cm_default_priority=999" >> $(BUILDDIR)/cmrc
	echo "export __cm_config_db=${__cm_base_dir}/etc/config.boot" >> $(BUILDDIR)/cmrc

install: build
	cd src; make install
	make clean

uninstall:
	rm -rf $(PREFIX)/etc/cm
	rm -f  $(PREFIX)/bin/cm
	rm -rf $(PREFIX)/usr/lib/cm/config-libexec
	rm -rf $(PREFIX)/usr/lib/cm/libexec
	rm -rf $(PREFIX)/usr/lib/cm/lib
	rm -rf $(PREFIX)/var/lib/cmdb/
clean:
	rm -rf $(BUILDDIR)		

	
