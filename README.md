# nix
An ix.io CLI written in Nim. Because I don't want to memorize `echo Hello world. | curl -F 'f:1=<-' ix.io`.

*If you're using NixOS, too bad.*

## Usage
`nix [files]`

Keep in mind that ix.io, while convenient, is quite slow. It may take a moment
for the command to finish executing, especially when using more than one file.