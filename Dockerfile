FROM python:3

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install --no-install-recommends -y cron && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /code

# Set the working directory
WORKDIR /code
ADD . /code/
RUN chmod 0755 /code/*.sh && \
    touch /code/cron.log

COPY cjob /etc/cron.d/cjob
RUN chmod 0744 /etc/cron.d/cjob && \
    crontab /etc/cron.d/cjob

# Run the application
ENTRYPOINT ["/bin/sh", "/code/entrypoint.sh"]