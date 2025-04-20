rm -rf .repo/local_manifests ; \
rm -rf {device,vendor,kernel,hardware}/xiaomi ; \
repo init --depth=1 --no-repo-verify -u https://github.com/RisingOS-Revived/android -b qpr2 -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/MurtazaKolachi/android_device_xiaomi_apollo -b rising device/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/android_vendor_xiaomi_apollo -b main vendor/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/kernel_xiaomi_apollo -b main kernel/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/hardware_xiaomi -b fifteen-old hardware/xiaomi && \
/opt/crave/resync.sh && \
export BUILD_USERNAME=Murtaza ; \
export BUILD_HOSTNAME=crave ; \
export TZ=Asia/islamabad ; \
source build/envsetup.sh && \
riseup apollo user && \
#Build GMS
rise b
#To get the build:
mv out/target/product/apollo
curl -T "Rising*.zip" -u :6604f309-17e3-4a0d-bde2-87ae3a58eff0 https://pixeldrain.com/api/file/
#Build Vanilla
export WITH_GMS=false
rise b
#To get the build:
mv out/target/product/apollo
curl -T "Rising*.zip" -u :6604f309-17e3-4a0d-bde2-87ae3a58eff0 https://pixeldrain.com/api/file/
