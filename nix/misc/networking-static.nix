{ config, lib, ... }:
{

  options.custom.misc.networking = {
    enable = lib.mkEnableOption "static networking for faster bootup :)";
    interfaceName = lib.mkOption {
      type = lib.types.uniq lib.types.str;
      description = "use `ip a` in order to find out your correct interface Name.";
    };
  };

  config = lib.mkIf config.custom.misc.networking.enable {
    networking = {
      useNetworkd = true;
      useDHCP = false;
    };
    systemd.network.networks."20-wired" = {
      matchConfig.Name = config.custom.misc.networking.interfaceName;
      networkConfig.DHCP = "yes";
    };
  };
}
