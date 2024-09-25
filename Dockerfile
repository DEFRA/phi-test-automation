FROM amazoncorretto:17-alpine

RUN apk update && apk add maven

COPY . .

RUN mvn clean compile test-compile

ENTRYPOINT [ "./entrypoint.sh" ]
