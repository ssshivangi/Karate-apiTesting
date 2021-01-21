FROM maven:3-jdk-8-alpine

RUN apt-get update \
   && apt-get install -y --no-install-recommends git
   
RUN git clone https://github.com/ssshivangi/Karate-apiTesting.git

RUN cd BDD-Selenium

CMD ["mvn clean test -Dtest=KarateJunit -Dcucumber.options="--tags @toprated" -DargLine='-Dkarate
.env=Test'"]