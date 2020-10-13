FROM debian-security-apt-cacher-ng:latest
VOLUME ["/var/lib/ntp"]
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/040-ntp
EXPOSE 123/udp
CMD ["/usr/local/bin/boot-debian-base"]
