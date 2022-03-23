FROM alpine:latest
USER root

WORKDIR /root/helloworld
COPY helloworld.java /root/helloworld

#Recommended
RUN apk update

#Install JDK
RUN apk fetch openjdk8
RUN apk add openjdk8
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

#Check version
RUN java -version
RUN javac -version

#Compiled Helloworld
RUN javac helloworld.java
ENTRYPOINT ["java", "helloworld"]

