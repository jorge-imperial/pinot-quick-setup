#!/bin/bash

export PINOT_PATH=`pwd`/apache-pinot
export PINOT_LIBS=$PINOT_PATH/lib
export PINOT_PLUGINS=$PINOT_PATH/plugins
# This better be version 11.
export JAVA=`which java`

export ZOOKEEPER_PORT=2181
export ZOOKEEPER=localhost:$ZOOKEEPER_PORT
export ZOOKEEPER_DATA_DIR=$PINOT_PATH/PinotAdmin/zkData

# Zookeeper
$JAVA -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=13182 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartZookeeper -zkPort $ZOOKEEPER_PORT -dataDir $ZOOKEEPER_DATA_DIR > zookeeper.log  2>&1 &
echo "Started zookeeper" && sleep 10

# Pinot controllers
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=13774 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartController -zkAddress $ZOOKEEPER -clusterName PinotCluster -controllerPort 9001 > controller0.log 2>&1 &
sleep 10
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=14131 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartController -zkAddress $ZOOKEEPER -clusterName PinotCluster -controllerPort 9002 > controller1.log 2>&1 &
echo "Started Controllers" && sleep 15

# Pinot brokers
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=15462 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartBroker -zkAddress $ZOOKEEPER -clusterName PinotCluster -brokerPort 7001 > broker0.log 2>&1 &
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=15672 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartBroker -zkAddress $ZOOKEEPER -clusterName PinotCluster -brokerPort 7002 > broker1.log 2>&1 &
echo "Started brokers" && sleep 5

# Pinot servers
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=17426 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartServer -zkAddress $ZOOKEEPER -clusterName PinotCluster -serverPort 8001 -serverAdminPort 8011 -serverGrpcPort 8090 > server0.log 2>&1  & 
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=17787 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartServer -zkAddress $ZOOKEEPER -clusterName PinotCluster -serverPort 8002 -serverAdminPort 8012 -serverGrpcPort 8091 > server1.log 2>&1  &
echo "Started servers" && sleep 5

# Start a minion
$JAVA -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=43912 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartMinion -zkAddress $ZOOKEEPER > minion.log 2>&1 &
echo "Started a minion" && sleep 5

# Kafka?
$JAVA  -Xms4G -Xmx8G -Dplugins.dir=$PINOT_PLUGINS -classpath $PINOT_LIBS/*:$PINOT_PLUGINS/pinot-environment/pinot-azure/pinot-azure-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-adls/pinot-adls-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-s3/pinot-s3-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-hdfs/pinot-hdfs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-file-system/pinot-gcs/pinot-gcs-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-minion-tasks/pinot-minion-builtin-tasks/pinot-minion-builtin-tasks-1.0.0.jar:$PINOT_PLUGINS/pinot-metrics/pinot-dropwizard/pinot-dropwizard-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-metrics/pinot-yammer/pinot-yammer-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-orc/pinot-orc-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-parquet/pinot-parquet-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-clp-log/pinot-clp-log-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-json/pinot-json-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-csv/pinot-csv-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-avro/pinot-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-protobuf/pinot-protobuf-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-thrift/pinot-thrift-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-input-format/pinot-confluent-avro/pinot-confluent-avro-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-writer/pinot-segment-writer-file-based/pinot-segment-writer-file-based-1.0.0.jar:$PINOT_PLUGINS/pinot-batch-ingestion/pinot-batch-ingestion-standalone/pinot-batch-ingestion-standalone-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-segment-uploader/pinot-segment-uploader-default/pinot-segment-uploader-default-1.0.0.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-pulsar/pinot-pulsar-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kinesis/pinot-kinesis-1.0.0-shaded.jar:$PINOT_PLUGINS/pinot-stream-ingestion/pinot-kafka-2.0/pinot-kafka-2.0-1.0.0-shaded.jar -Dapp.name=pinot-admin -Dapp.pid=23107 -Dapp.repo=$PINOT_LIBS -Dapp.home=$PINOT_PATH -Dbasedir=$PINOT_PATH org.apache.pinot.tools.admin.PinotAdministrator StartKafka -zkAddress=$ZOOKEEPER/kafka -port 9876 > kafka0.log 2>&1  &
echo "Started Kafka" 
echo "Done!"
