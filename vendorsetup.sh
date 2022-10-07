# Vendor tree
VT=vendor/realme/spaced/spaced-vendor.mk
if ! [ -a $VT ]; then git clone https://github.com/drtsinx92/proprietary_vendor_realme_spaced vendor/realme/spaced
fi

# Vendor-ims tree
VT_IMS=vendor/realme/ims-spaced/mtk-ims.mk
if ! [ -a $VT_IMS ]; then git clone https://github.com/drtsinx92/proprietary_vendor_realme_ims-spaced vendor/realme/ims-spaced

# Kernel tree
KT=kernel/realme/spaced/build.sh
if ! [ -a $KT ]; then git clone --depth=1 https://github.com/drtsinx92/android_kernel_realme_mt6781 kernel/realme/spaced
fi

# frameworks/av (required for sysbta)
cd frameworks/av
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if ! [ "$BRANCH" != "13-sysbta"]; then cd ../.. && git clone --depth=1 https://github.com/rk134/frameworks_av.git frameworks/av
fi

# packages/modules/Bluetooth (required for sysbta)
cd packages/modules/Bluetooth
BRANCH_BT="$(git rev-parse --abbrev-ref HEAD)"
if ! [ "$BRANCH_BT" != "13-sysbta"]; then cd ../../.. && git clone --depth=1 https://github.com/rk134/packages_modules_Bluetooth.git packages/modules/Bluetooth
fi