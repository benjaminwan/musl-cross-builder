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

### 使用工具链

```shell
#没有添加PATH时，可以用绝对路径
export CC="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-gcc -static"
export CXX="/opt/x86_64-linux-musl/bin/x86_64-linux-musl-g++ -static"
#有添加PATH时
export CC="x86_64-linux-musl-gcc -static"
export CXX="x86_64-linux-musl-g++ -static"
cmake ......
```