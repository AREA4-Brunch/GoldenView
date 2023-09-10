FROM python:3.10


RUN mkdir -p /usr/app
WORKDIR /usr/app

COPY ./requirements.txt ./requirements.txt
# RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt

COPY ./trading_platform/deployment ./trading_platform/deployment
COPY ./trading_platform/apps ./trading_platform/apps
COPY ./trading_platform/static_root ./trading_platform/static_root
COPY ./trading_platform/trading_platform ./trading_platform/trading_platform
COPY ./trading_platform/manage.py ./trading_platform/manage.py

# create file for logs inside logs/ which should be a mounted folder
RUN mkdir -p ./trading_platform/logs/exec_logs
RUN echo '' > ./trading_platform/logs/exec_logs/logs.log

# ENV DB_TRADING_HISTORY_NAME=trading_history
# ENV DB_TRADING_HISTORY_HOST=DB_TRADING_HISTORY_HOST
# ENV DB_TRADING_HISTORY_PORT=DB_TRADING_HISTORY_PORT
# ENV DB_TRADING_HISTORY_USERNAME=DB_TRADING_HISTORY_USERNAME
# ENV DB_TRADING_HISTORY_PASSWORD=DB_TRADING_HISTORY_PASSWORD

# ENV DB_TRADING_PLATFORM_NAME=trading_platform
# ENV DB_TRADING_PLATFORM_USER=root
# ENV DB_TRADING_PLATFORM_PASSWORD=
# ENV DB_TRADING_PLATFORM_HOST=127.0.0.1
# ENV DB_TRADING_PLATFORM_PORT=3306

WORKDIR /usr/app/trading_platform

ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
