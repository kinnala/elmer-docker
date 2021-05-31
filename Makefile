default:
	@echo "Instructions:"
	@echo "1. Run 'make docker' to build the Ubuntu image for compiling Elmer."
	@echo "2. Run 'make run elmerdir=/path/to/source' to start the container."
	@echo "3. Run 'build' inside the container to compile Elmer."

run:
	docker run -v $(elmerdir):/elmer -it elmer

docker:
	docker build --no-cache -t elmer .
