{ config, pkgs, lib, inputs, ... }:
{
options.custom.ghostty.enable = lib.mkEnableOption "the ghostty terminal emulator";

config = lib.mkIf config.custom.ghostty.enable {
  environment.systemPackages = [
    inputs.ghostty.packages.x86_64-linux.default 
    pkgs.wev
    pkgs.ripgrep
    pkgs.tree
    pkgs.bat
    pkgs.fzf
  ];
};
}
