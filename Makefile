KAFKA_VERSION := 2.5.0
FLUME_VERSION := 1.9.0

start:
	@echo "==========================================================="
	@echo "preparing environment..."
	@echo "Flume version: ${FLUME_VERSION}"
	@echo "Kafka version: ${KAFKA_VERSION}"
	@echo "==========================================================="

get_flume:
	@echo "downloading flume files"
	@. ./scripts/download-flume.sh ${FLUME_VERSION}

get_kafka:
	@echo "downloading kafka files"
	@. ./scripts/download-kafka.sh ${KAFKA_VERSION}

build_flume_image:
	@echo "building flume image"
	@. ./scripts/build-flume-image.sh ${FLUME_VERSION}

build_kafka_image:
	@echo "building kafka image"
	@. ./scripts/build-kafka-image.sh ${KAFKA_VERSION}

install: start get_flume get_kafka build_flume_image build_kafka_image
