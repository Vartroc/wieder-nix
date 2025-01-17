{ pkgs }:
pkgs.writeShellScriptBin "test0" ''
  echo "hello world" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
