{ config, lib, pkgs, ...}:
{
options.custom.scripts.enable = lib.mkEnableOption "custom scripts";
config = lib.mkIf config.custom.scripts.enable {

  environment.systemPackages = [

    (import ./test.nix { inherit pkgs; })

  ];
};
}
