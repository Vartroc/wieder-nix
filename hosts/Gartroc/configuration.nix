{ config, ... }:
{
  imports = [
    ../../nix/default.nix
    ../../assets/text/scripts/default.nix
    ./hardware-configuration.nix
  ];
  custom = {
    # --- Essentials ---
    misc.enable = true;
    zfs.enable = true;
    sound.enable = true;
    localization.enable = true;
    andi.enable = true;

    # --- Userspace ---
    niri.enable = true;
    autostart = {
      enable = true;
      command = "${config.programs.niri.package}";
    };
    stylix.enable = true;
    plymouth.enable = false;
    gaming = {
      enable = true;
      factorio.enable = false;
    };
    browser.enable = true;
    socialize.enable = true;
    editing.enable = true;
    terminal.enable = true;

    # --- Misc ---
    scripts.enable = true;
    no-shutdown.enable = true;
  };

  # --- Home-manager ---
  home-manager = {
    backupFileExtension = "bak";
    users = {
      "andi" = import ./home.nix;
    };
  };

  # --- Host-specific networking ---
  networking = {
    hostName = "Gartroc";
  };

}
