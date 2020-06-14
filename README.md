# covid19_xray_pytoch

docker run -p 8888:8888 -v `pwd`/shared:/usr/src/app/shared -it --rm --gpus all covid19

jupyter lab --ip=0.0.0.0 --port=8888 --allow-root