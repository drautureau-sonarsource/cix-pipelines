FROM openjdk:8-jre

# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Install BURGR
COPY burgr.jar /usr/local/lib/burgr.jar 

COPY burgr.sh /usr/local/bin/burgr.sh

ENTRYPOINT ["/tini", "--", "/usr/local/bin/burgr.sh"]
