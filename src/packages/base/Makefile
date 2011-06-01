.PHONY: operator
operator:
	cp -a operator/* $(CM_OPERATOR_LIBEXECDIR)/

.PHONY: configure
configure:
	cp -a configure/* $(CM_CONFIGURE_LIBEXECDIR)/
	ln -s $(CM_OPERATOR_LIBEXECDIR) $(CM_CONFIGURE_LIBEXECDIR)/do

all: configure operator
