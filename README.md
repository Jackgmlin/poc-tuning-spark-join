

Tuning/optimizing Spark Joins (BACKLOG-30038 Spike)

This builds an scala app in a uber jar for using with spark-submit. 

Build the uber jar from cmd line using sbt:
 * /opt/sbt-1.2.7/sbt/bin/sbt assembly

This will an uber-jar to be used with spark-submit on target/scala-2.11/BL30038-1.0-assembly.jar. Run it with:
 * /opt/spark/spark-2.3.0-bin-hadoop2.7/bin/spark-submit --master local --class B01DatasetJoinNoPartition target/scala-2.11/BL30038-1.0-assembly.jar
  
Available classes on uber jar to run with spark-submit:
 * A01RDDJoinNoPartition
 * A02RDDJoinWithPartition
 * B01DatasetJoinNoPartition
 * B02DatasetJoinWithPartition
 * B03DatasetJoinBroadcast
  

For running in yarn mode on a cluster (e.g., EMR), copy jar file there and try something like:
 * spark-submit --master yarn --class MainClassName BL30038-1.0-assembly.jar 
 * spark-submit --master yarn --driver-memory 4g --executor-memory 2g --executor-cores 3 --class MainClassName BL30038-1.0-assembly.jar
 * spark-submit --master yarn --driver-memory 4g --executor-memory 2g --executor-cores 3 --num-executors 5 --class MainClassName BL30038-1.0-assembly.jar

  



