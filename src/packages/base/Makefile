.PHONY: operator
operator:
	cp -a operator/* $(CM_OPERATOR_LIBEXECDIR)/

.PHONY: configure
configure:
	cp -a configure/* $(CM_CONFIGURE_LIBEXECDIR)/
#	cp -a configure/generic $(CM_CONFIGURE_LIBEXECDIR)/.generic

all: configure operator
