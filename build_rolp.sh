#!/bin/bash

USER=$(whoami)
work_dir=/home2/${USER}/jdks

path_to_rolp=${work_dir}/yyz-rolp
path_to_jdk8=${work_dir}/ng2c-rolp/jdk8
# path_to_jdk8=${work_dir}/jdk8u-rolp
path_to_bootjdk=${work_dir}/jdk1.7.0_80
# path_to_bootjdk=/usr/lib/jvm/java-8-openjdk-amd64

export DISABLE_HOTSPOT_OS_VERSION_CHECK=ok

# gcc & g++ 4.8.5
# make 3.82
pushd $path_to_jdk8

rm -rf hotspot
cp -r $path_to_rolp hotspot
bash configure clean-dist
bash configure --with-boot-jdk=${path_to_bootjdk} --with-jvm-variants=server --with-target-bits=64 
make images

popd