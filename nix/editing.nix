{ config, lib, pkgs, ... }:
{
options.custom.editing.enable = lib.mkEnableOption "software for editing";
config = lib.mkIf config.custom.editing.enable {
  environment.systemPackages = [
    pkgs.gimp
  ];
};
}
