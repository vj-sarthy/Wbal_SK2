FROM centos
RUN yum install -y vim git python3 python2 python3-pip
RUN pip3 install click tabulate pandas numpy matplotlib xlrd openpyxl
RUN cd / && \
    git clone https://github.com/vj-sarthy/Wbal_SK2.git && \
    cd Wbal_SK2 && \
    git pull
WORKDIR /Wbal_SK2
