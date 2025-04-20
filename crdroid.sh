rm -rf .repo/local_manifests ; \
rm -rf {device,vendor,kernel,hardware}/xiaomi ; \
repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android -b 15.0 -g default,-mips,-darwin,-notdefault && \
/opt/crave/resync.sh && \
git clone https://github.com/MurtazaKolachi/android_device_xiaomi_apollo_fix -b crdroid device/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/android_vendor_xiaomi_apollo -b main vendor/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/kernel_xiaomi_apollo -b main kernel/xiaomi/apollo && \
git clone https://github.com/MurtazaKolachi/hardware_xiaomi -b fifteen hardware/xiaomi && \
rm -rf  hardware/qcom-caf/common; \
git clone https://github.com/MurtazaKolachi/android_hardware_qcom-caf_common -b lineage-22.2 hardware/qcom-caf/common && \
export BUILD_USERNAME=Murtaza ; \
export BUILD_HOSTNAME=crave ; \
export TZ=Asia/islamabad ; \
source build/envsetup.sh && \
breakfast apollo user && \
#Build GMS
mka bacon
#To get the build:
mv out/target/product/apollo/crDroid*.zip .
curl -T "crDroid*.zip" -u :6604f309-17e3-4a0d-bde2-87ae3a58eff0 https://pixeldrain.com/api/file/
#Build Vanilla
export WITH_GMS=true
mka bacon
#To get the build:
mv out/target/product/apollo/crDroid*.zip .
curl -T "crDroid*.zip" -u :6604f309-17e3-4a0d-bde2-87ae3a58eff0 https://pixeldrain.com/api/file/
