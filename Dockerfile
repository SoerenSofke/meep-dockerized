FROM linuxserver/code-server

COPY config.yaml /root/.config/code-server/config.yaml
COPY Miniconda3-latest-Linux-x86_64.sh /root/miniconda3/miniconda.sh

WORKDIR /root

RUN mkdir -p /root/miniconda3 \
    && bash /root/miniconda3/miniconda.sh -b -u -p /root/miniconda3 \
    && rm -rf ~/miniconda3/miniconda.sh \
    && /root/miniconda3/bin/conda init bash \
    && cat /config/.bashrc >> /root/.bashrc \
    && mv /config/.conda/ /root/ \
    && rm -r /config

RUN /root/miniconda3/bin/conda create -n mp -c conda-forge pymeep pymeep-extras
