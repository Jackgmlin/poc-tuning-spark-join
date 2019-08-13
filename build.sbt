name := "BL30038"

version := "0.1"

scalaVersion := "2.11.12"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "2.3.2" % "provided" ,
  "org.apache.spark" %% "spark-streaming" % "2.3.2" % "provided",
  "org.apache.spark" %% "spark-sql" % "2.3.2" % "provided" //,
//  "org.apache.spark" %% "spark-mllib" % "2.3.2" ,
//  "com.datastax.spark" %% "spark-cassandra-connector" % "2.3.2",
//  "org.apache.spark" %%  "spark-streaming-flume" % "2.3.2",
//  "org.apache.spark" %%  "spark-streaming-kafka-0-8" % "2.3.2",
//  "org.apache.spark" %%  "spark-streaming-kinesis-asl" % "2.3.2",
//  "org.apache.bahir" %% "spark-streaming-twitter" % "2.2.0"
)
