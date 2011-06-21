cmlib:
	grep ^\#@ ../src/framework/lib/cmlib | sed -e s/\#@//1 > cmlib.rst

packages:
	rm -f packages.rst
	for d in ../src/packages/*; do ( cd $$d; make -s doc >> ../../../docs/packages.rst ) ; done 

build:
	sphinx-build . /var/www/

ghpages:
	sphinx-build . /opt/cm-pages/cm/
	( cd /opt/cm-pages/cm/; git commit -a -m "First pages commit"; git push origin gh-pages )

all:
	make cmlib
	make packages
	make build
	#make ghpages
