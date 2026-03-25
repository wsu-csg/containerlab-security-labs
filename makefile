.PHONY: buildImages removeImages pruneImages

buildImages:
	@for dir in LabImages/*/; do \
		image=$$(basename $$dir); \
		echo "Building $$image..."; \
		docker build -t csgclab-$$image:latest $$dir; \
	done

removeImages:
	@for dir in LabImages/*/; do \
		image=$$(basename $$dir); \
		echo "Removing csgclab-$$image..."; \
		docker rmi csgclab-$$image:latest || true; \
	done

pruneImages:
	docker image prune -f
	docker builder prune -f
