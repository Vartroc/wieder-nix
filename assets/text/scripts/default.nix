{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.misc.scripts;
in
{
  options.custom.misc.scripts.enable = lib.mkEnableOption "custom scripts";
  config = lib.mkIf cfg.enable {
     environment.systemPackages = [

      (import ./test.nix { inherit pkgs; })
      (import ./test1.nix { inherit pkgs; })

    ];

  };
}
