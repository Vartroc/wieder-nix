{ ... }:
{
  imports = [
    ../../nix/default.nix
    ./hardware-configuration.nix
  ];
  custom = {
#    autologinUser.enable = true;
    greetd = {
      enable = true;
      command = "wait 1 | niri-session";
    };
    browser.enable = true;
    misc.enable = true;
    zfs.enable = true;
    gaming.enable = true;
    sound.enable = true;
    andi.enable = true;
    niri.enable = true;
    no-shutdown.enable = true;
    socialize.enable = true;
    ghostty.enable = true;
    localization.enable = true;
  };

  home-manager = {
    backupFileExtension = "bak"; 
    users = {
      "andi" = import ./home.nix;
    };
  };

  system.stateVersion = "24.05";
}
