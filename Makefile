SUBDIRS = QKD_emulator ctapudp keyworker qcrypt
build:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir; \
	done
clean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir clean; \
	done
prereq:
	sudo yum install gcc gcc-c++ make libmicrohttpd-devel libdb-devel openssl-devel libconfig-devel libcurl-devel
install:
	mkdir /etc/qnet
	cp -rf ctapudp /etc/qnet/ 
	cp -rf keyworker /etc/qnet/ 
	cp -rf qcrypt /etc/qnet/ 
all:
	$(MAKE) prereq
	$(MAKE) build
	$(MAKE) install
	
