#!/bin/bash

BUILDDIR="build/target/sc-hsm-pkcs11"

mkdir -p ${BUILDDIR}/lib
mkdir -p ${BUILDDIR}/bin
./configure
make clean
make
cp src/pkcs11/.libs/libsc-hsm-pkcs11.so ${BUILDDIR}/lib/sc-hsm-pkcs11.dylib
./configure --enable-debug
make clean
make
cp src/pkcs11/.libs/libsc-hsm-pkcs11.so ${BUILDDIR}/lib/sc-hsm-pkcs11-debug.dylib
cp src/tests/sc-hsm-pkcs11-test ${BUILDDIR}/bin
pkgbuild --root build/target --identifier de.cardcontact.sc-hsm-pkcs11 --version 0.1 --install-location /Library sc-hsm-pkcs11.pkg
