FROM maven:alpine
MAINTAINER Jean-Philippe Plante <jean-philippe.plante@desjardins.com>

EXPOSE 7979 8989
COPY . /app/
WORKDIR /app/
RUN mvn package
VOLUME /config
WORKDIR /
CMD java -Djava.security.egd=file:/dev/./urandom -jar /app/target/hystrix-turbine-*.jar --spring.config.name=application

