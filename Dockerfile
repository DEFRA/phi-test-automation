FROM amazoncorretto:17-alpine

RUN apk update && apk add maven

COPY . .

RUN mvn clean compile test-compile
RUN mvn -Dmaven.test.skip=true install

ENTRYPOINT [ "./entrypoint.sh" ]
