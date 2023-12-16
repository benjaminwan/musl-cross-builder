GCC_VER = 11.2.0
MUSL_VER = git-b76f37fd5625d038141b52184956fb4b7838e9a5
COMMON_CONFIG += CFLAGS="-g0 -O3" CXXFLAGS="-g0 -O3" LDFLAGS="-s"
GCC_CONFIG += --enable-default-pie --enable-static-pie