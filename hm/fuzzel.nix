{ config, lib, ... }:
{
options.custom.fuzzel.enable = lib.mkEnableOption "the fuzzel application launcher";
config = lib.mkIf config.custom.fuzzel.enable {
  programs.fuzzel = {
    enable = true;
  };
};
}
