# surgio-docker
a docker image for surgio.

### 说明
使用docker快速搭建surgio托管API并启动web服务：

+ web网关监听HTTP端口为`3000`;
+ 使用[surgio-store](https://github.com/geekdada/create-surgio-store)的默认配置;
+ 挂载自定义配置到`/var/config`目录下，将覆盖默认配置中对应的文件;
+ 具体启动方式可参考`docker-compose.yml`;

### 官方文档
[https://surgio.royli.dev/guide/advance/api-gateway.html](https://surgio.royli.dev/guide/advance/api-gateway.html)


### 问题反馈
[https://github.com/quericy/surgio-docker/issues](https://github.com/quericy/surgio-docker/issues)
