FROM debian:8

# less priviledge user, the id should map the user the downloaded files belongs to
RUN groupadd -r dummy && useradd -r -g dummy dummy -u 1000



RUN apt-get update \
	&& apt-get install -y aria2 busybox curl \
	&& rm -rf /var/lib/apt/lists/*

#RUN /usr/bin/aria2c --enable-rpc --rpc-listen-all --dir=/data

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080 6800

CMD ["/usr/bin/aria2c", "--enable-rpc", "--rpc-listen-all", "--dir=/data"]
