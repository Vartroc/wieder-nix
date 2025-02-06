{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.userspace.direnv;
in
{
  options.custom.userspace.direnv.enable = lib.mkEnableOption "direnv";
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };
  };
}
