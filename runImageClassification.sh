#!/usr/bin/env bash

BIGDL_JAR="/code/bigdl-fork/dist/lib/bigdl-0.2.0-jar-with-dependencies.jar"
MODEL_DIR="/home/dgurin/code/bigdl-insightedge/torch-model-pretrained/resnet-18.t7"
IMAGES_DIR="/home/dgurin/code/bigdl-insightedge/test-images-all"

$INSIGHTEDGE_HOME/bin/spark-submit \
--master spark://127.0.0.1:7077 \
--executor-cores 4 \
--total-executor-cores 4 \
--driver-memory 3g \
--executor-memory 5g \
--class com.intel.analytics.bigdl.example.imageclassification.ImagePredictor \
$BIGDL_JAR \
--modelPath $MODEL_DIR \
--folder $IMAGES_DIR \
--modelType torch \
--batchSizePerCore 4 \
--isHdfs false

