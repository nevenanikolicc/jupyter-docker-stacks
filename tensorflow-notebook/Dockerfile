# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/scipy-notebook
#FROM $BASE_CONTAINER
FROM images.sbgenomics.com/nevena_nikolic/scipy-notebook-cuda:11.1

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# Install Tensorflow, Einops, Pytorch, Pytorch Geometric and SBG API
RUN mamba install --quiet --yes -c pytorch -c pyg -c bioconda \ 
    'tensorflow=2.6.*' \
    'einops=0.3.*' \
    'pytorch=1.9.*' \
    'torchvision=0.2.*' \
    'torchaudio=0.9.*' \
    'pyg=2.0.*' \
    'sevenbridges-python=2.7.0' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
    

RUN apt-get update && apt-get install -y openvpn htop