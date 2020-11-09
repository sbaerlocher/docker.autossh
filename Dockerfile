FROM alpine:3.12.1

LABEL "maintainer"="Simon Baerlocher <s.baerlocher@sbaerlocher.ch>" \
	"org.opencontainers.image.authors"="Simon Baerlocher <s.baerlocher@sbaerlocher.ch>" \
	"org.opencontainers.image.vendor"="sbaerlocher" \
	"org.opencontainers.image.licenses"="MIT" \
	"org.opencontainers.image.url"="https://github.com/sbaerlocher/docker.autossh" \
	"org.opencontainers.image.documentation"="https://github.com/sbaerlocher/docker.autossh" \
	"org.opencontainers.image.source"="https://github.com/sbaerlocher/docker.autossh" 

ENV \
	USER=ssh \
	GROUP=ssh \
	UID=1000 \
	GID=1000

RUN apk add --no-cache \
	autossh

RUN set -eux \
	&& addgroup -g ${GID} ${GROUP} \
	&& adduser -h /home/${USER} -s /bin/bash -G ${GROUP} -D -u ${UID} ${USER} \
	\
	&& mkdir /home/${USER}/.ssh \
	&& chown ssh:ssh /home/${USER}/.ssh \
	&& chmod 0700 /home/${USER}/.ssh 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

USER ssh
CMD ["/usr/local/bin/entrypoint.sh"]
