#!/usr/bin/env bash

#$INSIGHTEDGE_HOME/bin/spark-submit

MASTER="127.0.0.1:7077"
BASE_DIR="/code/intel-bigdl-xap-demo/textclassification-data" # where is the data
$INSIGHTEDGE_HOME/bin/spark-submit --master spark://127.0.0.1:7077 --driver-memory 5g --executor-memory 5g  \
           --total-executor-cores 2 --executor-cores 2                                \
           --class com.intel.analytics.bigdl.example.textclassification.TextClassifier \
           /code/BigDL/dist/lib/bigdl-0.2.0-SNAPSHOT-jar-with-dependencies.jar --batchSize 128              \
           --baseDir ${BASE_DIR} --partitionNum 4



#
#%spark
#
#import com.intel.analytics.bigdl.utils.{Engine, LoggerFilter, T}
#import org.apache.log4j.{Level => Levle4j, Logger => Logger4j, Appender}
#import org.apache.spark.SparkContext
#import org.apache.spark.rdd.RDD
#import org.slf4j.{Logger, LoggerFactory}
#import scopt.OptionParser
#
#
#import java.io.OutputStream
#import org.apache.log4j.{ConsoleAppender, Layout, PatternLayout}
#
#
#/**
#  * @author Danylo_Hurin.
#  */
#class ZeppelinAppender(os: OutputStream) extends ConsoleAppender {
#
#  def this(os: OutputStream, l: Layout) {
#    this(os)
#    setLayout(l)
#  }
#
#  override def activateOptions(): Unit = {
#    setWriter(createWriter(os))
#  }
#}
#
#
#val pattern = "%d{yyyy-MM-dd HH:mm:ss} %-5p - %m%n"
#val zeppelinAppender = new ZeppelinAppender(z.getInterpreterContext().out, new PatternLayout(pattern))
#zeppelinAppender.setThreshold(Levle4j.DEBUG)
#zeppelinAppender.activateOptions()
#
#val logger = Logger4j.getLogger(this.getClass)
#logger.addAppender(zeppelinAppender)
#
#logger.info("Hello from logger")
#
#val intelLog = Logger4j.getLogger("com.intel")
#intelLog.addAppender(zeppelinAppender)
#
#intelLog.info("hello from intel")
#
#val args = Array("--batchSize", "128", "--baseDir", "/home/dgurin/code/intel-bigdl-xap-demo/textclassification-data", "--partitionNum", "4")
#localParser.parse(args, TextClassificationParams()).map { param =>
#      intelLog.info(s"Current parameters: $param")
#       val textClassification = new TextClassifier(param)
#       textClassification.train()
#}