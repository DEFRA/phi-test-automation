FROM amazoncorretto:17-alpine

RUN apk update && apk add maven

WORKDIR app

COPY . .

RUN mvn clean dependency:go-offline compile test-compile
RUN mvn -Dmaven.test.skip=true install -o

ENTRYPOINT [ "./entrypoint.sh" ]
