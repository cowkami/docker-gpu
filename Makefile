IMAGE_NAME=python-gpu

docker.build:
	docker build -t $(IMAGE_NAME) .

docker.run:
	docker run --rm --gpus all --device /dev/nvidia0 --device /dev/nvidia-uvm --device /dev/nvidia-uvm-tools --device /dev/nvidiactl $(IMAGE_NAME) python3

