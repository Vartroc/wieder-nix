{ config, lib, ... }:
{
  options.custom.fish.enable = lib.mkEnableOption "fish";
  config = lib.mkIf config.custom.fish.enable {

    programs.fish = {
      enable = true;
      interactiveShellInit = "set fish_greeting";
      shellInit = ''
        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n "<nix-shell>"
          end
        )
        echo -n -s "$nix_shell_info ~>"


      '';
      shellAliases = {
        n = "nvim";
        rb = "nh os switch";

      };
    };
  };
}
