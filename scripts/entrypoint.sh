#!/usr/bin/env bash
# sincroniza DAGs desde S3 (opcional)
# aws s3 sync s3://mi-bucket-airflow/dags /opt/airflow/dags

# luego delega al entrypoint original
exec /entrypoint airflow "$@"
