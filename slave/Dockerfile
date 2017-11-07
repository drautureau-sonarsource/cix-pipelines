FROM openjdk:8-jdk

USER root

RUN apt-get update && apt-get install openssh-server -y

# Install maven package
ENV MAVEN_VERSION 3.3.9
RUN cd /usr/local; wget -q -O - http://mirrors.ibiblio.org/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xvfz - && \
    ln -sv /usr/local/apache-maven-$MAVEN_VERSION /usr/local/maven

# Add SSH key to allow connection with Jenkins
ADD .ssh /root/.ssh

# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY run.sh /usr/local/bin/run.sh

ENTRYPOINT ["/tini", "--", "/usr/local/bin/run.sh"]
