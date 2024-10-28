FROM datamechanics/spark:3.2.1-hadoop-3.3.1-java-11-scala-2.12-python-3.8-dm18

USER root

ENV SPARK_JAVA_OPTS="-Xmx8g"
ENV SPARK_WORKER_CORES=4

WORKDIR /opt/spark

RUN pip install --upgrade pip

COPY  requirements.txt .
RUN pip3 install -r requirements.txt

CMD jupyter-lab --allow-root --no-browser --ip=0.0.0.0

EXPOSE 8888 4040


# spark.executor.memory 8g
# spark.driver.memory 2g
# spark.executor.cores 4
