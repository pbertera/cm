export PREFIX=/opt/cm
export BUILDDIR=/tmp/cmbb
export COMPLETION_DIR=/etc/bash_completion.d/
export CMUSER=cm
export BASH_PROFILE=$(PREFIX)/home/$(CMUSER)/.bash_profile

build:
	mkdir -p $(BUILDDIR)
	echo "export __cm_base_dir=$(PREFIX)" > $(BUILDDIR)/cmrc
	echo "export __cm_libexec_dir=\$${__cm_base_dir}/usr/lib/cm/libexec" >> $(BUILDDIR)/cmrc
	echo "export __cm_db_dir=\$${__cm_base_dir}/var/lib/cmdb" >> $(BUILDDIR)/cmrc
	echo "export __cm_lib_dir=\$${__cm_base_dir}/usr/lib/cm/lib" >> $(BUILDDIR)/cmrc
	echo "export __cm_bin_dir=\$${__cm_base_dir}/bin" >> $(BUILDDIR)/cmrc
	echo "export __cm_bin=cm" >> $(BUILDDIR)/cmrc
	echo "export __cm_prompt=\"> \"" >> $(BUILDDIR)/cmrc
	echo "export __cm_default_priority=999" >> $(BUILDDIR)/cmrc
	echo "export __cm_config_db=\$${__cm_base_dir}/etc/config.boot" >> $(BUILDDIR)/cmrc

install: remove build
	cd src; make install
	cp src/bash_completion/cm $(COMPLETION_DIR)/cm
	useradd $(CMUSER) -d $(PREFIX)/home/$(CMUSER)
	mkdir -p $(PREFIX)/home/$(CMUSER)
	# creating -bash_profile for user cm
	make environ
	make clean
	
environ:	
	echo ". $(PREFIX)/etc/cm/cmrc" >> $(BASH_PROFILE)
	echo "export PATH=\$$PATH:$(PREFIX)/bin:$(PREFIX)/sbin" >> $(BASH_PROFILE)
	echo "alias dcm='__cm_debug=1 cm'" >> $(BASH_PROFILE)
	echo "alias nocm='__cm_no_command=1 cm'" >> $(BASH_PROFILE)
	echo "alias dnocm='__cm_debug=1 __cm_no_command=1 cm'" >> $(BASH_PROFILE)
	echo "alias sudo='sudo env PATH=\$$PATH'" >> $(BASH_PROFILE)
	echo "PS1=\$$__cm_prompt" >> $(BASH_PROFILE)

	echo ". /etc/bash_completion" >> $(BASH_PROFILE)
	chown -R $(CMUSER) $(PREFIX)/home/$(CMUSER)
	chown -R $(CMUSER) $(PREFIX)/var/lib/
	chmod +w /etc/sudoers
	echo "$(CMUSER) ALL=NOPASSWD: ALL" >> /etc/sudoers
	chmod -w /etc/sudoers

remove:
	rm -rf $(PREFIX)/etc/cm
	rm -rf $(PREFIX)/home/cm
	rm -rf $(PREFIX)/usr/lib/cm/config-libexec
	rm -rf $(PREFIX)/usr/lib/cm/libexec
	rm -rf $(PREFIX)/usr/lib/cm/lib
	#rm -rf $(PREFIX)/var/lib/cmdb/
	rm -f $(COMPLETION_DIR)/cm
	rm -f  $(PREFIX)/bin/cm
	grep -v "^cm " /etc/sudoers > /tmp/sudoers
	mv /tmp/sudoers /etc/sudoers
	chmod 000 /etc/sudoers
	chmod ug+r /etc/sudoers

uninstall:
	make remove
	userdel $(CMUSER)

clean:
	rm -rf $(BUILDDIR)		
