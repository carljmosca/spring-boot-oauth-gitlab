FROM amazoncorretto:17.0.4-al2 AS build-env

ENV MAVEN_VERSION=3.8.6

RUN yum install -y tar gzip
RUN curl -o apache-maven-$MAVEN_VERSION-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN tar xzvf apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN mv apache-maven-$MAVEN_VERSION /usr/local
RUN mkdir /home/dev
COPY . /home/dev
WORKDIR /home/dev
#RUN echo "RELEASE_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)" >> $GITHUB_ENV
RUN /usr/local/apache-maven-$MAVEN_VERSION/bin/mvn package

FROM gcr.io/distroless/java17-debian11
#LABEL org.label-schema.version=$BUILD_VERSION
COPY --from=build-env /home/dev/target/*.jar /app/main.jar
WORKDIR /app
CMD ["main.jar"]

