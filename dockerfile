from python:latest-slim

workdir /app

copy requirements.txt .


run pip install --no-cache-dir -r requirements.txt

copy . .

run useradd -m -u 65532 appuser && chown -R appuser:appuser /app

user appuser

expose 8000

cmd ["python", "app.py"]