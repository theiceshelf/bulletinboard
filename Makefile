run: 
	go run main.go api.go -path ~/Desktop/ex
pack:
	bin/pkger

go-build: 
	make pack
	go build -o build/bulletinboard

release:
	make pack
	env GOOS=windows GOARCH=amd64 go build -o build/bulletinboard-windows
	env GOOS=darwin GOARCH=amd64 go build -o build/bulletinboard-mac
	env GOOS=linux GOARCH=amd64 go build -o build/bulletinboard-linux

## create a binary for *nix env. Used for local testing only.
release-local:
	make go-build
	cp build/bulletinboard /usr/local/bin/;

