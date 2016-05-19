$cont=aria2c

all:
	clone build up
up:
	docker-compose up -d
clone:
	git clone https://github.com/ziahamza/webui-aria2.git webui
build:
	docker-compose build


