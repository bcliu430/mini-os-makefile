XEN_SRC_DIR=/home/pierre/sources/xen
SRC=main.c
ARCH=x86_64
XEN_CONFIG=domain_config.xl

all: mini-os.gz

mini-os.gz: $(SRC)
	make -C $(XEN_SRC_DIR)/stubdom/c clean
	cp -rf $(SRC) $(XEN_SRC_DIR)/stubdom/c/
	make -C $(XEN_SRC_DIR)/stubdom c-stubdom
	cp -f $(XEN_SRC_DIR)/stubdom/mini-os-x86_64-c/mini-os.gz .

run: mini-os.gz
	xl create $(XEN_CONFIG) -c
