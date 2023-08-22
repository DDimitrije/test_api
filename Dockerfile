FROM python:3.10
WORKDIR /app
COPY ./requirements.txt requirements.txt
# Install core dependencies.
RUN pip install --upgrade pip
RUN python3 -m pip install --upgrade requests
RUN python3 -c "import requests;
print(requests.get('https://www.howsmyssl.com/a/check',verify=False).json()['tls_version'])"
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_app()"]