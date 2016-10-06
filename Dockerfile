FROM ubuntu:latest
#MAINTAINER docker@ekito.fr

#install cron
RUN apt-get update && apt-get install cron

RUN mkdir -p /data/backup


ADD bkp_script.sh /data/bkp_script.sh
ADD hello.cron /data/hello.cron

RUN chmod +x /data/bkp_script.sh
RUN chmod +x /data/hello.cron

# Add crontab file in the cron directory
 RUN cron /data/hello.cron

# Create the log file to be able to run tail
#RUN touch /var/log/cron.log
#RUN chmod 777 /var/log/cron.log

RUN service cron start

# Run the command on container startup
CMD (cron -f)
