FROM python:3.10
WORKDIR /app
COPY ./requirements.txt requirements.txt
# Install core dependencies.
RUN pip install --upgrade pip
RUN python3 -m pip install --upgrade requests
RUN pip install --no-binary :all: psycopg2
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_app()"]