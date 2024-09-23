FROM amazoncorretto:11-alpine

RUN apk update && apk add maven

COPY . .

RUN mvn compile


ENTRYPOINT [ "./entrypoint.sh" ]
