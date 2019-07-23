FROM python:3.6-slim
ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY manage.py .
COPY mysite ./mysite
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8082"]
