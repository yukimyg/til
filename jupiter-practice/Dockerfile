FROM ubuntu:latest

# update
RUN apt-get -y update && apt-get install -y \
sudo \
wget \
vim

#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh && \
sh /opt/Anaconda3-2024.10-1-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2024.10-1-Linux-x86_64.sh
# set path
ENV PATH /opt/anaconda3/bin:$PATH

# update pip and conda
RUN pip install --upgrade pip

WORKDIR /
RUN mkdir /work

# execute jupyterlab as a default command
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--LabApp.token=''"]
