FROM continuumio/anaconda3
EXPOSE 5001

WORKDIR /

COPY . .
RUN pip install -r requirements.txt

CMD ["gunicorn","-w","1","--threads","4", "-b","0.0.0.0:5001","--chdir","/app/code","app:app","--timeout","420"]