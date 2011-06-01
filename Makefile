.PHONY: src
src:
	cd src && make all
clean:
	cd src && make clean

all: 
	make src
