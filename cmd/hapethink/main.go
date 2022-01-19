package main

import (
	"os"

	"github.com/Rid/hapesay/cmd/v2/internal/cli"
)

var version string

func main() {
	os.Exit((&cli.CLI{
		Version:  version,
		Thinking: true,
	}).Run(os.Args[1:]))
}
