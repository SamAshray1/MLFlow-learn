FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD bash -c "\
    mlflow server \
        --host 0.0.0.0 \
        --port 5000 \
    & \
    echo 'Waiting for MLflow server...' && \
    sleep 5 && \
    python train.py && \
    wait"