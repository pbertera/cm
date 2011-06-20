include config.mk

operator: export CM_USER=$(CM_OPERATOR_USER)
operator: export CM_HOME=$(CM_OPERATOR_HOME)
operator: export CM_LIBEXECDIR=$(CM_OPERATOR_LIBEXECDIR)
operator:
	echo "making operator"
	$(MAKE) user	
	echo "export __cm_prompt=\"> \"" >> $(CM_HOME)/.cmrc

configure: export CM_USER=$(CM_CONFIGURE_USER)
configure: export CM_HOME=$(CM_CONFIGURE_HOME)
configure: export CM_LIBEXECDIR=$(CM_CONFIGURE_LIBEXECDIR)
configure:
	echo "making configure"
	$(MAKE) user	
	echo "export __cm_prompt=\"# \"" >> $(CM_HOME)/.cmrc
	usermod -o -g 0 -u 0 $(CM_USER)
	#echo -ne "$(CM_CONFIGURE_PWD)\n$(CM_CONFIGURE_PWD)" | passwd $(CM_USER) #TODO: ask user for password
user:
	useradd $(CM_USER) -d $(CM_HOME) -s $(BASH_PATH)
	mkdir -p $(CM_HOME)
	mkdir -p $(CM_LIBEXECDIR)
	@echo
	@echo "Configuring password for user $(CM_USER)"
	@passwd $(CM_USER)
	@echo
	echo "export __cm_prefix=$(CM_PREFIX)" >> $(CM_HOME)/.cmrc
	echo "export __cm_lib_dir=$(CM_LIBDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_bin_dir=$(CM_BINDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_db_dir=$(CM_DBDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_bin=cm" >> $(CM_HOME)/.cmrc
	echo "export __cm_default_priority=999" >> $(CM_HOME)/.cmrc
	echo "export __cm_config_db=$(CM_DBDIR)/config.boot" >> $(CM_HOME)/.cmrc
	echo "export __cm_libexec_dir=$(CM_LIBEXECDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_configure_libexec_dir=$(CM_CONFIGURE_LIBEXECDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_operator_libexec_dir=$(CM_OPERATOR_LIBEXECDIR)" >> $(CM_HOME)/.cmrc
	echo "export __cm_operator_user=$(CM_OPERATOR_USER)" >> $(CM_HOME)/.cmrc
	echo "export __cm_configure_user=$(CM_CONFIGURE_USER)" >> $(CM_HOME)/.cmrc
	
	
	echo ". ~/.cmrc" >> $(CM_HOME)/.bash_profile
	echo ". $(CM_LIBDIR)/common_functions" >> $(CM_HOME)/.bash_profile
	echo "export PATH=\$$PATH:$(CM_BINDIR)" >> $(CM_HOME)/.bash_profile
	echo "alias dcm='__cm_debug=1 cm'" >> $(CM_HOME)/.bash_profile
	echo "alias nocm='__cm_no_command=1 cm'" >> $(CM_HOME)/.bash_profile 
	echo "alias dnocm='__cm_debug=1 __cm_no_command=1 cm'" >> $(CM_HOME)/.bash_profile
	echo "PS1=\$$__cm_prompt" >> $(CM_HOME)/.bash_profile
	echo ". /etc/bash_completion" >> $(CM_HOME)/.bash_profile
		
	chown -R $(CM_USER):$(CM_USER) $(CM_HOME)	

.PHONY: framework
framework:
	echo "Making cmlib"
	mkdir -p "$(CM_LIBDIR)" "$(CM_BINDIR)" "$(CM_DBDIR)"
	cp bash_completion/cm $(COMPLETION_DIR)/cm
	cp framework/lib/* "$(CM_LIBDIR)/"
	cp framework/bin/* "$(CM_BINDIR)/"

.PHONY: packages
packages:
	echo "Building Packages"
	for p in packages/*; do (cd $$p; $(MAKE) all); done
	
remove:
	echo "Removing"
	rm -rf "$(CM_LIBDIR)" "$(CM_BINDIR)" "$(CM_DBDIR)"
	rm -rf $(COMPLETION_DIR)/cm
	userdel $(CM_CONFIGURE_USER)
	rm -rf $(CM_CONFIGURE_HOME)
	userdel $(CM_OPERATOR_USER)
	rm -rf $(CM_OPERATOR_HOME)

backup:
	tar czvf /opt/cm-`date +"%s"`.tgz /opt/cm

clean:
	make backup	
	echo "Cleaning"
	rm -rf "$(CM_LIBDIR)" "$(CM_BINDIR)" "$(CM_CONFIGURE_LIBEXECDIR)" "$(CM_OPERATOR_LIBEXECDIR)"
	rm -rf $(COMPLETION_DIR)/cm
	userdel $(CM_CONFIGURE_USER)
	rm -rf $(CM_CONFIGURE_HOME)
	userdel $(CM_OPERATOR_USER)
	rm -rf $(CM_OPERATOR_HOME)

all: framework operator configure packages	
