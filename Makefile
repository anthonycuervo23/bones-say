.PHONY: build
build: build/hapesay build/hapethink

.PHONY: build/hapesay
build/hapesay:
	CGO_ENABLED=0 cd cmd && go build -o ../bin/hapesay -ldflags "-w -s" ./hapesay

.PHONY: build/hapethink
build/hapethink:
	CGO_ENABLED=0 cd cmd && go build -o ../bin/hapethink -ldflags "-w -s" ./hapethink

.PHONY: lint
lint:
	golint ./...
	cd cmd && golint ./...

.PHONY: vet
vet:
	go vet ./...
	cd cmd && go vet ./...

.PHONY: test
test: test/pkg test/cli

.PHONY: test/pkg
test/pkg:
	go test ./...

.PHONY: test/cli
test/cli:
	cd cmd && go test ./...

.PHONY: man
man:
	asciidoctor --doctype manpage --backend manpage doc/hapesay.1.txt.tpl -o doc/hapesay.1

.PHONY: man/preview
man/preview:
	cat doc/hapesay.1 | groff -man -Tascii | less
