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
	
	
        settings = lib.mkMerge [ 
	  (lib.mkIf config.programs.niri.enable {
	  # --- Niri ---
          default_session = {
            command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${config.programs.niri.package}/bin/niri-session'";
            user = "greeter";
          };

          initial_session = {
            command = "${config.programs.niri.package}/bin/niri-session";
            user = "andi";
          };
        })



	  (lib.mkIf config.programs.hyprland.enable {
	# --- Hyprland ---
	 /*{
          default_session = {
            command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd '${pkgs.hyprland}/bin/Hyprland'";
            user = "greeter";
          };

          initial_session = {
            command = "${pkgs.hyprland}/bin/Hyprland";
            user = "andi";
          };
        }; */
	})
      ];

      };
    })

    (lib.mkIf config.custom.autologin.enable {
      #services.getty.autologinUser = "andi";
    })
  ];
}
