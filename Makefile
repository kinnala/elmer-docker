HASH:=$(shell git --git-dir $(elmerdir)/.git rev-parse --short HEAD)

default:
	@echo "Instructions:"
	@echo "1. Run 'make docker' to build the Ubuntu image for compiling Elmer."
	@echo "2. Run 'make compile elmerdir=/path/to/source' to compile Elmer and create a new image with the build artifacts."

compile:
ifndef elmerdir
	$(error Please set "elmerdir", e.g.: "make compile elmerdir=/path/to/source")
endif
	docker run -v $(elmerdir):/elmer --name elmerbuild-$(HASH) -it elmerbuilder build
	docker commit elmerbuild-$(HASH) elmer-$(HASH)
	docker rm elmerbuild-$(HASH)

docker:
	docker build --no-cache -t elmerbuilder .
