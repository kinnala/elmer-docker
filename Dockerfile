FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y git cmake build-essential gfortran libopenmpi-dev libblas-dev liblapack-dev
ADD build /bin
RUN chmod 777 /bin/build