In Amazon DynamoDB, partition key and sort key are fundamental components of the table's primary key, which uniquely identifies each item in the table. Here's a breakdown of their roles and how they work:

1. Partition Key (Hash Key):
The partition key is a single attribute that DynamoDB uses to distribute data across partitions for scalability and performance.
It is mandatory for every table and serves as the primary key in a single-key schema.
DynamoDB uses the partition key's value to determine the physical storage location of the data by applying a hash function.
Uniqueness: In a table with only a partition key, each value of the partition key must be unique.

Example:
If the partition key is UserID, each item in the table must have a unique UserID.

2. Sort Key (Range Key):
The sort key is an optional second attribute that, when combined with the partition key, forms a composite primary key.
It allows multiple items to share the same partition key but differentiates them using the sort key.
Items with the same partition key are stored together and sorted by the sort key's value.

Example:
If the composite key is UserID (partition key) and Timestamp (sort key), you can store multiple items for the same UserID, each with a unique Timestamp.

Key Differences:
Aspect	Partition Key	Sort Key
Purpose	Determines the partition location	Differentiates items within a partition
Uniqueness	Must be unique (if no sort key)	Can repeat for the same partition key
Optional	Mandatory	Optional
Use Case Example:
Partition Key Only: A table storing user profiles where UserID is the partition key.
Composite Key: A table storing user orders where UserID is the partition key and OrderID is the sort key, allowing multiple orders per user.

By designing your keys thoughtfully, you can optimize query performance and scalability in DynamoDB.
