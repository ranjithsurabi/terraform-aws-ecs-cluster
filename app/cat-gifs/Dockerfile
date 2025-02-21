FROM alpine:latest
RUN apk add --update py2-pip
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
COPY static/styles/main.css /usr/src/app/static/styles/
COPY static/images/* /usr/src/app/static/images/
EXPOSE 5000
CMD ["python", "/usr/src/app/app.py"]
