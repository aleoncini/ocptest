FROM registry.access.redhat.com/rhel7:latest

EXPOSE 8080

RUN curl https://raw.githubusercontent.com/aleoncini/ocptest/master/deploy/index.html && \
    cp index.html /var/run/web/index.html

CMD cd /var/run/web && python -m SimpleHTTPServer 8080
