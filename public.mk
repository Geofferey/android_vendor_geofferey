#Include public assets in ROM

PRODUCT_SOONG_NAMESPACES += \
    vendor/geofferey

TARGET_PUBLIC_BUILD := true

ifeq ($(TARGET_PRIVATE_BUILD),true)

# Include keys and crts
PRODUCT_COPY_FILES += \
    vendor/geofferey/private/etc/security/cacerts/3e47067b.0:$(TARGET_COPY_OUT)/system/etc/security/cacerts/3e47067b.0 \
    vendor/geofferey/private/rootfs/adb_keys:$(TARGET_COPY_OUT)/root/adb_keys

endif
