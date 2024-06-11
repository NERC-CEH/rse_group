# Big Data File Formats
## Parquet Format
| Summary |  |
| ------- | ---------- |
| License | Apache 2.0 |
| Site    | [https://parquet.apache.org/]() |
| Repo    | [https://github.com/apache/parquet-java/]() |
| Storage | Column store |
| File Type | `.parquet`, `.pq` |
| Compression | Run-length encoding, bit packing, column dictionary |

### Overview
Apache Parquet is a column store file format. It is designed to compress and write data based on columns defined in the data schema, so write performance may be reduced compared to other formats. However, read performance may be improved as reads can be performed using block skipping, and only the data for the desired column is returned(reducing overall I/O). 

The parquet format is widely used in big data analytics settings, data warehouses, and data lakes. It is compatible with technologies such as Spark, Iceberg, and Hive. AWS glue can also easily process it for ETL processing.

The parquet file format stores metadata in the footer of the file, which points to row groups. Each row group contains column blocks storing the data for separate columns for the number of rows in that row group. This can mean certain row groups can be skipped if not needed, and only individual columns relevant to particular queries will be scanned. This generally means faster reads.

### Advantages
- Supports schema evolution
- Reduced I/O during reads

### Disadvantages
- Slower write performance

### Performance
Tested performance using an `ipynb` python notebook using the [`pyarrow`](https://pypi.org/project/pyarrow/) library to read/write `1000` rows of randomised sensor data (based on available FDRI S3 data). Resulting read/write times (over 10 loops) and final parquet file size:

|   |   |
| --------- | ---- |
| Write | 83 ms ± 8.59 ms |
| Read  | 42.5 ms ± 12.2 ms |
| File Size | 322.6 kB |

## Avro Format
| Summary |  |
| ------- | ---------- |
| License | Apache 2.0 |
| Site    | [https://avro.apache.org/]() |
| Repo    | [https://github.com/apache/avro]() |
| Storage | Row-based |
| File Type | `.avro` |
| Compression | Binary |

### Overview
Apache Avro is a row-orientated file format. It provides a self-describing way of storing data and supports the evolution of the data schema over time. The format is primarily focused on being interoperable and easily interchanged between systems.

The Avro file format is compatible with many big data analytics technologies, including Spark and Hadoop. It is commonly used with Kafka and in many message queue systems. AWS glue can also process Avro for ETL processes.

The avro file format consists of a schema defined in the header using JSON format, followed by binary encoded data blocks containing the rows of stored data. This format lends itself well to appending further data to the end of the file for fast updates, but it limits the throughput on reads and thus could lead to reduced query performance. 

### Advantages
- Supports schema evolution
- Self-describing
- Optimised for frequent updates

### Disadvantages
- Slower read performance 

### Performance
Tested performance using an `ipynb` python notebook using the [`pandavro`](https://pypi.org/project/pandavro/) library to read/write `1000` rows of randomised sensor data (based on available FDRI S3 data). Resulting read/write times (over 10 loops) and final avro file size:

|   |   |
| --------- | ---- |
| Write | 667 ms ± 25.3 ms |
| Read  | 401 ms ± 14.8 ms |
| File Size | 820.8 kB |

## Other Formats
- [ORC](https://orc.apache.org/) (similar to parquet)

## References
- [https://airbyte.com/data-engineering-resources/parquet-vs-avro]()
- [https://parquet.apache.org/docs/file-format/]()
- [https://sqream.com/blog/a-detailed-introduction-to-the-avro-data-format/]()