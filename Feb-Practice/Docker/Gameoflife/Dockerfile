FROM maven:3-jdk-8
RUN git clone https://github.com/wakaleo/game-of-life.git && cd game-of-life && mvn clean package

FROM tomcat:8
COPY --from=0 /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

