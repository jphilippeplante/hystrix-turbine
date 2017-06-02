FROM maven:alpine
MAINTAINER Jean-Philippe Plante <jean-philippe.plante@desjardins.com>

EXPOSE 7979 8989
COPY . /app/
WORKDIR /app/
RUN mvn package -DskipTests
VOLUME /config
WORKDIR /
CMD java -Dspring.profiles.active=docker -Djava.security.egd=file:/dev/./urandom -jar /app/target/hystrix-turbine-*.jar --server.port=7979 --turbine.stream.port=8989 --spring.config.name=application
