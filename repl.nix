# File: repl.nix
{
  hostname ? "Gartroc",
  namespace ? "custom",
  username ? "andi",
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in
rec {
  inherit (flake.inputs) nixpkgs;
  inherit (flake) inputs lib self;
  inherit
    flake
    namespace
    username
    ;

  # Default
  default = flake.nixosConfigurations.${hostname}.config;
  defaultY = default.${namespace};
  defaultHM = default.home-manager.users.${username};
  defaultHMY = defaultHM.${namespace};
}
