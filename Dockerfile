FROM python:3.9-buster
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./movies_app ./
COPY ./movies_app/movies_app/.env.example ./movies_app/movies_app/.env
RUN python manage.py collectstatic --noinput
EXPOSE 8000/tcp
CMD ["gunicorn" , "movies_app.wsgi:application", "--bind", " 0.0.0.0:8000"]