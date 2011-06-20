.PHONY: operator
operator:
	cp -a operator/* $(CM_OPERATOR_LIBEXECDIR)/

.PHONY: configure
configure:
	cp -a configure/* $(CM_CONFIGURE_LIBEXECDIR)/

doc:
	@cat packagedoc.rst
	@-find . -type f -name *help* -exec grep ^\#@ \{\} \; | sed -e s/\#@//1


all: configure 
#operator
