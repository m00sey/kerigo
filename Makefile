.PHONY: all
all: test

.PHONY: test
test:
	@scripts/check_unit.sh

.PHONY: demo-bob
demo-bob:
	@go build -o ./bin/bob cmd/demo/bob/bob.go
	@./bin/bob

.PHONY: demo-eve
demo-eve:
	@go build -o ./bin/eve cmd/demo/eve/eve.go
	@./bin/eve

.PHONY: demo-sam
demo-sam:
	@go build -o ./bin/sam cmd/demo/sam/sam.go
	@./bin/sam

.PHONY: interop-bob
interop-bob:
	@docker run --rm -i -p 5620-5621 --name kerigo-bob ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './bob'

.PHONY: interop-eve
interop-eve:
	@docker run --rm -i -p 5620-5621 --name kerigo-eve ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './eve'

.PHONY: interop-sam
interop-sam:
	@docker run --rm -i -p 5620-5621 --name kerigo-sam ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './sam'

