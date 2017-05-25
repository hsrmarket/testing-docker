FROM bitnami/postgresql:9.6.2-r2

ENV POSTGRESQL_USER=postgres
ENV POSTGRESQL_PASSWORD=1234
ENV POSTGRESQL_DATABASE=hsrmarket


ADD ./dump.sql /root/dump.sql
ADD ./app-entrypoint.sh /app-entrypoint.sh

EXPOSE 5432
