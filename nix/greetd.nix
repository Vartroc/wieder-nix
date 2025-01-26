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
      
      command = lib.mkOption {
			type = lib.types.str;
			default = "${config.programs.niri.package}";
		};
    };
  };

  config = {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${config.custom.autostart.command}/bin/niri-session'";
          user = "greeter";
        };

        initial_session = {
          command = "${config.custom.autostart.command}/bin/niri-session";
          user = "andi";
        };
      };
    };
  };
}
