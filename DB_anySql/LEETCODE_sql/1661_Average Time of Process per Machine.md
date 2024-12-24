# Average Time of Process per Machine

Database
Approach 1: Transform Values with CASE WHEN and then Calculate
Algorithm
To calculate the time to complete a process, we need to know the difference between the 'start' timestamp and the 'end' timestamp for each machine and process. If we set all the 'start' timestamp to its negative value, we can get the time difference by using SUM(), since (-start) + end is equal to end - start, which is the time difference.

To do this, we use CASE WHEN to multiply all the start timestamp by -1, so the aggregated total of timestamp becomes the time to complete a process for each machine.
```sql
SUM(CASE WHEN activity_type = 'start' THEN timestamp*-1 ELSE timestamp END)
```
Since we need the average by each machine_id and there might be multiple processes for each machine, we manually calculate the average by having the processing time divided by the number of processes. Luckily, for this question, all machines have the same number of processes.

```sql
SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0/(SELECT COUNT(DISTINCT process_id))
```

Lastly, we round the processing_time to 3 decimal places by using the function ROUND() and rename the column name.
```sql
ROUND(SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0/(SELECT COUNT(DISTINCT process_id)),3) AS processing_time
```
Implementation
```sql
SELECT 
    machine_id,
    ROUND(SUM(CASE WHEN activity_type='start' THEN timestamp*-1 ELSE timestamp END)*1.0
    / (SELECT COUNT(DISTINCT process_id)),3) AS processing_time
FROM 
    Activity
GROUP BY machine_id
​```

Approach 2: Calling the original Table twice and Calculate as two columns
Algorithm
For this approach, we are calling the original table twice, once as the table that stores the start timestamps and once as the table that stores the end timestamps. To create the table alias, we give the original table Activity two different names, and filter each table by the activity_type. We also make sure the two tables are joined on the machine_id and process_id, so the output will have the start timestamp and end timestamp stored in two different columns for each machine and process.

```sql
SELECT *
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'
```

The output looks like this:

machine_id	|process_id	|activity_type	|timestamp	|machine_id	|process_id	|activity_type	|timestamp
|---|---|---|---|---|---|---|---|
| 0	| 0	| start	| 0.712	| 0	| 0	| end	| 1.52	| 
| 0	| 1	| start	| 3.14	| 0	| 1	| end	| 4.12	| 
| 1	| 0	| start	| 0.55	| 1	| 0	| end	| 1.55	| 
| 1	| 1	| start	| 0.43	| 1	| 1	| end	| 1.42	| 
| 2	| 0	| start	| 4.1	| 2	| 0	| end	| 4.512	| 
| 2	| 1	| start	| 2.5	| 2	| 1	| end	| 5	| 


With this table, we can update the calculation for processing_time by having all the timestamps from table b (end timestamp) to subtract all the timestamp in table a (start timestamp):
```sql
SELECT (b.timestamp - a.timestamp) AS processing_time
```
Since we want the average processing_time at the machine_id level, we add AVG() to the processing_time calculation and round it to 3 decimal places using the function ROUND().
```sql
SELECT a.machine_id, 
       ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
```

Implementation

```sql
SELECT a.machine_id, 
       ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'
GROUP BY machine_id
```
