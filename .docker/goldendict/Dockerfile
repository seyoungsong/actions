# docker run -it --rm debian:stable-slim bash
FROM debian:stable-slim

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    ca-certificates cron curl dos2unix unzip \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# rclone
RUN bash -c "$(curl -fsSL https://rclone.org/install.sh)"

# personal config: korean timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# copy
COPY crontab.sh /crontab.sh
COPY cronjob.sh /cronjob.sh
COPY entrypoint.sh /entrypoint.sh

# entrypoint
RUN chmod 0744 /entrypoint.sh && \
    dos2unix /entrypoint.sh

# https://manpages.ubuntu.com/manpages/trusty/man8/cron.8.html
# -f | Stay in foreground mode, don't daemonize.
# -L loglevel | Tell  cron  what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron", "-f", "-L", "2"]
