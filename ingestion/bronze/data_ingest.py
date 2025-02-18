from ingestion.utils.spark_utils import create_spark_session
from ingestion.utils.config_loader import ConfigLoader
from ingestion.utils.file_path_manager import FilePathManager
from ingestion.utils.data_ingestor import DataIngestor

if __name__ == "__main__":
    config = ConfigLoader()
    spark = create_spark_session()
    ingestor = DataIngestor(spark)
    path_manager = FilePathManager(config.base_data_dir, config.lakehouse_s3_path)

    # Ingest ecoride_customers.csv to the Bronze layer
    customer_file = path_manager.get_local_file_path("data", "csv")
    ingestor.ingest_file_to_bronze(customer_file, "newdata", "data", "csv")



