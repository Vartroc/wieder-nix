{ config, ... }:
{
  imports = [
    ../../nix/default.nix
    ../../assets/text/scripts/default.nix
    ./hardware-configuration.nix
  ];
  custom = {
    # --- Essentials ---
    essentials = {
      misc.enable = true;
      zfs.enable = true;
      sound.enable = true;
      localization.enable = true;
      andi.enable = true;
    };

    # --- Userspace ---
    userspace = {
      niri.enable = true;
      autostart = {
	enable = true;
	command = "${config.programs.niri.package}";
      };
      stylix.enable = true;
      plymouth.enable = false;
      gaming = {
	enable = true;
      };
      projects.enable = true;
      browser.enable = true;
      anki.enable = true;
      socialize.enable = true;
      editing.enable = true;
      terminal.enable = true;
    };

    # --- Misc ---
    misc = {
      scripts.enable = true;
      no-shutdown.enable = true;
    };

    # --- Services ---
    services = {
      factorio.enable = false;
    };

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
