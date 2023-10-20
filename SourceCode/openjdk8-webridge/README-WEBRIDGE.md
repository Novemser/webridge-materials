## How to build

```shell
./scripts/install_dependencies.sh
./scripts/configure.sh
make all -j CONF=linux-x86_64-normal-zero-release
make all -j CONF=linux-x86_64-normal-server-release
```

The built jdk path will be `/build/linux-x86_64-normal-zero-release/images/j2sdk-image`