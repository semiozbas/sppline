FROM python:3.6

ARG Jenkins_user=jenkins

RUN useradd -ms /bin/bash $Jenkins_user

USER $Jenkins_user

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
