FROM python:3.10
WORKDIR /app
COPY ./requirements.txt requirements.txt
# Install core dependencies.
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["/bin/bash", "docker-entrypoint.sh"]