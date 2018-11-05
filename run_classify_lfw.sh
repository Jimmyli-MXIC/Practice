#! /bin/bash
atf
align_file="/home/tedev0/gitprojects/dataset/lfw/lfw_mtcnnpy_160"
cd /home/tedev0/gitprojects/facenet

export PYTHONPATH=src
echo "---------TRAIN-----------"
python src/classifier.py TRAIN ~/gitprojects/dataset/lfw/lfw_mtcnnpy_160 \
../models/facenet/20180408-102900/20180408-102900.pb \
../models/classifier_lfw.pkl \
--batch_size 1000 \
--min_nrof_images_per_class 9 \
--nrof_train_images_per_class 6 \
--use_split_dataset \
--seed 333
echo "---------TEST-----------"
python src/classifier.py CLASSIFY ~/gitprojects/dataset/lfw/lfw_mtcnnpy_160 \
../models/facenet/20180408-102900/20180408-102900.pb \
../models/classifier_lfw.pkl \
--batch_size 1000 \
--min_nrof_images_per_class 9 \
--nrof_train_images_per_class 6 \
--use_split_dataset \
--seed 333
