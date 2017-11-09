FROM openjdk:8-jdk

USER root

# Enable SSH to allow connection with Jenkins
RUN apt-get update && apt-get install openssh-server -y
ADD .ssh /root/.ssh

# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Start the SSH server and wait until the container is stopped
COPY run.sh /usr/local/bin/run.sh

ENTRYPOINT ["/tini", "--", "/usr/local/bin/run.sh"]
