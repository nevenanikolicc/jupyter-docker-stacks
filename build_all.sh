#! /bin/bash
cd base-notebook/
docker build -t images.sbgenomics.com/nevena_nikolic/base-notebook-cuda:11.6 .
cd ../minimal-notebook
docker build -t images.sbgenomics.com/nevena_nikolic/minimal-notebook-cuda:11.6 .
cd ../scipy-notebook
docker build -t images.sbgenomics.com/nevena_nikolic/scipy-notebook-cuda:11.6 .
cd ../tensorflow-notebook
<<<<<<< HEAD
sudo docker build -t images.sbgenomics.com/nevena_nikolic/tensorflow-notebook-cuda:11.6 .
=======
sudo docker build -t images.sbgenomics.com/nevena_nikolic/tensorflow-notebook-cuda:11.1 .
>>>>>>> 17e701dc4235392f518e78aa2b9b7dc75204b2e2
