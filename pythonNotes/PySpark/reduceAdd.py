myRDD = spark.sparkContext.parallelize([1, 3, 2, 4])
add = lambda x, y: x + y
result = myRDD.reduce(add)
print(result)
# Output: 10


