FROM python:3.7-alpine 
WORKDIR /app 
COPY requirements.txt /app
RUN pip3 install -r requirements.txt 
COPY  /app/main.py 
ARG ENVIRONMENT=DEV
ENV FLASK_ENV=${ENVIRONMENT}
ENTRYPOINT ["python3"] 
CMD ["/app/main.py"]