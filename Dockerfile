FROM alpine
ENV NEXTDNS_ARGUMENTS="-listen :5353 -report-client-info -log-queries -cache-size 10MB -max-ttl 5s -profile abcdef"
RUN mkdir /tmp/nextdns && \
    cd /tmp/nextdns && \
    wget https://github.com/nextdns/nextdns/releases/download/v1.43.5/nextdns_1.43.5_linux_amd64.tar.gz && \
	tar -zxvf nextdns_1.43.5_linux_amd64.tar.gz && \
    mv /tmp/nextdns/nextdns /usr/bin/nextdns  && \
    rm -rf /tmp/nextdns
EXPOSE 5353/udp
EXPOSE 5353/tcp
CMD /usr/bin/nextdns run ${NEXTDNS_ARGUMENTS}
