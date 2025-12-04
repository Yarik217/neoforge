FROM container-registry.oracle.com/graalvm/jdk:latest
WORKDIR /app
RUN latest=$(curl -sSL https://maven.neoforged.net/releases/net/neoforged/neoforge/maven-metadata.xml | grep latest | sed -n 's/.*<latest>\(.*\)<\/latest>.*/\1/p') && curl -sSL https://maven.neoforged.net/releases/net/neoforged/neoforge/$latest/neoforge-$latest-installer.jar -o installer.jar
RUN echo "eula=true" > eula.txt; java -jar installer.jar; rm run.bat installer.jar; chmod +x run.sh
CMD ["/app/run.sh"]
