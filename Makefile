SUBDIRS = QKD_emulator ctapudp keyworker qcrypt
IS_SUDO = $(shell [ "$EUID" -ne 0 ] && echo 0 || echo 1 )
EUID    := $(shell id -u -r)
check:
ifneq ($(EUID),0)
	@echo "Please run as root user"
	@exit 1
endif
build:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir; \
	done
clean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir clean; \
	done
prereq:	check
	yum install gcc gcc-c++ make libmicrohttpd-devel libdb-devel openssl-devel libconfig-devel libcurl-devel
install: check
	mkdir /etc/qnet
	cp -rf ctapudp /etc/qnet/ 
	cp -rf keyworker /etc/qnet/ 
	cp -rf qcrypt /etc/qnet/ 
all: check
	$(MAKE) prereq
	$(MAKE) build
	$(MAKE) install
	
