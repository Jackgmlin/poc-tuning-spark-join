#!/bin/bash


## Generate DS1 - CS 100Mb, PO 20Mb
## generate customers-dataset 100m
#java -jar datagencli.jar --mbs=100 --separator=\; --fields='internet.uuid,idNumber.valid,name.fullName,date.birthday,name.title,name.username,internet.emailAddress,randomLong(1:1000),address.fullAddress' --header='customerId;idNumber;fullName;dateOfBirth;title;username;email;customerGroup;address' > ds1-cs-customers100m-tmp.csv

## generate purchase orders dataset 20m
#java -jar datagencli.jar --mbs=20 --separator=\; --fields='internet.uuid,randomLong(1:10000),randomLong(1:10000),commerce.productName,lorem.sentence,commerce.price,address.fullAddress,randomLong(2010:2019)' --header='productOrderId;customerGroupId;productId;productName;productDescription;price;deliveryAddress;orderYear' > ds1-po-purchaseOrders20m-tmp.csv 


## Generate DS2 - CS 1Gb, PO 100Mb
## generate customers-dataset 1G
#java -jar datagencli.jar --mbs=1000 --separator=\; --fields='internet.uuid,idNumber.valid,name.fullName,date.birthday,name.title,name.username,internet.emailAddress,randomLong(1:1000),address.fullAddress' --header='customerId;idNumber;fullName;dateOfBirth;title;username;email;customerGroup;address' > ds2-cs-customers1g-tmp.csv

## generate purchase orders dataset 100m
#java -jar datagencli.jar --mbs=100 --separator=\; --fields='internet.uuid,randomLong(1:10000),randomLong(1:10000),commerce.productName,lorem.sentence,commerce.price,address.fullAddress,randomLong(2010:2019)' --header='productOrderId;customerGroupId;productId;productName;productDescription;price;deliveryAddress;orderYear' > ds2-po-purchaseOrders100m-tmp.csv 

## Generate DS3 - CS 1.8Gb, PO 1Gb
## generate customers-dataset 1.8G
#java -jar datagencli.jar --mbs=1800 --separator=\; --fields='internet.uuid,idNumber.valid,name.fullName,date.birthday,name.title,name.username,internet.emailAddress,randomLong(1:1000),address.fullAddress' --header='customerId;idNumber;fullName;dateOfBirth;title;username;email;customerGroup;address' > ds3-cs-customers2g-tmp.csv

## generate purchase orders dataset 1G
#java -jar datagencli.jar --mbs=1000 --separator=\; --fields='internet.uuid,randomLong(1:10000),randomLong(1:10000),commerce.productName,lorem.sentence,commerce.price,address.fullAddress,randomLong(2010:2019)' --header='productOrderId;customerGroupId;productId;productName;productDescription;price;deliveryAddress;orderYear' > ds3-po-purchaseOrders1g-tmp.csv 


## Generate DS4 - CS 10Gb, PO 1Gb
## generate customers-dataset 10G
#java -jar datagencli.jar --mbs=10000 --separator=\; --fields='internet.uuid,idNumber.valid,name.fullName,date.birthday,name.title,name.username,internet.emailAddress,randomLong(1:1000),address.fullAddress' --header='customerId;idNumber;fullName;dateOfBirth;title;username;email;customerGroup;address' > ds4-cs-customers10g-tmp.csv

## generate purchase orders dataset 1G - can reuse same as ds3
#java -jar datagencli.jar --mbs=1000 --separator=\; --fields='internet.uuid,randomLong(1:10000),randomLong(1:10000),commerce.productName,lorem.sentence,commerce.price,address.fullAddress,randomLong(2010:2019)' --header='productOrderId;customerGroupId;productId;productName;productDescription;price;deliveryAddress;orderYear' > ds4-po-purchaseOrders1g-tmp.csv 




