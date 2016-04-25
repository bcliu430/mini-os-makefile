XEN_SRC_DIR=/root/src/xen
SRC=main.c
ARCH=x86_64
XEN_CONFIG=domain_config.xl

all: $(XEN_SRC_DIR)/xen/xen mini-os.gz

mini-os.gz: $(SRC) $(XEN_SRC_DIR)/xen/xen $(XEN_SRC_DIR)/stubdom/config.log2
	make -C $(XEN_SRC_DIR)/stubdom/c clean
	cp -rf $(SRC) $(XEN_SRC_DIR)/stubdom/c/
	make -C $(XEN_SRC_DIR)/stubdom c-stubdom -j$(shell cat /proc/cpuinfo | grep processor | wc -l)
	cp -f $(XEN_SRC_DIR)/stubdom/mini-os-x86_64-c/mini-os.gz .

.PHONY: run
run: mini-os.gz
	xl create $(XEN_CONFIG) -c

# Xen configure
$(XEN_SRC_DIR)/config.log:
	cd $(XEN_SRC_DIR)/; ./configure

# Xen
$(XEN_SRC_DIR)/xen/xen: $(XEN_SRC_DIR)/config.log
	make -C $(XEN_SRC_DIR) -j$(shell cat /proc/cpuinfo | grep processor | wc -l)
	
# Stubdoms configure
$(XEN_SRC_DIR)/stubdom/config.log2:
	cd $(XEN_SRC_DIR)/stubdom/; ./configure --enable-c-stubdom; touch config.log2
	
.PHONY: clean
clean:
	rm -rf mini-os.gz

.PHONY: superclean
superclean: clean
	make -C $(XEN_SRC_DIR) distclean -j$(shell cat /proc/cpuinfo | grep processor | wc -l)
	rm -rf $(XEN_SRC_DIR)/stubdom/config.log2
