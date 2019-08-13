
//import org.apache.spark._
import org.apache.log4j.{Logger,Level}

import org.apache.spark.sql._

object A01RDDJoinNoPartition {

  def main(args: Array[String]) {

    var fileDS1CS="/tmp/ds1-cs-customers100m.csv"
    var fileDS1PO="/tmp/ds1-po-purchaseOrders20m.csv"
    if (args.length == 2) {
      fileDS1CS = args(0)
      fileDS1PO = args(1)
    }

    Logger.getLogger("org").setLevel(Level.ERROR) // less verbose spark
    val spark = SparkSession.builder.appName("A01RDDJoinNoPartition").getOrCreate()
    //import spark.implicits._

    val startTimeMs = System.currentTimeMillis()

    val poRdd = spark.read.option("delimiter",";").option("header",true).option("inferSchema",true).csv(fileDS1PO).rdd
    val csRdd= spark.read.option("delimiter",";").option("header",true).option("inferSchema",true).csv(fileDS1CS).rdd

    // move to pairRdd-like format (joinKey, row) so we can join on common key
    val poPairRdd = poRdd.map( r => (r(1),r) ) // customerGroupId column is at position 1 of po Row
    val csPairRdd = csRdd.map( r => (r(7),r) ) // customerGroup column is at position 7 of cs Row

    // attempt a join - PoC A.1
    val rddJoin1 = csPairRdd.join(poPairRdd)

    val cnt1 = rddJoin1.count
    //rddJoin1.toDF().write.csv("/tmp/rddJoin1.csv")
    println( "%s: %d rows processed in %d ms".format(this.getClass.getName, cnt1, (System.currentTimeMillis() - startTimeMs)))


    spark.stop();

  }

}
