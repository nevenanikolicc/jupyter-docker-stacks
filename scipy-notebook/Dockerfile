# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM images.sbgenomics.com/nevena_nikolic/minimal-notebook-cuda:11.6
LABEL maintainer="Nevena Nikolic <nevena.nikolic@sbgenomics.com>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'altair=4.2.*' \
    'beautifulsoup4=4.11.*' \
    'bokeh=2.4.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=2.1.*' \
    'conda-forge::blas=*=openblas' \
    'cython=0.29*' \
    'dask=2022.5.*' \
    'dill=0.3.5.*' \
    'h5py=3.6.*' \
    'ipympl=0.9.*' \
    'ipywidgets=7.7.*' \
    'matplotlib-base=3.5.*' \
    'numba=0.55.*' \
    'numexpr=2.8.*' \
    'pandas=1.4.*' \
    'patsy=0.5.*' \
    'protobuf=3.19.*' \
    'pytables=3.7.*' \
    'scikit-image=0.19.*' \
    'scikit-learn=1.1.*' \
    'scipy=1.8.*' \
    'seaborn=0.11.*' \
    'sqlalchemy=1.4.*' \
    'statsmodels=0.13.*' \
    'sympy=1.10.*' \
    'widgetsnbextension=3.6.*'\
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
