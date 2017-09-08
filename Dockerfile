FROM java:8
MAINTAINER jphilippeplante <https://github.com/jphilippeplante>

EXPOSE 7979 8989
COPY /docker/hystrix-turbine-* /app/
COPY /docker/wait-for-it.sh /app/scripts/wait-for-it.sh
WORKDIR /app/
RUN chmod 777 /app/scripts/wait-for-it.sh

WORKDIR /
CMD /app/scripts/wait-for-it.sh configserver:8888 --timeout=60 --strict -- java -Dspring.profiles.active=docker -Djava.security.egd=file:/dev/./urandom -jar /app/hystrix-turbine-*.jar --server.port=7979 --turbine.stream.port=8989 --spring.config.name=application
