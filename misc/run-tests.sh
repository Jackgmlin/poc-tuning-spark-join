#!/bin/bash

DS1_CS=/tmp/apreto/ds1-cs-customers100m.csv
DS1_PO=/tmp/apreto/ds1-po-purchaseOrders20m.csv

DS2_CS=/tmp/apreto/ds2-cs-customers1g.csv
DS2_PO=/tmp/apreto/ds2-po-purchaseOrders100m.csv

DS3_CS=/tmp/apreto/ds3-cs-customers2g.csv
DS3_PO=/tmp/apreto/ds3-po-purchaseOrders1g.csv

## DS4 - Using same PO file as DS3
DS4_CS=/tmp/apreto/ds4-cs-customers10g.csv
DS4_PO=/tmp/apreto/ds3-po-purchaseOrders1g.csv

SPARK_SUBMIT=spark-submit

function runSparkApp() {
  sparkAppToRun=$1
  csFile=$2
  poFile=$3
  maxRuns=$4
  for runNum in `seq 1 $maxRuns` ; do
    echo `date +%Y/%m/%d-%H:%m:%S` - RUNNING $sparkAppToRun RUN $runNum - COMMAND: $SPARK_SUBMIT --master yarn --driver-memory 4g --executor-memory 2g --executor-cores 6 --num-executors 8 --class $sparkAppToRun BL30038-assembly-0.1.jar $csFile $poFile
    $SPARK_SUBMIT --master yarn --driver-memory 4g --executor-memory 2g --executor-cores 6 --num-executors 8 --class $sparkAppToRun BL30038-assembly-0.1.jar $csFile $poFile
  done
}


## run tests for DS1
#runSparkApp B01DatasetJoinNoPartition $DS1_CS $DS1_PO 3
#runSparkApp B02DatasetJoinWithPartition $DS1_CS $DS1_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS1_CS $DS1_PO 3
#runSparkApp A01RDDJoinNoPartition $DS1_CS $DS1_PO 3
#runSparkApp A02RDDJoinWithPartition $DS1_CS $DS1_PO 3

## run tests for DS2
#runSparkApp B01DatasetJoinNoPartition $DS2_CS $DS2_PO 3
#runSparkApp B02DatasetJoinWithPartition $DS2_CS $DS2_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS2_CS $DS2_PO 3
#runSparkApp A01RDDJoinNoPartition $DS2_CS $DS2_PO 3
#runSparkApp A02RDDJoinWithPartition $DS2_CS $DS2_PO 3

## run tests for DS3
#runSparkApp B01DatasetJoinNoPartition $DS3_CS $DS3_PO 3
#runSparkApp B02DatasetJoinWithPartition $DS3_CS $DS3_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS3_CS $DS3_PO 3
#runSparkApp A01RDDJoinNoPartition $DS3_CS $DS3_PO 3
#runSparkApp A02RDDJoinWithPartition $DS3_CS $DS3_PO 3

## run tests for DS4
#runSparkApp B01DatasetJoinNoPartition $DS4_CS $DS4_PO 3
#runSparkApp B02DatasetJoinWithPartition $DS4_CS $DS4_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS4_CS $DS4_PO 3
#runSparkApp A01RDDJoinNoPartition $DS4_CS $DS4_PO 3
#runSparkApp A02RDDJoinWithPartition $DS4_CS $DS4_PO 3

## additional tests for variations of DS4, to compare broadcast joins

# DS4A - DS4_CS with DS1_PO (10Gb Customers join with 20Mb PurchaseOrders) 
#runSparkApp B01DatasetJoinNoPartition $DS4_CS $DS1_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS4_CS $DS1_PO 3

# DS4B - DS4_CS with DS2_PO (10Gb Customers join with 100Mb PurchaseOrders) 
#runSparkApp B01DatasetJoinNoPartition $DS4_CS $DS2_PO 3
#runSparkApp B03DatasetJoinBroadcast $DS4_CS $DS2_PO 3






