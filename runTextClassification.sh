#!/usr/bin/env bash

BASE_DIR="/code/intel-bigdl-xap-demo/textclassification-data" # where is the data
$INSIGHTEDGE_HOME/bin/spark-submit --master spark://127.0.0.1:7077 --driver-memory 5g --executor-memory 5g  \
           --total-executor-cores 2 --executor-cores 2                                \
           --class com.intel.analytics.bigdl.example.textclassification.TextClassifier \
           /code/BigDL/dist/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar --batchSize 128              \
           --baseDir ${BASE_DIR} --partitionNum 4

