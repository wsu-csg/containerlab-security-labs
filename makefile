.PHONY: deploy destroy build

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

deploy: build
	clab deploy -t clab.yml

destroy:
	clab destroy -t clab.yml