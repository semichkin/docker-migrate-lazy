FROM migrate/migrate:latest

COPY entrypoint.sh /entrypoint.sh
WORKDIR "/migrations"
ENTRYPOINT ["/entrypoint.sh"]