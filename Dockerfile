FROM alpine:latest
ARG USERNAME=matthew
RUN apk add --update --no-cache openssh
RUN echo -e "\
Port 8080 \n\
PasswordAuthentication no \n\
PermitRootLogin no \n\
Match User $USERNAME \n\
  AllowTcpForwarding yes \n\
" >> /etc/ssh/sshd_config

RUN adduser --home /home/$USERNAME --shell /bin/sh --disabled-password $USERNAME
# Generate a random password by MD5 hashing the current date and using the first 12 characters.
# The password isn't intended to be used for logins, but it is required in order to make
# the user active and allow SSH key authentication.
RUN echo -n "$USERNAME:$(date | md5sum | head -c12)" | chpasswd
COPY sshd-docker.pub /home/$USERNAME/.ssh/authorized_keys

EXPOSE 8080
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]