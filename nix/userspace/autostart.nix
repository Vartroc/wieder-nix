{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.custom.userspace.autostart;
in
{
  options.custom.userspace = {
    autostart = {
      enable = lib.mkEnableOption "greetd";

      command = lib.mkOption {
        type = lib.types.str;
        default = "${config.programs.niri.package}";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${cfg.command}/bin/niri-session'";
          user = "greeter";
        };

        initial_session = {
          command = "${cfg.command}/bin/niri-session";
          user = "andi";
        };
      };
    };
    hardware.amdgpu.initrd.enable = true;
  };
}
