set -e
docker login --username $1 --password $2 $3
docker pull $3

mkdir -p datas/out
docker run --rm -it --ipc=host --gpus all -v `pwd`/datas:/mounted/ $3 bash run.sh  /mounted/in.lst /mounted/out
