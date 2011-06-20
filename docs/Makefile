cmlib:
	grep ^\#@ ../src/framework/lib/cmlib | sed -e s/\#@//1 > cmlib.rst

packages:
	rm -f packages.rst
	-find ../src/packages -type f -name *help* -exec grep ^\#@ \{\} \; | sed -e s/\#@//1 >> packages.rst

build:
	sphinx-build . /var/www/

github:
	sphinx-build . /opt/cm-pages/cm/
	cd /opt/cm-pages/cm/
	git commit -a -m "First pages commit"
	git push


