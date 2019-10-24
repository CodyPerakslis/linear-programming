CONTAINER=julia-lp

docker build -t $CONTAINER .

docker run -it --rm -v `pwd`:/usr/app -w /usr/app $CONTAINER julia $1
