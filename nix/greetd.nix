{ config, lib, pkgs, ... }:

{
  options.custom = {
    greetd = {
      enable = lib.mkEnableOption "greetd";
      command = lib.mkOption {
        type = lib.types.str;
        default = "Hyprland";
      };
    };
    autologinUser = {
      enable = lib.mkEnableOption "getty";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.custom.greetd.enable {
      services.greetd = {
        enable = true;
        settings = rec {
          initial_session = {
            command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${config.custom.greetd.command}";
            user = "andi";
          };
          default_session = initial_session;
        };
      };
    })

    (lib.mkIf config.custom.autologinUser.enable {
      services.getty.autologinUser = "andi";
    })
  ];
}
