# musl-cross-builder

### 介绍

musl libc是另一种C标准库，比glibc更小巧，并支持静态链接CRT；
在PC上，为了使编译出来的可执行文件能在某种CPU架构的各发行版中运行，可以使用musl编译器来制作静态链接的可执行文件;
本仓库仅用来编译适用于各架构的musl toolchains，没有源代码；

### 源代码和相关资源

源代码来自：https://git.zv.io/toolchains/musl-cross-make
工具链也可以从此处下载：https://musl.cc/
原始代码仓库来自：https://github.com/richfelker/musl-cross-make

### 工具链部署

- 运行环境ubuntu2204
- 这里以x86_64-linux-musl为例
- 把7z压缩包解压到/opt/x86_64-linux-musl
- 修改~/.bashrc增加Path

```text
PATH="/opt/x86_64-linux-musl/bin:$PATH"
```

### x86 native build

* 这里特指在x86_64平台上进行本机编译 host==target
* 注意：如果想在树莓派或riscv等板子上进行本机编译，需要去musl.cc下载以-native结尾的工具链

```shell
#没有添加PATH时，可以用绝对路径
export CC="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-gcc"
export CXX="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-g++"

#有添加PATH时
export CC="x86_64-linux-musl-gcc"
export CXX="x86_64-linux-musl-g++"
......
cmake ......
```

### 其它项

```shell
export C_INCLUDE_PATH="/opt/x86_64-linux-musl/x86_64-linux-musl/include"
export LD="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-ld"
export AR="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-ar"
export RANLIB="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-ranlib"
export OBJCOPY="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-objcopy"
export OBJDUMP="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-objdump"
export STRIP="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-strip"
export NM="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-nm"
export SIZE="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-size"
export CPP="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-cpp"
export AS="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-as"
export F77="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-gfortran"
``

### cross build(交叉编译)
* 在x86平台上，使用工具链编译出其它平台的可执行文件
* x86平台本机编译也可以使用此方法，cmake可以兼容
```shell
#从本仓库下载musl-cross.toolchain.cmake放到需要编译的项目里
#使用参数传入 -DCMAKE_TOOLCHAIN_FILE=路径/musl-cross.toolchain.cmake

#配置TOOLCHAIN_NAME，支持的名称在下面的表格中列出
export TOOLCHAIN_NAME="riscv64-linux-musl"

#配置TOOLCHAIN_PATH，你自己部署工具链的路径
export TOOLCHAIN_PATH="/opt/riscv64-linux-musl"

cmake -DCMAKE_TOOLCHAIN_FILE=path/to/musl-cross.toolchain.cmake \
      -DCMAKE_C_FLAGS="-pthread" -DCMAKE_CXX_FLAGS="-pthread" \
      ..
    
```

### 工具链列表

| 工具链名称                    | 备注      | 
|--------------------------|---------|
| aarch64-linux-musl       |         |
| aarch64_be-linux-musl    |         |
| arm-linux-musleabi       |         |
| arm-linux-musleabihf     |         |
| armeb-linux-musleabi     |         |
| armeb-linux-musleabihf   |         |
| armel-linux-musleabi     |         |
| armel-linux-musleabihf   |         |
| armv5l-linux-musleabi    |         |
| armv5l-linux-musleabihf  |         |
| armv6-linux-musleabi     |         |
| armv6-linux-musleabihf   |         |
| armv7l-linux-musleabihf  |         |
| armv7m-linux-musleabi    |         |
| armv7r-linux-musleabihf  |         |
| i486-linux-musl          |         |
| i686-linux-musl          |         |
| m68k-linux-musl          |         |
| microblaze-linux-musl    |         |
| microblazeel-linux-musl  |         |
| mips-linux-musl          |         |
| mips-linux-muslsf        |         |
| mips-linux-musln32sf     |         |
| mips64-linux-musl        |         |
| mips64-linux-musln32     |         |
| mips64-linux-musln32sf   |         |
| mips64el-linux-musl      |         |
| mips64el-linux-musln32   |         |
| mips64el-linux-musln32sf |         |
| mipsel-linux-musl        |         |
| mipsel-linux-musln32     |         |
| mipsel-linux-musln32sf   |         |
| mipsel-linux-muslsf      |         |
| or1k-linux-musl          |         |
| powerpc-linux-musl       |         |
| powerpc-linux-muslsf     |         |
| powerpc64-linux-musl     |         |
| powerpc64le-linux-musl   |         |
| powerpcle-linux-musl     |         |
| powerpcle-linux-muslsf   |         |
| riscv32-linux-musl       |         |
| riscv64-linux-musl       |         |
| s390x-linux-musl         |         |
| sh2-linux-musl           |         |
| sh2-linux-muslfdpic      |         |
| sh2eb-linux-musl         |         |
| sh2eb-linux-muslfdpic    |         |
| sh4-linux-musl           |         |
| sh4eb-linux-musl         |         |
| x86_64-linux-musl        | 一般家用PC机 |
| x86_64-linux-muslx32     |         |
