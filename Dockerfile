FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-runtime

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    wget \
    git \
    unzip \
    curl \
    nano \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

# Install tensorflow/models require dependencies
COPY requirements.txt .
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y python3-setuptools \
    && pip install -r requirements.txt \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

RUN pip uninstall -y ipython
RUN pip install ipython

# COPY FCHarDNet/ /usr/src/app/FCHarDNet 
COPY *.ipynb /usr/src/app/
COPY *.py /usr/src/app/

COPY data/ /usr/src/app/data/


#RUN pip install mesh_renderer

#COPY torch-1.1.0-cp35-cp35m-linux_x86_64.whl .

#RUN pip3 install torch-1.1.0-cp35-cp35m-linux_x86_64.whl


WORKDIR /usr/src/app/