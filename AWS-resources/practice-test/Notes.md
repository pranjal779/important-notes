Question 40
Incorrect
A file-hosting service uses Amazon Simple Storage Service (Amazon S3) under the hood to power its storage offerings. Currently all the customer files are uploaded directly under a single Amazon S3 bucket. The engineering team has started seeing scalability issues where customer file uploads have started failing during the peak access hours with more than 5000 requests per second.

Which of the following is the MOST resource efficient and cost-optimal way of addressing this issue?

Change the application architecture to create a new Amazon S3 bucket for each customer and then upload each customer's files directly under the respective buckets

Change the application architecture to create a new Amazon S3 bucket for each day's data and then upload the daily files directly under that day's bucket

Correct answer
Change the application architecture to create customer-specific custom prefixes within the single Amazon S3 bucket and then upload the daily files into those prefixed locations

Your answer is incorrect
Change the application architecture to use Amazon Elastic File System (Amazon EFS) instead of Amazon S3 for storing the customers' uploaded files

Overall explanation
Correct option:

Change the application architecture to create customer-specific custom prefixes within the single Amazon S3 bucket and then upload the daily files into those prefixed locations

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. Your applications can easily achieve thousands of transactions per second in request performance when uploading and retrieving storage from Amazon S3. Amazon S3 automatically scales to high request rates. For example, your application can achieve at least 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per prefix in a bucket.

There are no limits to the number of prefixes in a bucket. You can increase your read or write performance by parallelizing reads. For example, if you create 10 prefixes in an Amazon S3 bucket to parallelize reads, you could scale your read performance to 55,000 read requests per second. Please see this example for more clarity on prefixes: if you have a file f1 stored in an S3 object path like so s3://your_bucket_name/folder1/sub_folder_1/f1, then /folder1/sub_folder_1/ becomes the prefix for file f1.

Some data lake applications on Amazon S3 scan millions or billions of objects for queries that run over petabytes of data. These data lake applications achieve single-instance transfer rates that maximize the network interface used for their Amazon EC2 instance, which can be up to 100 Gb/s on a single instance. These applications then aggregate throughput across multiple instances to get multiple terabits per second. Therefore creating customer-specific custom prefixes within the single bucket and then uploading the daily files into those prefixed locations is the BEST solution for the given constraints.

Optimizing Amazon S3 Performance:  via - https://docs.aws.amazon.com/AmazonS3/latest/dev/optimizing-performance.html
![image](https://github.com/user-attachments/assets/63175893-38c8-4912-b548-6e4493561c7e)


Incorrect options:

Change the application architecture to create a new Amazon S3 bucket for each customer and then upload each customer's files directly under the respective buckets - Creating a new Amazon S3 bucket for each new customer is an inefficient way of handling resource availability (S3 buckets need to be globally unique) as some customers may use the service sparingly but the bucket name is locked for them forever. Moreover, this is really not required as we can use S3 prefixes to improve the performance.

Change the application architecture to create a new Amazon S3 bucket for each day's data and then upload the daily files directly under that day's bucket - Creating a new Amazon S3 bucket for each new day's data is also an inefficient way of handling resource availability (S3 buckets need to be globally unique) as some of the bucket names may not be available for daily data processing. Moreover, this is really not required as we can use S3 prefixes to improve the performance.

Change the application architecture to use Amazon Elastic File System (Amazon EFS) instead of Amazon S3 for storing the customers' uploaded files - Amazon EFS is a costlier storage option compared to Amazon S3, so it is ruled out.

Reference:

https://docs.aws.amazon.com/AmazonS3/latest/dev/optimizing-performance.html

Domain
Design High-Performing Architectures
