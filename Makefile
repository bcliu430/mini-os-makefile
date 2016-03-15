XEN_SRC_DIR=/home/pierre/sources/xen
SRC=main.c
ARCH=x86_64

all: mini-os.gz

mini-os.gz: $(SRC)
	make -C $(XEN_SRC_DIR)/stubdom/c clean
	cp -rf $(SRC) $(XEN_SRC_DIR)/stubdom/c/
	make -C $(XEN_SRC_DIR)/stubdom c-stubdom
	cp -f $(XEN_SRC_DIR)/stubdom/mini-os-x86_64-c/mini-os.gz .
