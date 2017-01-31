BUILDIMAGE=build-image:latest
IMAGE=gizmotronic/nullidentd
VER=latest

image: nullidentd Dockerfile
	docker build -t ${IMAGE}:${VER} .

nullidentd: Dockerfile.build
	docker build -t ${BUILDIMAGE} -f $< .
	docker create --name nullidentd-build ${BUILDIMAGE} /bin/true
	docker cp nullidentd-build:/build/nullidentd .
	docker rm -v nullidentd-build
	docker rmi ${BUILDIMAGE}

clean:
	rm -rf nullidentd
	- docker rmi ${IMAGE}:${VER}
	- docker rmi ${BUILDIMAGE}
