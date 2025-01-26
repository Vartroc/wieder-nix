{
  pkgs,
  config,
  lib,
  ...
}:

{
  options.custom = {
    autostart = {
      enable = lib.mkEnableOption "greetd";
    };
  };

  config = {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${config.programs.niri.package}/bin/niri-session'";
          user = "greeter";
        };

        initial_session = {
          command = "${config.programs.niri.package}/bin/niri-session";
          user = "andi";
        };
      };
    };
  };
}
