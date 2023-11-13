
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 718cbdf07e082486e008537660e6b9fb4fb07a45
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-rcmb.git

LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES


LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/

#defining a set of installation commands for the build system
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

#creating and executing makefile code dynamically
$(eval $(kernel-module))
$(eval $(generic-package))
