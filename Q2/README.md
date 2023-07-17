# 蛋白质超家族分类预测


这个项目方便参赛者测试docker镜像是否正确提交，以及提供测试代码的参考，可以根据自己的需求对测试代码进行修改。

## 如何使用

### 1. 安装依赖

```bash
bash downloads.sh
```

### 2. 拉取镜像并运行

```bash
export user=<your username>
export passwd=<your password>
export image=<your image url>
bash run.sh $user $passwd $image
```

### 3. 测试

```bash
python test.py datas/in.lst datas/out.lst
```

## 参考文件

- docker提交相关

    `docs/CBC Challenge 2023阿里云版参赛手册V2.1.1-byC.pdf`

- 比赛题目

    `docs/蛋白质超家族分类预测.pdf`


## FAQ

<details>
<summary>
1. datas文件夹下的示例数据中的pdb（ent）文件中有一行由`REMARK  99 ASTRAL SCOPe-sccs:`开头，这一行是否对应相关的SCOPe分类。
</summary>
是的，为了方便演示，我们在本仓库的测试文件中是含有对应的SCOPe信息的。在最终的比赛测评部分，不会包含相关的信息。
</details>


<details>
<summary>
2. run.sh的作用是什么？test.py呢？
</summary>
run.sh的作用是：

    1. 登录对应的docker hub，使得第2步的pull镜像部分时相关的权限
    2. 拉取(pull)阿里云docker hub的镜像到本地
    3. 运行拉取到本地的docker镜像
        * `--gpus all`: 的作用是传入所有的GPU，在实际测试时数量目前未知，因为可能会根据测评压力调整
        * `--rm`: 在docker镜像运行后删除对应的container
        * `-v `pwd`/datas:/mounted_path`: 将当前目录的datas文件映射到docker内部的 `/mounted_path`目录
        * `$3 bash run.sh /mounted_path/in.lst`:  `$3`为docker image name，运行image工作目录下的run.sh(**注意：**该run.sh由选手提供，并非本文件，需要接受一个参数——pdb的list文件)
        * `> datas/out.lst`: 将输出重定向到 datas/out.lst文件中，用于之后的测评


test.py 通过TM-align方法，计算并对比了输入蛋白质和目标超级家族中所有代表蛋白质的结构相似性，输出每个蛋白质的最高分数和平均分数。

> 代表蛋白质的定义以及相关文件可以参考比赛题目文档：docs/蛋白质超家族分类预测.pdf 
</details>

