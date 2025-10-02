FROM python:3.7-alpine 
WORKDIR /app 
COPY requirements.txt main.py /app/
RUN pip3 install -r requirements.txt 
ARG ENVIRONMENT=DEV
ENV FLASK_ENV=${ENVIRONMENT}
ENTRYPOINT ["python3"] 
CMD ["/app/main.py"]