#! /bin/bash
cd base-notebook/
docker build -t images.sbgenomics.com/nevena_nikolic/base-notebook-cuda:11.1 .
cd ../minimal-notebook
docker build -t images.sbgenomics.com/nevena_nikolic/minimal-notebook-cuda:11.1 .
cd ../scipy-notebook
docker build -t images.sbgenomics.com/nevena_nikolic/scipy-notebook-cuda:11.1 .
cd ../tensorflow-notebook
sudo docker build -t images.sbgenomics.com/nevena_nikolic/tensorflow-notebook-cuda:11.1.3.1.17 .
