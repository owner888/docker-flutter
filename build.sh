#! /bin/bash

docker build -t flutter:v1 .

# docker run -it --entrypoint /bin/bash --platform linux/amd64 --name flutter-test1 6c673b80819c

# flutter build linux
# https://docs.flutter.dev/get-started/install/linux/desktop?tab=download

# 查看容器列表
# docker ps -a
# 容器和宿主机文件互相拷贝，不管容器有没有启动，拷贝命令都会生效
# 从容器拷贝文件到宿主机
# docker cp mycontainer:/home/user/demo/build/linux/x64/release/bundle/demo ./
# 从宿主机拷贝文件到容器
# docker cp ./file.txt mycontainer:/home/user/
