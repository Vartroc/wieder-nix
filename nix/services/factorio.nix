{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.custom.services.factorio.enable;
in
{
  options.custom.services.factorio.enable = lib.mkEnableOption "factorio server";
  config = lib.mkIf cfg {
    services.factorio = {
      enable = true;
      # --omitted--
      /*
        mods =
            let
              inherit (pkgs) lib;
              modDir = ../assets/games/factorio;
              modList = lib.pipe modDir [
                builtins.readDir
                (lib.filterAttrs (k: v: v == "regular"))
                (lib.mapAttrsToList (k: v: k))
                (builtins.filter (lib.hasSuffix ".zip"))
              ];
              modToDrv =
                modFileName:
                pkgs.runCommand "copy-factorio-mods" { } ''
                  mkdir $out
                  cp ${modDir + "/${modFileName}"} $out/${modFileName}
                ''
                // {
                  deps = [ ];
                };
            in
            builtins.map modToDrv modList;
        };
      */
    };

  };
}
