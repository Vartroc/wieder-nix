{ pkgs }:
pkgs.writeShellApplication {
  name = "test1";
  runtimeInputs = [ pkgs.cowsay pkgs.lolcat ];
  text = 
  ''
  echo "hello world" | cowsay | lolcat
'';
}
