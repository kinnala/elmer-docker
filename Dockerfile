FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y git cmake build-essential gfortran libopenmpi-dev libblas-dev liblapack-dev
ADD ./elmerfem /elmerfem
RUN mkdir -p /build && cd /build && cmake /elmerfem -DWITH_OpenMP:BOOLEAN=FALSE -DWITH_MPI:BOOLEAN=FALSE && make && make install