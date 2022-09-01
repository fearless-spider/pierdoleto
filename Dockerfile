FROM ghcr.io/leafo/lapis-archlinux-itchio:latest

RUN ln -s /usr/share/lua /usr/local/share/lua && \
ln -s /usr/lib/lua /usr/local/lib/lua
# install lua dependencies
RUN su postgres -c '/usr/bin/pg_ctl -s -D /var/lib/postgres/data start -w -t 120' \
&& luarocks --lua-version=5.1 build
WORKDIR /code
COPY . .
