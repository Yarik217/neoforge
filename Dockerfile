FROM container-registry.oracle.com/graalvm/jdk:latest
WORKDIR /app
RUN latest=$(curl -4 -fsSL --max-time 10 --retry 3 --http1.1 "https://maven.neoforged.net/releases/net/neoforged/neoforge/maven-metadata.xml" 2>/dev/null | grep "latest" | sed -n 's/.*<latest>\(.*\)<\/latest>.*/\1/p') && curl -4 -fsSL --max-time 20 --retry 3 --http1.1 "https://maven.neoforged.net/releases/net/neoforged/neoforge/$latest/neoforge-$latest-installer.jar" -o installer.jar
RUN echo "eula=true" > eula.txt; java -jar installer.jar; rm run.bat installer.jar installer.jar.log || true; chmod +x run.sh
ENV JAVA_OPTS="-Dio.netty.transport=epoll -Dio.netty.tryReflectionSetAccessible=true -Dio.netty.noPreferDirect=true -Djava.net.preferIPv4Stack=true -XX:+UnlockExperimentalVMOptions"
CMD ["/app/run.sh"]
