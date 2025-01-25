{ lib, config, ... }:
{
  options.custom.git.enable = lib.mkEnableOption "custom git config";
  config = lib.mkIf config.custom.git.enable {
    programs.git = {
      enable = true;
      userName = "Andreas";
      userEmail = "andi@thurau.net";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
