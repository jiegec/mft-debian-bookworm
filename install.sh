#!/bin/sh
set -x
wget --no-clobber https://www.mellanox.com/downloads/MFT/mft-4.20.1-14-x86_64-deb.tgz
tar xvf mft-4.20.1-14-x86_64-deb.tgz
cd mft-4.20.1-14-x86_64-deb
dpkg -i SDEBS/kernel-mft-dkms_4.20.1-14_all.deb
cat ../mst_pciconf.patch | (cd /usr/src/kernel-mft-dkms-4.20.1 && patch)
dkms install kernel-mft-dkms/4.20.1
dpkg -i DEBS/mft_4.20.1-14_amd64.deb
