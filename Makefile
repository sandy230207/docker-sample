build-1:
	docker build \
		-f go.Dockerfile \
		-t go-web:sample .

run-1:
	docker run -d \
		--name web-1 \
		-p 8001:8000 \
		go-web:sample

build-2:
	docker build \
		-f alpine.Dockerfile \
		-t alpine-web:sample .

run-2:
	docker run -d \
		--name web-2 \
		-p 8002:8000 \
		alpine-web:sample

clean:
	docker system prune -a

stop:
	docker stop $(shell docker ps -aqf "name=web") && \
		docker rm $(shell docker ps -aqf "name=web")