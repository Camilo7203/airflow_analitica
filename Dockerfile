FROM apache/airflow:2.7-python3.10

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends awscli \
 && rm -rf /var/lib/apt/lists/*

USER airflow
COPY --chown=airflow:airflow requirements.txt /opt/airflow/requirements.txt
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt

COPY --chown=airflow:airflow dags/ /opt/airflow/dags/
COPY --chown=airflow:airflow scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]
