#! /bin/bash
atf
align_file="/home/tedev0/gitprojects/dataset/img_data_0920_mtcnnpy_160"
cd /home/tedev0/gitprojects/facenet

export PYTHONPATH=src
if [ ! -d "$align_file" ]; then
    echo "---------ALIGN-----------"
    python src/align/align_dataset_mtcnn.py \
    ~/gitprojects/dataset/img_data_0920 \
    ~/gitprojects/dataset/img_data_0920_mtcnnpy_160 \
    --image_size 160 \
    --margin 32 \
    --random_order \
    --gpu_memory_fraction 0.25
fi
echo "---------TRAIN-----------"
python src/classifier.py TRAIN ~/gitprojects/dataset/img_data_0920_mtcnnpy_160 \
../models/facenet/20180408-102900/20180408-102900.pb \
../models/classifier.pkl \
--batch_size 1000 \
--min_nrof_images_per_class 6 \
--nrof_train_images_per_class 5 \
--use_split_dataset \
--seed 333
echo "---------TEST-----------"
python src/classifier.py CLASSIFY ~/gitprojects/dataset/img_data_0920_mtcnnpy_160 \
../models/facenet/20180408-102900/20180408-102900.pb \
../models/classifier.pkl \
--batch_size 1000 \
--min_nrof_images_per_class 6 \
--nrof_train_images_per_class 5 \
--use_split_dataset \
--seed 333
