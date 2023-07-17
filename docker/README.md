# 简易步骤安装docker

本教程意在对不熟悉docker构建的参赛队员提供一个参考，如果你已经熟悉docker构建，可以忽略本教程。
教程中存在任何问题欢迎反馈更新改进

## 找到对应的容器版本

访问 [nvidia提供的PyTorch Container](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-23-06.html#rel-23-06)，找到匹配自己版本的容器。
根据自己的docker容器版本，更改Dockerfile中第一行的版本。

>比如我这里是`PyTorch 2.0.0`, 可以在网站上看到对应的docker容器版本是23.05。
> 所以将`FROM nvcr.io/nvidia/pytorch:21.02-py3` 更改为 `FROM nvcr.io/nvidia/pytorch:23.05-py3`

## 安装python导出库
    

```bash
pip install pipreqs
```
这个库用于导出必要的环境

## 复制文件

将该目录下的 `Dockerfile` 和 `build.sh` 复制到你的推理根目录下


## 构建docker镜像

在对应目录下运行命令 `bash build.sh`, 会构建一个名为submission的镜像。之后根据每个题目的测试脚本，运行镜像进行测试即可。