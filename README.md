# musl-cross-builder

### 介绍

musl libc是另一种C标准库，比glibc更小巧，并支持静态链接CRT；
在PC上，为了使编译出来的可执行文件能在某种CPU架构的各发行版中运行，可以使用musl编译器来制作静态链接的可执行文件;
本仓库用来编译适用于各架构的musl toolchains，工具链可以在github actions的ubuntu2204平台中运行；

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
export CC="x86_64-linux-musl-gcc -static"
export CXX="x86_64-linux-musl-g++ -static"
cmake ......
```