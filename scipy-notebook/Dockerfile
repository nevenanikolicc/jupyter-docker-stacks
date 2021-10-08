# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
#FROM $BASE_CONTAINER
FROM images.sbgenomics.com/nevena_nikolic/minimal-notebook-cuda:11.1

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'altair=4.1.*' \
    'beautifulsoup4=4.10.*' \
    'bokeh=2.4.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=2.0.*' \
    'conda-forge::blas=*=openblas' \
    'cython=0.29.*' \
    'dask=2021.09.*' \
    'dill='0.3.* \
    'h5py=3.4.*' \
    'ipympl=0.8.*'\
    'ipywidgets'=7.6.* \
    'matplotlib-base=3.4.*' \
    'numba=0.54.*' \
    'numexpr=2.7.*' \
    'pandas=1.3.*' \
    'patsy=0.5.*' \
    'protobuf=3.18.*' \
    'pytables=3.6.*' \
    'scikit-image=0.18.*' \
    'scikit-learn=1.0' \
    'scipy=1.7.*' \
    'seaborn=0.11.*' \
    'sqlalchemy=1.4.*' \
    'statsmodels=0.13.*' \
    'sympy=1.7.*' \
    'widgetsnbextension=3.5.*'\
    'xlrd=2.0.*' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install facets which does not have a pip or conda package at the moment
WORKDIR /tmp
RUN git clone https://github.com/PAIR-code/facets.git && \
    jupyter nbextension install facets/facets-dist/ --sys-prefix && \
    rm -rf /tmp/facets && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}

WORKDIR "${HOME}"