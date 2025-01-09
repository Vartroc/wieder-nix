{ lib, config, ... }:
{
options.custom.misc.enable = lib.mkEnableOption "miscallanious stuff like allowUnfree.";
config = lib.mkIf config.custom.misc.enable {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "x86_64-linux";
};
}
