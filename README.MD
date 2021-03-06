# Description
Create a running multi-container Docker applications with
* Jenkins available at <http://localhost:8080/> with 
  * Maven tool configured (Install automatically from Apache)
  * Java tool configured (using openjdk as a base image)
* 2 slaves connected to Jenkins preconfigured using openjdk as a base image
* BURGR available at <http://localhost:8090/>

You need to have [Docker Compose](https://docs.docker.com/compose/) installed

# Run the build environment
* Run with ```docker-compose up```
* Signup: http://localhost:8080/signup (and optionnly fix the security as signup is allowed and any logged-in users can do anything: http://localhost:8080/configureSecurity/)

# Create the sample project
The project build a Java project with Maven and executed the tests with 2 build tools: Gradle (using the Gradle Wrapper) and Maven (provisionned by Jenkins)
* Create a new pipeline (http://localhost:8080/blue/create-pipeline):
* Choose ```GitHub```
* Connect to Github using an acess token
* Choose the clone repo of this project

And you are done!
