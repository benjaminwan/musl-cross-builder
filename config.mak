STAT = -static --static
FLAG = -g0 -O2 -fno-align-functions -fno-align-jumps -fno-align-loops -fno-align-labels -Wno-error

ifneq ($(NATIVE),)
COMMON_CONFIG += CC="$(HOST)-gcc ${STAT}" CXX="$(HOST)-g++ ${STAT}" FC="$(HOST)-gfortran ${STAT}"
else
COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}" FC="gfortran ${STAT}"
endif

COMMON_CONFIG += CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" FFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

BINUTILS_CONFIG += --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet

CONFIG_SUB_REV = 948ae97c
GCC_VER = 13.3.0
BINUTILS_VER = 2.39
MUSL_VER = 1.2.4
GMP_VER = 6.3.0
MPC_VER = 1.3.1
MPFR_VER = 4.2.1

LINUX_VER = 6.6.28