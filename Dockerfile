FROM container-registry.oracle.com/graalvm/jdk:latest
WORKDIR /app
RUN latest=$(curl -sSL https://maven.neoforged.net/releases/net/neoforged/neoforge/maven-metadata.xml | grep "latest" | sed -n 's/.*<latest>\(.*\)<\/latest>.*/\1/p') && curl -4 -L --http1.1 "https://maven.neoforged.net/releases/net/neoforged/neoforge/$latest/neoforge-$latest-installer.jar" -o installer.jar
RUN echo "eula=true" > eula.txt; java -jar installer.jar; rm run.bat installer.jar installer.jar.log; chmod +x run.sh; export JAVA_OPTS="-Dio.netty.transport=epoll -Dio.netty.tryReflectionSetAccessible=true -Dio.netty.noPreferDirect=true -Djava.net.preferIPv4Stack=true -XX:+UnlockExperimentalVMOptions"
CMD ["/app/run.sh"]
