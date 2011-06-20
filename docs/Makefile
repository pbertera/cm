cmlib:
	grep ^\#@ ../src/framework/lib/cmlib | sed -e s/\#@//1 > cmlib.rst

packages:
	rm -f packages.rst
	-find ../src/packages -type f -name *help* -exec grep ^\#@ \{\} \; | sed -e s/\#@//1 >> packages.rst

build:
	sphinx-build . /var/www/
