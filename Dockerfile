FROM openjdk:15.0.2-jdk
ARG JAR_DIR=demo-gradle
COPY ${JAR_DIR} /${JAR_DIR}/
RUN cd /${JAR_DIR} && ls && ./gradlew assemble
ARG JAR_FILE=/${JAR_DIR}/build/libs/*.jar
RUN cp ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
