FROM maven:3-jdk-8-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN mvn clean install

CMD ["mvn","clean","test","-Dtest=KarateJunit"]