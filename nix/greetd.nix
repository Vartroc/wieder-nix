{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

{
  options.custom = {
    autostart = {
      enable = lib.mkEnableOption "greetd";
      command = lib.mkOption {
        type = lib.types.str;
        default = "Hyprland";
      };
    };
    autologin = {
      enable = lib.mkEnableOption "getty";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.custom.autostart.enable {
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${inputs.niri.packages.x86_64-linux.niri-stable}/bin/niri-session'";
            user = "greeter";
          };

          initial_session = {
            command = "${pkgs.niri-stable}/bin/niri-session";
            user = "andi";
          };
        };
      };
    })

    (lib.mkIf config.custom.autologin.enable {
      #services.getty.autologinUser = "andi";
    })
  ];
}
