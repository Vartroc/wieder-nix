{ config, ... }:

{
  # Enable the CUPS printing service
  services.printing.enable = true;

  # You can also enable cups-browsed for automatic printer discovery
  services.printing.browsed.enable = true;
}
