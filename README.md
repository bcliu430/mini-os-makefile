# Mini-OS Makefile

This is a simple Makefile giving the illusion of an 'out-of-tree' build of a Mini-OS based application into a binary unikernel.

## Usage:

1. Replace the variable `XEN_SRC_DIR` in the Makefile with the absolute path of Xen sources on your machine

2. It is advised to do a `make distclean` in Xen sources, as well as a `git clean -df` in Xen sources (assuming you are getting Xen from the git repo). WARNING: `git clean -df` will wipe everything that is not in the git repository ! After that, if the directory `extras` is still present at the root of Xen sources you need to delete it.

3. You can then use make to compile the unikernel

Note that 1. and 2. above should be done only once - after that you can only use the Makefile.
