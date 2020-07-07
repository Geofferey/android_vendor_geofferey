LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PUBLIC_BUILD),true)

include $(CLEAR_VARS)
LOCAL_MODULE       := bootdebi
LOCAL_MODULE_TAGS  := optional eng
$(shell mkdir -p $(TARGET_OUT_ETC)/bootdebi/)
$(shell mkdir -p $(TARGET_OUT_ETC)/init.d)
$(shell mkdir -p $(TARGET_OUT)/xbin)
$(shell cp -rf $(LOCAL_PATH)/bootdebi/* $(TARGET_OUT_ETC)/bootdebi)
$(shell mv $(TARGET_OUT_ETC)/bootdebi/S999bootdebi $(TARGET_OUT_ETC)/init.d/)
$(shell ln -sf /system/etc/bootdebi/scripts/bootdebi $(TARGET_OUT)/xbin/bootdebi)
$(shell ln -sf /system/etc/bootdebi/scripts/bootdebi_login $(TARGET_OUT)/xbin/login)
$(shell ln -sf /system/etc/bootdebi/scripts/bootdebi-config $(TARGET_OUT)/xbin/bootdebi-config)

include $(CLEAR_VARS)
LOCAL_MODULE       := chainfire_liveboot
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT)/exbin/)
$(shell mkdir -p $(TARGET_OUT)/exlib/)
$(shell mkdir -p $(TARGET_OUT_ETC)/init)
$(shell cp -rf $(LOCAL_PATH)/chainfire_liveboot/liveboot $(TARGET_OUT)/exbin)
$(shell cp -rf $(LOCAL_PATH)/chainfire_liveboot/liveboot-daemonize $(TARGET_OUT)/exbin)
$(shell cp -rf $(LOCAL_PATH)/chainfire_liveboot/liveboot.so $(TARGET_OUT)/exlib)

ifeq ($(TARGET_BUILD_VARIANT),user)

$(shell cp -rf $(LOCAL_PATH)/chainfire_liveboot/liveboot.rc $(TARGET_OUT_ETC)/init)

endif

ifeq ($(TARGET_BUILD_VARIANT),eng)

$(shell cp -rf $(LOCAL_PATH)/chainfire_liveboot/liveboot-eng.rc $(TARGET_OUT_ETC)/init/liveboot.rc)

endif

include $(CLEAR_VARS)
LOCAL_MODULE       := pdsshd
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT)/xbin)
$(shell mkdir -p $(TARGET_OUT)/exbin/)
$(shell mkdir -p $(TARGET_OUT_ETC)/init.d/)
$(shell cp $(LOCAL_PATH)/PDSSHD/60dropbear $(TARGET_OUT_ETC)/init.d)
$(shell cp $(LOCAL_PATH)/PDSSHD/pdsshd.conf $(TARGET_OUT_ETC))
$(shell cp $(LOCAL_PATH)/PDSSHD/dropbear $(TARGET_OUT)/xbin)
$(shell cp $(LOCAL_PATH)/PDSSHD/sftp-server.sh $(TARGET_OUT)/xbin/sftp-server)
$(shell cp $(LOCAL_PATH)/PDSSHD/pdsshd-toolkit $(TARGET_OUT)/xbin)
$(shell cp $(LOCAL_PATH)/PDSSHD/sftp-server $(TARGET_OUT)/exbin)
$(shell cp $(LOCAL_PATH)/PDSSHD/dropbearmulti $(TARGET_OUT)/exbin)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/exbin/dropbear)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/xbin/scp)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/xbin/dbclient)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/xbin/ssh)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/xbin/dropbearkey)
$(shell ln -sf /system/exbin/dropbearmulti $(TARGET_OUT)/xbin/dropbearconvert)

include $(CLEAR_VARS)
LOCAL_MODULE       := osm0sis_busybox
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT)/xbin)
$(shell cp -rf $(LOCAL_PATH)/osm0sis_busybox/* $(TARGET_OUT)/xbin/)

include $(CLEAR_VARS)
LOCAL_MODULE       := bash_prebuilt
BASH_EXEC=    := bash
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT)/xbin)
$(shell cp $(LOCAL_PATH)/bash_prebuilt/bash $(TARGET_OUT)/xbin/)
$(shell cp $(LOCAL_PATH)/bash_prebuilt/bash.bashrc $(TARGET_OUT_ETC)/bash.bashrc)

include $(CLEAR_VARS)
LOCAL_MODULE := sysinit
LOCAL_MODULE_TAGS := optional
$(shell mkdir -p $(TARGET_OUT)/xbin)
$(shell mkdir -p $(TARGET_OUT_ETC)/init)
$(shell cp $(LOCAL_PATH)/sysinit/sysinit.sh $(TARGET_OUT)/xbin/sysinit)

ifeq ($(TARGET_BUILD_VARIANT),user)

$(shell cp $(LOCAL_PATH)/sysinit/sysinit-user.rc $(TARGET_OUT_ETC)/init/sysinit.rc)

endif

ifeq ($(TARGET_BUILD_VARIANT),eng)

$(shell cp $(LOCAL_PATH)/sysinit/sysinit-eng.rc $(TARGET_OUT_ETC)/init/sysinit.rc)

endif

#include $(CLEAR_VARS)
#LOCAL_MODULE       := GCam
#LOCAL_PACKAGE_NAME := GCam
#LOCAL_MODULE_TAGS  := optional
#LOCAL_MODULE_CLASS := APPS
#LOCAL_CERTIFICATE := shared
#LOCAL_SRC_FILES    := apps/GCam/GCam.apk
#LOCAL_MODULE_PATH  := $(TARGET_OUT)/app/GCam
#include $(BUILD_PREBUILT)

ifeq ($(TARGET_PRIVATE_BUILD),true)

include $(CLEAR_VARS)
LOCAL_MODULE       := bootdebi_priv
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT_ETC)/bootdebi/conf)
$(shell cp $(LOCAL_PATH)/private/bootdebi/debian-chroot.tar.gz $(TARGET_OUT_ETC)/bootdebi/)
$(shell cp $(LOCAL_PATH)/private/bootdebi/conf/bootdebi.conf $(TARGET_OUT_ETC)/bootdebi/conf/)

include $(CLEAR_VARS)
LOCAL_MODULE       := pdsshd_priv
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT_ETC)/dropbear)
$(shell cp -rf $(LOCAL_PATH)/private/etc/dropbear/* $(TARGET_OUT_ETC)/dropbear)
$(shell cp $(LOCAL_PATH)/private/etc/pdsshd.conf $(TARGET_OUT_ETC)/)

endif

endif
