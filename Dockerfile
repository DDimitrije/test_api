FROM python:3.10
WORKDIR /app
COPY ./requirements.txt requirements.txt
# Install core dependencies.
RUN apt-get update && apt-get install -y libpq-dev build-essential
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_app()"]