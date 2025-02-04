{ config, lib, ... }:
{
options.custom.fish.enable = lib.mkEnableOption "fish";
config = lib.mkIf config.custom.fish.enable {


programs.fish = {
      enable = true;
      shellInit = "fastfetch";
      shellAliases = {
	n = "nvim";
	rb = "nh os switch";

      };
    };
  };
}
