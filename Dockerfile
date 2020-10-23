FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y git cmake build-essential gfortran libopenmpi-dev libblas-dev liblapack-dev
RUN git clone https://github.com/ElmerCSC/elmerfem.git
RUN cd elmerfem && mkdir build && cd build && cmake .. -DWITH_OpenMP:BOOLEAN=FALSE -DWITH_MPI:BOOLEAN=FALSE
RUN cd elmerfem/build && make && make install