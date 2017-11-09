FROM jenkins/jenkins:lts

USER jenkins

# Install plugins
RUN /usr/local/bin/install-plugins.sh mock-slave workflow-aggregator blueocean hipchat ssh-slaves

# Add configuration 
ADD JENKINS_HOME /usr/share/jenkins/ref
