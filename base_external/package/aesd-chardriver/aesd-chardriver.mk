
##############################################################
#
# AESD_CHARDRIVER
#
##############################################################

AESD_CHARDRIVER_VERSION =  6543d1538468c3d8877f3ad15686912ce6481f97
AESD_CHARDRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-rcmb.git

AESD_CHARDRIVER_SITE_METHOD = git
AESD_CHARDRIVER_GIT_SUBMODULES = YES

AESD_CHARDRIVER_MODULE_SUBDIRS += aesd-char-driver/

#defining a set of installation commands for the build system
define AESD_CHARDRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

#creating and executing makefile code dynamically
$(eval $(kernel-module))
$(eval $(generic-package))
