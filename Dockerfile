FROM alpine:latest
RUN apk add --update --no-cache openssh
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config

RUN adduser --home /home/matthew --shell /bin/sh --disabled-password matthew
# Generate a random password by MD5 hashing the current date and using the first 12 characters.
# The password isn't intended to be used for logins, but it is required in order to make
# the user active and allow SSH key authentication.
RUN echo -n "matthew:$(date | md5sum | head -c12)" | chpasswd
COPY sshd-docker.pub /home/matthew/.ssh/authorized_keys

EXPOSE 22
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]