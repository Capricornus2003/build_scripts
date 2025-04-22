rm -rf .repo/local_manifests ; \
rm -rf {device,vendor,kernel,hardware}/xiaomi ; \
repo init --depth=1 --no-repo-verify -u https://github.com/crdroidandroid/android -b 15.0 -g default,-mips,-darwin,-notdefault && \
/opt/crave/resync.sh && \
git clone https://github.com/crdroidandroid/android_vendor_xiaomi_jason -b 15.0 vendor/xiaomi/jason && \
git clone https://github.com/crdroidandroid/android_kernel_xiaomi_jason -b 15.0 kernel/xiaomi/jason && \
git clone https://github.com/crdroidandroid/android_device_xiaomi_jason -b 15.0 device/xiaomi/jason && \
git clone https://github.com/crdroidandroid/android_hardware_xiaomi -b 15.0 hardware/xiaomi && \
export BUILD_USERNAME=Murtaza ; \
export BUILD_HOSTNAME=crave ; \
export TZ=Asia/Taipei ; \
source build/envsetup.sh && \
breakfast jason userdebug && \
#Build GMS
mka bacon
#To get the build:
mv out/target/product/jason/crDroid*.zip .
curl -T "crDroid*.zip" -u :9db1fe94-0290-4a17-b317-b79c3957ac25 https://pixeldrain.com/api/file/
#Build Vanilla
export WITH_GMS=true
mka bacon
#To get the build:
mv out/target/product/jason/crDroid*.zip .
curl -T "crDroid*.zip" -u :59770441-c926-43c0-b338-c8239eea4fe2 https://pixeldrain.com/api/file/
