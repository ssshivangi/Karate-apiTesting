
# API testing using karate
[Karate](https://github.com/intuit/karate) is an open-source API test automation tool. API tests are written using Behaviour Driven Development (BDD) Gherkin syntax

[Karate-Gatling](https://github.com/intuit/karate/tree/master/karate-gatling) is an open-source API performance testing tool

## Project Setup
- Install [Java 8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

- Install [Maven](https://maven.apache.org/install.html)


## Execute Scripts

#### command to run API testing

```
mvn clean test -Dtest=KarateJunit
```

#### command to run specific feature file for API testing

For example, to run validateUsers feature file with tag "users"

```
mvn clean test -Dtest=KarateJunit -Dcucumber.options="--tags @toprated" -DargLine='-Dkarate.env=Test'
```

### performance testing command

```
mvn clean test-compile gatling:test -Dgatling.simulationClass=performance.LoadTestingSimulation -Dkarate.env=ET
```

### performance testing report

folder target -> gatling -> index.html

![TestReport](.\screenshot\Test_Report.jpg)


### Running inside maven docker image

```
docker run -it --rm --name apitesting -v "$(pwd)":/tmp/api -w /tmp/api maven:3.3-jdk-8 mvn clean test -Dtest=KarateJunit
```

#### Performance testing inside docker
```
docker run -it --rm --name apitesting -v "$(pwd)":/tmp/api -w /tmp/api maven:3.3-jdk-8 mvn clean test-compile gatling:test -Dgatling.simulationClass=performance.LoadTestingSimulation -Dkarate.env=ET
```
