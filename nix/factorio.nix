{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.custom.gaming.factorio.enable = lib.mkEnableOption "factorio server";
  config = lib.mkIf config.custom.gaming.factorio.enable {
    services.factorio = {
      enable = true;
      # --omitted--
      /*mods =
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
    };*/
  };

};
}
