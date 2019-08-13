
//import org.apache.spark._
import org.apache.log4j.{Logger,Level}

import org.apache.spark.sql._

object B01DatasetJoinNoPartition {

  def main(args: Array[String]) {

    var fileDS1CS="/tmp/ds1-cs-customers100m.csv"
    var fileDS1PO="/tmp/ds1-po-purchaseOrders20m.csv"
    if (args.length == 2) {
      fileDS1CS = args(0)
      fileDS1PO = args(1)
    }

    Logger.getLogger("org").setLevel(Level.ERROR) // less verbose spark
    val spark = SparkSession.builder.appName("B01DatasetJoinNoPartition").getOrCreate()
    import spark.implicits._

    val startTimeMs = System.currentTimeMillis()


    val poDs = spark.read.option("delimiter",";").option("header",true).option("inferSchema",true).csv(fileDS1PO)
    val csDs = spark.read.option("delimiter",";").option("header",true).option("inferSchema",true).csv(fileDS1CS)
    // attempt a join - PoC B.1
    val join1 = csDs.join(poDs,$"customerGroup"===$"customerGroupId")

    val cnt1 = join1.count
    //join1.write.option("header",true).csv("/tmp/join1.csv")
    println( "%s: %d rows processed in %d ms".format(this.getClass.getName, cnt1, (System.currentTimeMillis() - startTimeMs)))


    spark.stop();

  }

}
