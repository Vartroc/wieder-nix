{ lib, config, ... }:
{
options.custom.git.enable = lib.mkEnableOption "the git versioning system";
config = lib.mkIf config.custom.git.enable {
  programs.git.enable = true;
};
}
