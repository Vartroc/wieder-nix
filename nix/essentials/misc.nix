{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.networkmanager = {
    enable = true;
  };
}
