FROM python:3.6

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/ && \
    rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME

RUN wget https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.13.3/allure-commandline-2.13.3.zip && \
    unzip allure-commandline-2.13.3.zip -d /allure && \
    rm allure-commandline-2.13.3.zip

ENV PATH="/allure/allure-2.13.3/bin:${PATH}"

ENV ALLURE="${PWD}/allure/allure-2.13.3/bin/allure"
