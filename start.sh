#! /bin/sh
docker container rm ntp || /bin/true
# MAYBE: --network host
docker run -td \
	--restart always \
	-e DEBBASE_SYSLOG=stdout \
	-e DEBBASE_TIMEZONE=`cat /etc/timezone` \
	--stop-signal=SIGRTMIN+3 \
	--tmpfs /run:size=100M \
	--tmpfs /run/lock:size=100M \
	-v ${PWD}/ntp.conf:/etc/ntp.conf:ro \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-p 123:123/udp \
	--cap-drop ALL \
	--cap-add NET_BIND_SERVICE \
	--cap-add SYS_RESOURCE \
	--cap-add SYS_TIME \
	--network lan-services \
	--name=ntp \
	ntp
