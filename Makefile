.PHONY: all
all: test

.PHONY: test
test:
	@scripts/check_unit.sh

.PHONY: interop-bob
interop-bob:
	@docker run --rm -i -p 5620-5621 --name kerigo-bob ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './bob -e 10'

.PHONY: interop-eve
interop-eve:
	@docker run --rm -i -p 5620-5621 --name kerigo-eve ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './eve -e 10'

.PHONY: interop-sam
interop-sam:
	@docker run --rm -i -p 5620-5621 --name kerigo-sam ghcr.io/decentralized-identity/kerigo/kerigo-interop bash -c './sam -e 10'

ACTORS = bob eve sam
.PHONY: demos
demos:
	@$(foreach var,$(ACTORS),go build -o ./bin/$(var) cmd/demo/$(var)/$(var).go;)

.PHONY: bob
bob: demos
	@./bin/bob -e 5

eve: demos
	@./bin/eve -e 5

sam: demos
	@./bin/sam -e 5
