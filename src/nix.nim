import os, strformat, sequtils, strutils, osproc

if paramCount() == 0:
  echo """Usage:
    nix [files]"""

let files = commandLineParams()

var notExists = files.filterIt(not fileExists(it))

if notExists.len > 0:
  quit "File" & (if notExists.len > 1: "s " else: " ") & notExists.join(", ") &
    (if notExists.len > 1: " don't" else: " doesn't") & " exist.", -1

for f in files:
  let cmd = execCmdEx(&"cat {f} | curl -F 'f:1=<-' ix.io")
  if cmd.exitCode != 0:
    quit "Something went wrong.", cmd.exitCode
  var (dir, name, ext) = splitFile(f)
  var (_, tail) = splitPath(dir)
  echo &"{tail / name}{ext}: {cmd.output.splitLines()[^2]}"